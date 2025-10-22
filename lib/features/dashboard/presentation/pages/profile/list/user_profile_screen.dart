import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';

class UserProfileScreen extends StatefulWidget {
  final String uid;
  final String email;
  const UserProfileScreen({super.key, required this.uid, required this.email});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textNameEditingController =
        TextEditingController();
    final TextEditingController textPhoneEditingController =
        TextEditingController();
    return BlocProvider(
      create: (context) =>
          sl<FirestoreBloc>()..add(StateProfileEvent(widget.uid)),
      child: BlocListener<FirestoreBloc, FirestoreState>(
        listener: (context, state) {
          if (state is ProfileState) {
            textNameEditingController.text = state.profile.name;
            textPhoneEditingController.text = state.profile.phone;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Thông tin tài khoản'),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Image.asset(AssetImageData.profileEdit)),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 24.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        alignment: Alignment.centerLeft,
                        height: 40.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          border: Border.all(width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        child: Text(
                          widget.email,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(width: 1.w),
                          ),
                          hintText: 'Tên tài khoản',
                          hintStyle: TextStyle(fontSize: 14.sp),
                        ),
                        controller: textNameEditingController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(width: 1.w),
                          ),
                          hintText: 'Số điện thoại',
                          hintStyle: TextStyle(fontSize: 14.sp),
                        ),
                        controller: textPhoneEditingController,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 40.h),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<FirestoreBloc>().add(
                        SaveProfileEvent(
                          widget.uid,
                          textNameEditingController.text,
                          textPhoneEditingController.text,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Lưu',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
