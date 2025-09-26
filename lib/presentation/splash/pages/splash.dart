import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter_ecommerce_app/presentation/home/pages/home.dart';
import 'package:flutter_ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushAndRemove(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushAndRemove(context, HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo,
            width: 150.w, // responsive width
            height: 150.h, // responsive height
          ),
        ),
      ),
    );
  }
}
