import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonEdit extends StatelessWidget {
  final VoidCallback onPress;
  final String textButton;
  const ButtonEdit({super.key, required this.onPress, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor:
          WidgetStatePropertyAll(
            Colors.red,
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(290.w, 40.h),
          ),
        ),
        child: Text(
          textButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      );
  }
}
