import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';

class AlertFire extends StatelessWidget {
  const AlertFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Thiết bị báo cháy'),
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
              leading: Image.asset(AssetImageData.mq2),
              title: Text('Cảm biến khí gas'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Cảm biến khí MQ-2\n'
                        'Điện áp hoạt động : 5VDC\n'
                        'Phạm vi : Rộng\n'
                        'Độ nhạy : Rất nhạy\n'
                        'Chức năng : Phát hiện khí dễ cháy\n'
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
              leading: Image.asset(AssetImageData.buzzer),
              title: Text('Còi báo cháy'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Mạch Buzzer Còi\n'
                        'Điện áp hoạt động : 3.3~5VDC\n'
                        'Chức năng : hệ thống báo hiệu, báo trộm\n'
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
              leading: Image.asset(AssetImageData.pin),
              title: Text('Pin nguồn'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Pin Lithium 18650\n'
                        'Điện áp : 3.7V\n'
                        'Dung lượng: 3000mAh\n'
                        'Chức năng : Cấp nguồn cho mạch hoạt động\n'
                        'Giá bán : ~40.000đ',
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
              leading: Image.asset(AssetImageData.basePin),
              title: Text('Đế Pin'),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thông số'),
                      content: Text(
                        'Tên thiết bị : Đế 3 Pin\n'
                        'Chức năng : Đựng pin để cấp nguồn có 2 dây đỏ(+) và đen(-)\n'
                        'Giá bán : ~40.000đ',
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
