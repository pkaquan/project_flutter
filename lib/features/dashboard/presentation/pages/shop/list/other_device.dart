import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';

class OtherDevice extends StatelessWidget {
  const OtherDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Các loại thiết bị khác'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 80.h,
            margin: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(width: 1.5.w, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: ListTile(
              leading: Image.asset(AssetImageData.esp32),
              title: Text('Vi điều khiển trung tâm'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Vi điều khiển ESP32-S3\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Tích hợp : WiFi, Bluetooth\n'
                        'Bộ nhớ : 16MB Flash và 8MB PSRAM\n'
                        'Chức năng : Vi xử lí trung tâm điều khiển thiết bị\n'
                        'Giá bán : Vui lòng liên hệ nhà phát triển để trao đổi',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  );
                },
                child: Text('Chi tiết', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 80.h,
            margin: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(width: 1.5.w, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: ListTile(
              leading: Image.asset(AssetImageData.cam),
              title: Text('Vi điều khiển camera'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Vi điều khiển ESP32-CAM\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Tích hợp : WiFi, Bluetooth\n'
                        'Bộ nhớ : 4MB Flash và 520KB PSRAM\n'
                        'Chức năng : Vi điều khiển xử lí camera\n'
                        'Giá bán : Vui lòng liên hệ nhà phát triển để trao đổi',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  );
                },
                child: Text('Chi tiết', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 80.h,
            margin: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(width: 1.5.w, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: ListTile(
              leading: Image.asset(AssetImageData.moduleChange),
              title: Text('Mạch chuyển đổi điện áp'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : AMS1117 Mạch Chuyển Đổi Điện Áp DC\n'
                        'Điện áp đầu vào : 6~12VDC\n'
                        'Điện áp đầu ra 3.3V,5V,12VDC\n'
                        'Chức năng : Chuyển đổi dòng đa năng\n'
                        'Giá bán : ~10.000đ',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  );
                },
                child: Text('Chi tiết', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
