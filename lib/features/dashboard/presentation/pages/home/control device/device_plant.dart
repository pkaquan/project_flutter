import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/core/service/local_notification_service.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DevicePlant extends StatefulWidget {
  final String uid;
  const DevicePlant({super.key, required this.uid});

  @override
  State<DevicePlant> createState() => _DevicePlantState();
}

class _DevicePlantState extends State<DevicePlant> {
  List<int> timeduring = [1, 2, 3, 4, 5];
  int? onSelect;
  bool stateWatering = false;
  bool toggleSwitch = false;
  int valueLevel = 85;
  int hour = 0;
  int minute = 0;

  int humidity = 0;
  int getValueLevel = 85;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<FirestoreBloc>()..add(StateWateringPlantEvent(widget.uid)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Hệ thống tưới cây'),
          centerTitle: true,
        ),
        body: BlocListener<FirestoreBloc, FirestoreState>(
          listener: (context, state) {
            if (state is StatePlantState) {
              setState(() {
                humidity = state.wateringPlant.humidityPlant;
                toggleSwitch = state.wateringPlant.button;
                stateWatering = state.wateringPlant.statePump;
                valueLevel = state.wateringPlant.speedMotor;
                hour = state.wateringPlant.hourSetTime;
                minute = state.wateringPlant.minuteSetTime;
                onSelect = state.wateringPlant.timer;
              });
            }
            if (state is MessageDataState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã thiết lập thiết bị thành công')),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade50,
                  Colors.green.shade100,
                  Colors.green.shade200,
                ],
                begin: AlignmentGeometry.topCenter,
              ),
            ),
            alignment: Alignment.center,

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 160.h,
                        width: 160.w,
                        child: SleekCircularSlider(
                          initialValue: humidity.toDouble(),
                          appearance: CircularSliderAppearance(
                            infoProperties: InfoProperties(
                              bottomLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              bottomLabelText: 'Độ ẩm đất',
                              mainLabelStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            startAngle: 135,
                            angleRange: 270,
                            animationEnabled: true,
                          ),
                          min: 0,
                          max: 100,
                        ),
                      ),
                      SizedBox(
                        height: 160.h,
                        width: 160.w,
                        child: Column(
                          children: [
                            Switch(
                              value: toggleSwitch,
                              onChanged: (value) => setState(() {
                                toggleSwitch = value;
                              }),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'Trạng thái : ',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  Text(
                                    stateWatering ? 'Bật' : 'Tắt',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            AnimatedToggleSwitch<int>.size(
                              indicatorSize: Size.fromWidth(60.w),
                              iconList: [
                                Text(
                                  'Nhỏ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Vừa',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Mạnh',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                              style: ToggleStyle(
                                backgroundGradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.green,
                                    Colors.purple,
                                  ],
                                ),
                                indicatorColor: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                                indicatorBorder: Border.all(width: 0.5),
                              ),
                              current: valueLevel,
                              values: const [85, 170, 255],
                              onChanged: (value) => setState(() {
                                valueLevel = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Thiết lập hẹn giờ tưới cây',
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(height: 20.h),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        minValue: 0,
                        maxValue: 23,
                        value: hour,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            hour = value;
                          });
                        },
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.sp,
                        ),
                        selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'Giờ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(fontSize: 30.sp, color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        value: minute,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            minute = value;
                          });
                        },
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.sp,
                        ),
                        selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'Phút',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thời gian tưới cây : ',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      DropdownButton2<int>(
                        hint: Text('Chọn'),
                        items: timeduring
                            .map(
                              (int time) => DropdownMenuItem<int>(
                                value: time,
                                child: Text(
                                  '$time phút',
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                            )
                            .toList(),
                        value: onSelect,
                        onChanged: (int? value) {
                          setState(() {
                            onSelect = value;
                          });
                        },
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    context.read<FirestoreBloc>().add(
                      ControlMotorEvent(
                        widget.uid,
                        toggleSwitch,
                        valueLevel,
                        hour,
                        minute,
                        onSelect!,
                      ),
                    );
                  },
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
