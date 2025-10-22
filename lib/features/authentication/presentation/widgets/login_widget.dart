import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_event.dart';
import 'package:projectiot/features/authentication/presentation/controllers/button_edit.dart';
import 'package:projectiot/features/authentication/presentation/controllers/form_edit.dart';
import 'package:projectiot/features/authentication/presentation/controllers/form_hidden.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController textEditingControllerEmail;
  final TextEditingController textEditingControllerPassword;
  final VoidCallback onPress;
  const LoginWidget({
    super.key,
    required this.textEditingControllerEmail,
    required this.textEditingControllerPassword,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEmailResetPassword =
        TextEditingController();
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
                textHint: 'Nhập mật khẩu',
                textEditingController: textEditingControllerPassword,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(horizontal: 32.h),
          child: TextButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: FormEdit(
                  textLable: 'Email',
                  textHint: 'Nhập Email',
                  textEditingController: textEmailResetPassword,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Huỷ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        ResetPassword(textEmailResetPassword.text),
                      );
                      launchUrl(Uri.parse("https://mail.google.com/"));
                      Navigator.pop(context);
                    },
                    child: Text('Gửi'),
                  ),
                ],
              ),
            ),
            child: Text(
              'Quên mật khẩu',
              style: TextStyle(fontSize: 14.sp, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          child: ButtonEdit(onPress: onPress, textButton: 'Đăng nhập'),
        ),
      ],
    );
  }
}
