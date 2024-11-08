import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dart_avif_decoder/src/avif_image.dart';
import 'package:dart_avif_decoder/src/web_avif_decoder.dart';


Future<List<AvifFrameInfo>> decodeAvif(Uint8List bytes) async {
  final sizeAndBytes = await WebAvifDecoder().decodeAvif(bytes);
  final completer = Completer<List<AvifFrameInfo>>();
  ui.decodeImageFromPixels(
    sizeAndBytes.bytes.buffer.asUint8List(),
    sizeAndBytes.width,
    sizeAndBytes.height,
    ui.PixelFormat.rgba8888,
    (image) {
      completer.complete(
          [AvifFrameInfo(duration: const Duration(seconds: 0), image: image)]);
    },
  );
  return completer.future;
}
