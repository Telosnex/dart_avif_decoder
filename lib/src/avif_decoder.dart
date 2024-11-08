export 'avif_decoder_stub.dart'
    if (dart.library.js_interop) 'avif_decoder_web.dart'
    if (dart.library.io) 'avif_decoder_io.dart';
