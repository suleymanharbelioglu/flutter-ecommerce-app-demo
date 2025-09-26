import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/UI/ui.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/firebase_options.dart';
import 'package:flutter_ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/splash/pages/splash.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  // await addSampleProductsToFirestore();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: ScreenUtilInit(
        designSize: const Size(411.43, 731.43),
        minTextAdapt: true,
        builder: (context, child) {
          UIHelper.logScreenSize(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            title: 'Flutter Ecommerce',
            home: child,
          );
        },
        child: const SplashPage(),
      ),
    );
  }
}
