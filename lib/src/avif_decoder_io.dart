import 'dart:math';
import 'dart:typed_data';

import 'package:dart_avif_decoder/src/rust/frb_generated.dart';

import 'avif_image.dart';

Future<List<AvifFrameInfo>> decodeAvif(Uint8List bytes) async {
  await RustLib.init();

  final key = Random().nextInt(4294967296);
  final codec = MultiFrameAvifCodec(key: key, avifBytes: bytes);
  await codec.ready();

  final List<AvifFrameInfo> frames = [];
  for (int i = 0; i < codec.frameCount; i += 1) {
    final frame = await codec.getNextFrame();
    frames.add(frame);
  }

  codec.dispose();
  return frames;
}
