import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/features/authentication/presentation/controllers/button_edit.dart';
import 'package:projectiot/features/authentication/presentation/controllers/form_edit.dart';
import 'package:projectiot/features/authentication/presentation/controllers/form_hidden.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController textEditingControllerEmail;
  final TextEditingController textEditingControllerPassword;
  final VoidCallback onPress;
  const RegisterWidget({
    super.key,
    required this.textEditingControllerEmail,
    required this.textEditingControllerPassword,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              FormEdit(
                textLable: 'Email',
                textHint: 'Nhập Email',
                textEditingController: textEditingControllerEmail,
              ),
              SizedBox(height: 10.h),
              FormHidden(
                textLable: 'Mật khẩu',
                textHint: 'Nhập mật khẩu (>6 kí tự)',
                textEditingController: textEditingControllerPassword,
              ),
            ],
          ),
        ),
        SizedBox(height: 60.h),
        SizedBox(
          child: ButtonEdit(onPress: onPress, textButton: 'Đăng kí'),
        ),
      ],
    );
  }
}
