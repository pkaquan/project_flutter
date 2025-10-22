import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home/control%20device/device_home.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home/control%20device/device_plant.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home/control%20device/security_screen.dart';
import 'package:projectiot/features/dashboard/presentation/widgets/my_button_edit.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  final String email;
  const HomeScreen({super.key, required this.email, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listAssetImage = [
    AssetImageData.houseCool,
    AssetImageData.houseCold,
    AssetImageData.houseHot,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: BlocProvider(
        create: (context) =>
            sl<FirestoreBloc>()..add(UpdateStateHouseEvent(widget.uid)),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 24.w),
              child: Text('Chào mừng,', style: TextStyle(fontSize: 24.sp)),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 70.w),
              child: Row(
                children: [
                  Text('đến với ', style: TextStyle(fontSize: 24.sp)),
                  Text(
                    'AnhWanIoT',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<FirestoreBloc, FirestoreState>(
              builder: (context, state) {
                if (state is StateHouseState) {
                  return Container(
                    height: 170.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(50.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,

                          blurRadius: 10.w,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      'Nhiệt độ',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Container(
                                      margin: EdgeInsets.only(left: 4.w),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetImageData.homeTemperature,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${state.stateHouse.temperature}ºC',
                                            style: TextStyle(
                                              fontSize: 40.sp,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      'Độ ẩm',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Container(
                                      margin: EdgeInsets.only(left: 4.w),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetImageData.homeHumidity,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${state.stateHouse.humidity}%',
                                            style: TextStyle(
                                              fontSize: 40.sp,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Image.asset(
                              listAssetImage[state.stateHouse.alert],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 40.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButtonEdit(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DevicePlant(uid: widget.uid),
                        ),
                      );
                    },
                    boxColor: [
                      Colors.green.shade100,
                      Colors.green.shade200,
                      Colors.green.shade300,
                    ],
                    imageButton: AssetImageData.waterPlant,
                    lableButton: 'Tưới cây',
                    boxShadowColor: Colors.green,
                  ),
                  MyButtonEdit(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeviceHome(uid: widget.uid),
                        ),
                      );
                    },
                    boxColor: [
                      Colors.yellow.shade50,
                      Colors.yellow.shade100,
                      Colors.yellow.shade200,
                    ],
                    imageButton: AssetImageData.controlDevice,
                    lableButton: 'Thiết bị',
                    boxShadowColor: Colors.yellow,
                  ),
                  MyButtonEdit(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecurityScreen(uid: widget.uid),
                        ),
                      );
                    },
                    boxColor: [
                      Colors.red.shade50,
                      Colors.red.shade100,
                      Colors.red.shade200,
                    ],
                    imageButton: AssetImageData.security,
                    lableButton: 'An ninh',
                    boxShadowColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
