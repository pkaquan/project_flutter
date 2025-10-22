// import 'package:go_router/go_router.dart';
// import 'package:projectiot/features/authentication/presentation/pages/login_screen.dart';
// import 'package:projectiot/features/firestore/presentation/pages/home_page.dart';
// import 'package:projectiot/splash_screen.dart';

// class AppRouter {
//   static final GoRouter router = GoRouter(
//     initialLocation: '/',
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (context, state) => const LoginScreen(),
//       ),
//       GoRoute(
//         path: '/home/:uid',
//         builder: (context, state){
//           final uid = state.pathParameters['uid']!;
//           return  HomePage(uid: uid);
//         } ,
//       ),
//     ],
//   );
// }