import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonInkwell extends StatelessWidget {
  final String textLable;
  final Widget iconButton;
  final VoidCallback onSuccess;
  const ButtonInkwell({
    super.key,
    required this.textLable,
    required this.iconButton,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSuccess,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 55.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconButton,
            Text(textLable, style: TextStyle(fontSize: 13.sp)),
            Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  
  }
}
