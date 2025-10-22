import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormHidden extends StatefulWidget {
  final String textLable;
  final String textHint;
  final TextEditingController textEditingController;
  const FormHidden({
    super.key,
    required this.textLable,
    required this.textHint,
    required this.textEditingController,
  });

  @override
  State<FormHidden> createState() => _FormHiddenState();
}

class _FormHiddenState extends State<FormHidden> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(width: 1.w),
        ),
        hintText: widget.textHint,
        hintStyle: TextStyle(fontSize: 14.sp),
        label: Text(widget.textLable, style: TextStyle(fontSize: 18.sp)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              toggle = !toggle;
            });
          },
          child: Icon(
            toggle ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
          ),
        ),
      ),
      controller: widget.textEditingController,
      obscureText: !toggle,
    );
  }
}
