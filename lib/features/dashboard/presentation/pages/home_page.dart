import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home/home_screen.dart';
import 'package:projectiot/features/dashboard/presentation/pages/notification/notification_screen.dart';
import 'package:projectiot/features/dashboard/presentation/pages/profile/profile_screen.dart';
import 'package:projectiot/features/dashboard/presentation/pages/shop/shop_screen.dart';

class HomePage extends StatefulWidget {
  final String uid;
  final String email;

  const HomePage({super.key, required this.uid, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectBar = 0;
  List<Widget> get index => [
    HomeScreen(email: widget.email, uid: widget.uid),
    NotificationScreen(uid: widget.uid),
    ShopScreen(),
    ProfileScreen(uid: widget.uid, email: widget.email),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 50.h,
        elevation: 0,
        selectedIndex: selectBar,
        onDestinationSelected: (index) {
          setState(() {
            selectBar = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Trang chủ'),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            label: 'Mua sắm',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Thông tin'),
        ],
      ),
      body: index[selectBar],
    );
  }
}
