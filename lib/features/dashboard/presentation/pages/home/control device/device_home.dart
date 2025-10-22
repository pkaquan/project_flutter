import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';

class DeviceHome extends StatefulWidget {
  final String uid;

  const DeviceHome({super.key, required this.uid});

  @override
  State<DeviceHome> createState() => _DeviceHomeState();
}

class _DeviceHomeState extends State<DeviceHome> {
  List<TextEditingController> textNameDevice = List.generate(
    8,
    (_) => TextEditingController(),
  );
  List<bool> listToggleSwitch = List.generate(8, (_) => false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FirestoreBloc>()..add(StateDeviceHouseEvent(widget.uid)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Bật/Tắt thiết bị'),
          centerTitle: true,
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade50, Colors.pink.shade100],
            ),
          ),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) =>
                BlocListener<FirestoreBloc, FirestoreState>(
                  listener: (context, state) {
                    if (state is ControlDeviceHouseState) {
                      setState(() {
                        textNameDevice[index].text = state.device[index].name;
                        listToggleSwitch[index] = state.device[index].state;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textNameDevice[index],
                              decoration: InputDecoration(
                                hintText: 'Nhập tên thiết bị',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.save),
                            onPressed: () {
                              context.read<FirestoreBloc>().add(
                                SaveNameDeviceHouseEvent(
                                  widget.uid,
                                  textNameDevice[index].text,
                                  index + 1,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          listToggleSwitch[index] ? 'ON' : 'OFF',

                          style: TextStyle(
                            color: listToggleSwitch[index]
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      trailing: Switch(
                        value: listToggleSwitch[index],
                        onChanged: (value) {
                          context.read<FirestoreBloc>().add(
                            ControlDeviceHouseEvent(
                              widget.uid,
                              value,
                              index + 1,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
