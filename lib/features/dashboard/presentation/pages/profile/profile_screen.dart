import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_event.dart';
import 'package:projectiot/features/dashboard/presentation/pages/profile/list/privacy_screen.dart';
import 'package:projectiot/features/dashboard/presentation/pages/profile/list/user_profile_screen.dart';
import 'package:projectiot/features/dashboard/presentation/widgets/button_inkwell.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;
  final String email;
  const ProfileScreen({super.key, required this.uid, required this.email});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.blue.shade50,
          Colors.blue.shade100,
          Colors.blue.shade200,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(AssetImageData.editProfile)],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonInkwell(
                textLable: 'Thông tin tài khoản',
                iconButton: Icon(Icons.person),
                onSuccess: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserProfileScreen(uid: uid, email: email),
                    ),
                  );
                },
              ),
              ButtonInkwell(
                textLable: 'Hướng dẫn lắp đặt thiết bị',
                iconButton: Icon(Icons.device_hub_sharp),
                onSuccess: () {},
              ),
              ButtonInkwell(
                textLable: 'Chính sách và điều khoản',
                iconButton: Icon(Icons.note_alt),
                onSuccess: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyScreen(),
                    ),
                  );
                },
              ),
              ButtonInkwell(
                textLable: 'Thoát',
                iconButton: Icon(Icons.login),
                onSuccess: () {
                  context.read<AuthBloc>().add(LogOutEvent());
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
