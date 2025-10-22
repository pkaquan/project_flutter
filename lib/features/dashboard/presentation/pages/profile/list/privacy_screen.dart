import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/text/asset_text_data.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chính sách & điều khoản'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 26.w),
        child: FutureBuilder<String>(
          future: AssetTextData.text(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Text(snapshot.data!, style: TextStyle(fontSize: 16.sp)),
            );
          },
        ),
      ),
    );
  }
}
