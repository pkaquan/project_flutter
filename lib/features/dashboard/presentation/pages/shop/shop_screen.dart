import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/config/images/asset_image_data.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/list/alert_fire.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/list/device_control.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/list/device_status_home.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/list/other_device.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/list/security.dart';
import 'package:projectiot/features/dashboard/presentation/widgets/button_inkwell.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) => Container(
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
    child: Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset(AssetImageData.shopDevice),
          SizedBox(height: 10),
          ButtonInkwell(
            textLable: 'Thiết bị trạng thái ngôi nhà',
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeviceStatusHome()),
              );
            },
            iconButton: Image.asset(AssetImageData.remoteDeviceIcon),
          ),
          ButtonInkwell(
            textLable: 'Thiết bị tưới cây',
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeviceControl()),
              );
            },
            iconButton: Image.asset(AssetImageData.controlDeviceMotorIcon),
          ),
          ButtonInkwell(
            textLable: 'Thiết bị báo cháy',
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertFire()),
              );
            },
            iconButton: Image.asset(AssetImageData.deviceAlertIcon),
          ),
          ButtonInkwell(
            textLable: 'Thiết bị báo chống trộm',
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Security()),
              );
            },
            iconButton: Image.asset(AssetImageData.deviceSecurityIcon),
          ),
          ButtonInkwell(
            textLable: 'Các loại thiết bị khác',
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OtherDevice()),
              );
            },
            iconButton: Image.asset(AssetImageData.deviceDiffirentIcon),
          ),
          SizedBox(
            child: Column(
              children: [
                Text(
                  'Cửa hàng linh kiện điện tử có thể tham khảo :',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://hshop.vn/"));
                  },
                  child: Text('Hshop'),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://dientutuyetnga.com/"));
                  },
                  child: Text('Dien tu Tuyet Nga'),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://dientunguyenhien.vn/"));
                  },
                  child: Text('Dien tu Nguyen Hien'),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://dientubachviet.com/"));
                  },
                  child: Text('Dien tu Bach Viet'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
