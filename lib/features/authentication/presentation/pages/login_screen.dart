import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_event.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_state.dart';
import 'package:projectiot/features/authentication/presentation/widgets/login_widget.dart';
import 'package:projectiot/features/authentication/presentation/widgets/register_widget.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home_page.dart';

import '../../../../config/images/asset_image_data.dart';
import '../../../dashboard/presentation/bloc/firestore_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController textEditingControllerEmailLogin =
      TextEditingController();
  final TextEditingController textEditingControllerPasswordLogin =
      TextEditingController();
  final TextEditingController textEditingControllerEmailRegister =
      TextEditingController();
  final TextEditingController textEditingControllerPasswordRegister =
      TextEditingController();
  bool toggleSwitch = true;

  @override
  void dispose() {
    textEditingControllerEmailLogin.dispose();
    textEditingControllerPasswordLogin.dispose();
    textEditingControllerEmailRegister.dispose();
    textEditingControllerPasswordRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
              height: isKeyboardVisible ? 100.h : 270.h,
              child: toggleSwitch
                  ? Image.asset(AssetImageData.signIn)
                  : Image.asset(AssetImageData.signUp),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    SizedBox(
                      child: SizedBox(
                        child: AnimatedToggleSwitch<bool>.size(
                          current: toggleSwitch,
                          values: const [true, false],
                          iconOpacity: 0.2.sp,
                          indicatorSize: Size.fromWidth(100.w),
                          customIconBuilder: (context, local, global) => Text(
                            local.value ? 'Đăng nhập' : 'Đăng kí',
                            style: TextStyle(
                              color: Color.lerp(
                                Colors.black,
                                Colors.white,
                                local.animationValue,
                              ),
                            ),
                          ),
                          borderWidth: 1.w,
                          style: ToggleStyle(
                            indicatorColor: Colors.red,
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black, spreadRadius: 1.w),
                            ],
                          ),
                          selectedIconScale: 1.sp,
                          styleAnimationType: AnimationType.onHover,
                          onChanged: (value) {
                            setState(() {
                              toggleSwitch = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: toggleSwitch
                          ? BlocListener<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is LoginSuccessState) {
                                  sl<FirestoreBloc>().add(
                                    UpdateTokenNotificationEvent(
                                      state.userEntity.uid,
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        uid: state.userEntity.uid,
                                        email: state.userEntity.email,
                                      ),
                                    ),
                                  );
                                } else if (state is MessageErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.message.message),
                                    ),
                                  );
                                }
                              },
                              child: LoginWidget(
                                textEditingControllerEmail:
                                    textEditingControllerEmailLogin,
                                textEditingControllerPassword:
                                    textEditingControllerPasswordLogin,
                                onPress: () => context.read<AuthBloc>().add(
                                  LoginEvent(
                                    textEditingControllerEmailLogin.text,
                                    textEditingControllerPasswordLogin.text,
                                  ),
                                ),
                              ),
                            )
                          : BlocListener<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is RegisterSuccessState) {
                                  sl<FirestoreBloc>().add(
                                    InitDataEvent(
                                      state.userEntity.uid,
                                      state.userEntity.email,
                                    ),
                                  );
                                } else if (state is MessageErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.message.message),
                                    ),
                                  );
                                }
                              },
                              child: RegisterWidget(
                                textEditingControllerEmail:
                                    textEditingControllerEmailRegister,
                                textEditingControllerPassword:
                                    textEditingControllerPasswordRegister,
                                onPress: () {
                                  context.read<AuthBloc>().add(
                                    RegisterEvent(
                                      textEditingControllerEmailRegister.text,
                                      textEditingControllerPasswordRegister
                                          .text,
                                    ),
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        'Vui lòng kiểm tra hòm thư Gamil, nhấn vào link để xác thực',
                                      ),
                                      content: Image.asset(
                                        AssetImageData.emailSuccess,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Huỷ'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () => context
                                              .read<AuthBloc>()
                                              .add(SendVerificationEmail()),
                                          child: Text('Gửi lại'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
