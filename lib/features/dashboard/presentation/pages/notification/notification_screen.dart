import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';

class NotificationScreen extends StatefulWidget {
  final String uid;
  const NotificationScreen({super.key, required this.uid});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        sl<FirestoreBloc>()..add(NotificationStateEvent(widget.uid)),
    child: Scaffold(
      body: Container(
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
        child: BlocBuilder<FirestoreBloc, FirestoreState>(
          builder: (context, state) {
            if (state is NotificationState) {
              return ListView.builder(
                itemCount: state.entity.length,
                itemBuilder: (context, item) => Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  height: 70.h,
                  width: 260.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade100,
                        Colors.purple.shade200,
                        Colors.purple.shade300,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 8.w),
                          height: 50.h,
                          width: 50.w,
                          child: Image.asset(AssetImageData.domotics),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                state.entity[item].body,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Thông báo',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              Text(state.entity[item].title),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: IconButton(
          onPressed: () {
            context.read<FirestoreBloc>().add(
              RemoveNotificationEvent(widget.uid),
            );
          },
          icon: Icon(Icons.remove),
        ),
      ),
    ),
  );
}
