import 'package:web/web.dart';
import 'dart:js_interop';
import 'dart:typed_data';
import 'dart:async';

class WebAvifDecoder {
  Future<({int width, int height, Uint8ClampedList bytes})> decodeAvif(
      Uint8List bytes) async {
    try {
      // Create the blob with proper MIME type
      final blobProperties = BlobPropertyBag(type: 'image/avif');
      final parts = [bytes.toJS].toJS;
      final blob = Blob(parts, blobProperties);

      // Try direct bitmap creation first
      ImageBitmap bitmap;
      try {
        bitmap = await window.createImageBitmap(blob).toDart;
      } catch (e) {
        // If direct creation fails, try with an image element
        final img = document.createElement('img') as HTMLImageElement;
        final url = URL.createObjectURL(blob);

        final completer = Completer<void>();
        img.onload = ((JSAny _) => completer.complete()).toJS;
        img.onerror =
            ((JSAny e) => completer.completeError('Image load failed')).toJS;

        img.src = url;
        await completer.future;

        bitmap = await window.createImageBitmap(img).toDart;
        URL.revokeObjectURL(url);
      }

      // Create canvas and draw the image
      final canvas = document.createElement('canvas') as HTMLCanvasElement;
      canvas.width = bitmap.width;
      canvas.height = bitmap.height;

      final ctx = canvas.getContext('2d') as CanvasRenderingContext2D;
      ctx.drawImage(bitmap, 0, 0);
      final width = bitmap.width;
      final height = bitmap.height;
      // Get the pixel data
      final imageData = ctx.getImageData(0, 0, width, height);
      final dartImageData = imageData.data.toDart;

      // Clean up
      bitmap.close();

      print(
          'AVIF decoded successfully. Width: $width, Height: $height Bytes: ${dartImageData.length}');

      return (
        width: width,
        height: height,
        bytes: dartImageData,
      );
    } catch (e, stackTrace) {
      print('AVIF decode error: $e');
      print('Stack trace: $stackTrace');

      // Check browser support
      final supported = await checkAvifSupport();
      if (!supported) {
        throw UnsupportedError(
          'This browser does not support AVIF decoding. '
          'Please check browser compatibility.',
        );
      }

      rethrow;
    }
  }

  Future<bool> checkAvifSupport() async {
    final img = document.createElement('img') as HTMLImageElement;
    final completer = Completer<bool>();

    img.onload = ((JSAny _) => completer.complete(true)).toJS;
    img.onerror = ((JSAny _) => completer.complete(false)).toJS;

    // A 1x1 transparent AVIF image
    img.src =
        'data:image/avif;base64,AAAAIGZ0eXBhdmlmAAAAAGF2aWZtaWYxbWlhZk1BMUIAAADybWV0YQAAAAAAAAAoaGRscgAAAAAAAAAAcGljdAAAAAAAAAAAAAAAAGxpYmF2aWYAAAAADnBpdG0AAAAAAAEAAAAeaWxvYwAAAABEAAABAAEAAAABAAABGgAAAB0AAAAoaWluZgAAAAAAAQAAABppbmZlAgAAAAABAABhdjAxQ29sb3IAAAAAamlwcnAAAABLaXBjbwAAABRpc3BlAAAAAAAAAAIAAAACAAAAEHBpeGkAAAAAAwgICAAAAAxhdjFDgQ0MAAAAABNjb2xybmNseAACAAIAAYAAAAAXaXBtYQAAAAAAAAABAAEEAQKDBAAAACVtZGF0EgAKCBgANogQEAwgMg8f8D///8WfhwB8+ErK42A=';

    return completer.future;
  }
}
