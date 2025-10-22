import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';

class DeviceStatusHome extends StatelessWidget {
  const DeviceStatusHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Thiết bị trạng thái ngôi nhà'),
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
              leading: Image.asset(AssetImageData.dht21),
              title: Text('Cảm biến nhiệt độ và độ ẩm DHT21'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Cảm biến DHT21\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Khoảng đo nhiệt độ : -40 ℃ ~ 80 ℃\n'
                        'Chức năng : Đo nhiệt độ và độ ẩm không khí\n'
                        'Giá bán : ~90.000đ',
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
              leading: Image.asset(AssetImageData.dht22),
              title: Text('Cảm biến nhiệt độ và độ ẩm DHT22'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Cảm biến DHT22\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Khoảng đo nhiệt độ : -40 ℃ ~ 80 ℃\n'
                        'Chức năng : Đo nhiệt độ và độ ẩm không khí (độ ẩm được đo chính xác hơn dht21)'
                        'Giá bán : ~90.000đ',
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
              leading: Image.asset(AssetImageData.lcdOled),
              title: Text('Màn hình OLED 1.3 inch'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Màn hình OLED 1.3inch\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Độ rộng màn hình : 1.3 inch\n'
                        'Chức năng : Hiển thị thông số '
                        'Giá bán : ~75.000đ',
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
              leading: Image.asset(AssetImageData.relay),
              title: Text('Mạch Bật/Tắt 8 thiết bị'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Module Relay 8 kênh\n'
                        'Điện áp hoạt động : 12VDC\n'
                        'Chức năng : Bật/Tắt các thiết bị cần điều khiển\n'
                        'Giá bán : ~70.000đ',
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
