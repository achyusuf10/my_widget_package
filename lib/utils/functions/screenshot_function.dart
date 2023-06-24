import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class ScreenshotFunction {
  ScreenshotFunction._();
  static Future<Uint8List?> captureWidget({required GlobalKey key}) async {
    try {
      var boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? pngByteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? sharedImageList = pngByteData?.buffer.asUint8List();
      return sharedImageList;
    } catch (e) {
      rethrow;
    }
  }
}
