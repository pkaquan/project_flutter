import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormEdit extends StatelessWidget {
  final String textLable;
  final String textHint;
  final TextEditingController textEditingController;
  const FormEdit({
    super.key,
    required this.textLable,
    required this.textHint,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(width: 1.w),
        ),
        hintText: textHint,
        hintStyle: TextStyle(fontSize: 14.sp),
        label: Text(textLable, style: TextStyle(fontSize: 18.sp)),
      ),
      controller: textEditingController,
    );
  }
}
