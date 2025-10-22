import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Thiết bị chống trộm'),
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
              leading: Image.asset(AssetImageData.ov5640),
              title: Text('Camera ov5640'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Camera ov5640\n'
                        'Điện áp hoạt động : 3.3VDC\n'
                        'Độ phân giải tối đa : 2592*1944\n'
                        'Chức năng : Quay và chụp cho esp32-cam\n'
                        'Giá bán : ~150.000đ',
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
              leading: Image.asset(AssetImageData.ov2640),
              title: Text('Camera ov2640'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Camera ov2640\n'
                        'Điện áp hoạt động : 3.3VDC\n'
                        'Độ phân giải tối đa : 1600*1200\n'
                        'Chức năng : Quay và chụp cho esp32-cam\n'
                        'Giá bán : ~110.000đ',
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
              leading: Image.asset(AssetImageData.hcSR),
              title: Text('Cảm biến hồng ngoại'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Cảm Biến Chuyển Động Nhiệt PIR HC-SR501\n'
                        'Điện áp hoạt động : 4.5~20VDC\n'
                        'Góc hoạt động : <100 độ\n'
                        'Chức năng : phát hiện người trong khoảng cách cho phép\n'
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
        ],
      ),
    );
  }
}
