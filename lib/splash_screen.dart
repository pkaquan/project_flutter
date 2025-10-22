import 'package:flutter/material.dart';

import 'config/images/asset_image_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetImageData.domotics),
      ),
    );
  }
}
