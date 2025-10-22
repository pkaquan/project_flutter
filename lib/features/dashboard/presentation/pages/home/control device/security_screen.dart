import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/core/di/injection.dart';
import 'package:projectiot/core/service/local_notification_service.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityScreen extends StatefulWidget {
  final String uid;
  const SecurityScreen({super.key, required this.uid});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('An ninh'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            sl<FirestoreBloc>()..add(SecurityEvent(widget.uid)),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://photos.google.com/"));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  child: Text(
                    'Truy cập Google Photos',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 40),
                BlocBuilder<FirestoreBloc, FirestoreState>(
                  builder: (context, state) {
                    if (state is SecurityState) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Text(
                              state.state.state
                                  ? 'Cảnh báo! Ngôi nhà có dấu hiệu đột nhập, vui lòng nhấn vào Google Photos để kiểm tra'
                                  : 'Ngôi nhà đang trong tình trạng an toan',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            SizedBox(height: 40),
                            Image.asset(
                              state.state.state
                                  ? AssetImageData.danger
                                  : AssetImageData.safe,
                            ),
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
