import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';

class DeviceControl extends StatelessWidget {
  const DeviceControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Thiết bị tưới cây'),
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
              leading: Image.asset(AssetImageData.soil),
              title: Text('Cảm biến độ ẩm đất'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Cảm Biến Độ Ẩm Đất Đầu Dò Chống Ăn Mòn\n'
                        'Điện áp hoạt động : 3.3~12VDC\n'
                        'Tín hiệu đầu ra : \n'
                        '.  Analog: theo điện áp cấp nguồn tương ứng\n'
                        '.  Digital: High hoặc Low, có thể điều chỉnh độ ẩm mong muốn bằng biến trở thông qua mạch so sánh LM393 tích hợp.\n'
                        'Chức năng : Đo độ ẩm đất theo %\n'
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
              leading: Image.asset(AssetImageData.mosfet),
              title: Text('Mạch công suất'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Mạch Công Suất Mosfet LR7843\n'
                        'Điện áp hoạt động : 3-5VDC\n'
                        'Chức năng : Điều chỉnh tốc độ cho động cơ\n'
                        'Giá bán : ~20.000đ',
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
              leading: Image.asset(AssetImageData.motor),
              title: Text('Động cơ bơm công suất lớn'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : HY-4200 Động Cơ Bơm\n'
                        'Điện áp hoạt động : 12VDC\n'
                        'Lưu lượng : 6l/min\n'
                        'Chức năng : Bơm nước cho cây\n'
                        'Giá bán : 160.000~200.000đ',
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
