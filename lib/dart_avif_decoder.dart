library dart_avif_decoder;

export 'src/avif_decoder_stub.dart'
    if (dart.library.js_interop) 'src/avif_decoder_web.dart'
    if (dart.library.io) 'src/avif_decoder_io.dart';
