import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtonEdit extends StatelessWidget {
  final VoidCallback callback;
  final List<Color> boxColor;
  final String imageButton;
  final String lableButton;
  final Color boxShadowColor;
  const MyButtonEdit({
    super.key,
    required this.callback,
    required this.boxColor,
    required this.imageButton,
    required this.lableButton,
    required this.boxShadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        height: 250.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: boxColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),

          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [BoxShadow(color: boxShadowColor, offset: Offset(4, 4))],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageButton),
                    SizedBox(height: 60.h),
                    Text(
                      lableButton,
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  
  }
}
