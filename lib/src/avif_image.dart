import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dart_avif_decoder/src/rust/api/simple.dart' as rust;

class AvifFrameInfo {
  final Duration duration;
  final ui.Image image;

  AvifFrameInfo({required this.duration, required this.image});
}

abstract class AvifCodec {
  int get frameCount;
  int get durationMs;

  Future<void> ready();
  Future<AvifFrameInfo> getNextFrame();
  void dispose();
}

class MultiFrameAvifCodec implements AvifCodec {
  final String _key;
  late Completer<void> _ready;

  int _frameCount = 1;
  @override
  int get frameCount => _frameCount;

  int _durationMs = -1;
  @override
  int get durationMs => _durationMs;

  MultiFrameAvifCodec({
    required int key,
    required Uint8List avifBytes,
    int? overrideDurationMs = -1,
  }) : _key = key.toString() {
    _ready = Completer();
    try {
      rust.initMemoryDecoder(key: _key, avifBytes: avifBytes)
          .then((info) {
        _frameCount = info.imageCount;
        _durationMs = overrideDurationMs ?? (info.duration * 1000).round();
        _ready.complete();
      });
    } catch (e) {
      _ready.complete();
    }
  }

  @override
  ready() async {
    if (_ready.isCompleted) {
      return;
    }
    await _ready.future;
  }

  @override
  Future<AvifFrameInfo> getNextFrame() async {
    final Completer<AvifFrameInfo> completer = Completer<AvifFrameInfo>.sync();
    final String? error =
        _getNextFrame((ui.Image? image, int durationMilliseconds) {
      if (image == null) {
        completer.completeError(Exception(
            'Codec failed to produce an image, possibly due to invalid image data.'));
      } else {
        completer.complete(AvifFrameInfo(
          image: image,
          duration: Duration(milliseconds: durationMilliseconds),
        ));
      }
    });
    if (error != null) {
      throw Exception(error);
    }
    return completer.future;
  }

  String? _getNextFrame(void Function(ui.Image?, int) callback) {
    try {
      rust.getNextFrame(key: _key).then((frame) {
        ui.decodeImageFromPixels(
          frame.data,
          frame.width,
          frame.height,
          ui.PixelFormat.rgba8888,
          (image) {
            callback(image, (frame.duration * 1000).round());
          },
        );
      });
      return null;
    } catch (e) {
      callback(null, 0);
      return e.toString();
    }
  }

  @override
  void dispose() {
    rust.disposeDecoder(key: _key);
  }
}

class SingleFrameAvifCodec implements AvifCodec {
  @override
  int get frameCount => 1;

  @override
  int get durationMs => -1;

  final Uint8List _bytes;

  SingleFrameAvifCodec({
    required Uint8List bytes,
  }) : _bytes = bytes;

  @override
  Future<void> ready() async {}

  @override
  Future<AvifFrameInfo> getNextFrame() async {
    final Completer<AvifFrameInfo> completer = Completer<AvifFrameInfo>.sync();
    final String? error =
        _getNextFrame((ui.Image? image, int durationMilliseconds) {
      if (image == null) {
        completer.completeError(Exception(
            'Codec failed to produce an image, possibly due to invalid image data.'));
      } else {
        completer.complete(AvifFrameInfo(
          image: image,
          duration: Duration(milliseconds: durationMilliseconds),
        ));
      }
    });
    if (error != null) {
      throw Exception(error);
    }
    return completer.future;
  }

  String? _getNextFrame(void Function(ui.Image?, int) callback) {
    try {
      rust.decodeSingleFrameImage(avifBytes: _bytes).then((frame) {
        ui.decodeImageFromPixels(
          frame.data,
          frame.width,
          frame.height,
          ui.PixelFormat.rgba8888,
          (image) {
            callback(image, (frame.duration * 1000).round());
          },
        );
      });
      return null;
    } catch (e) {
      callback(null, 0);
      return e.toString();
    }
  }

  @override
  void dispose() {}
}
