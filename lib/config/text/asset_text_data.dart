import 'package:flutter/services.dart';

class AssetTextData {
  static Future<String> text() async {
    return rootBundle.loadString('assets/text/privacy.txt');
  }
}
