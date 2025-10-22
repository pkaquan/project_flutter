import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectiot/features/authentication/presentation/pages/login_screen.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/pages/home_page.dart';
import 'package:projectiot/splash_screen.dart';

import 'core/di/injection.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/bloc/auth_event.dart';
import 'features/authentication/presentation/bloc/auth_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  void initSplashScreen() async {}
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()..add(InitAppEvent())),
        BlocProvider(
          create: (context) => sl<FirestoreBloc>()..add(StartDashboardEvent()),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            home: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthChangeState) {
                  context.read<AuthBloc>().add(AppStartEvent());
                }
                if (state is LogOutState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
                // if (state is AuthenticatedState) {
                //   sl<FirestoreBloc>().add(
                //     AppStateLocalNotificationEvent(state.user.uid),
                //   );
                // }
              },

              builder: (context, state) {
                if (state is AuthInitial) {
                  return SplashScreen();
                }
                if (state is AuthenticatedState) {
                  return HomePage(uid: state.user.uid, email: state.user.email);
                } else if (state is UnAuthenticated) {
                  return LoginScreen();
                } else {
                  return LoginScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
