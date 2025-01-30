import 'dart:math';
import 'dart:typed_data';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image/image.dart%20';

Future<Uint8List> resizeImage(String filePath, int width, int height) async {
  final originData = await File(filePath).readAsBytes();

  final image = img.decodeImage(originData);

  if (image == null) {
    return originData;
  }

  final ratio = min(width / image.width, height / image.height);

  if (ratio >= 1) {
    // image is smaller than the required dimensions, no need to resize
    return originData;
  }

  final newWidth = (image.width * ratio).round();
  final newHeight = (image.height * ratio).round();

  final result = img.copyResize(image,
      width: newWidth,
      height: newHeight,
      interpolation: img.Interpolation.cubic);

  final data = img.encodeJpg(
    result,
    quality: 90,
    chroma: JpegChroma.yuv420,
  );

  final file = File(filePath + '.resized.png');

  await file.writeAsBytes(data, flush: true);

  return data;
}
