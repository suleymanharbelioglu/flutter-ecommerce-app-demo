import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emailSending(),
            SizedBox(height: 30.h),
            _sentEmail(),
            SizedBox(height: 30.h),
            _returnToLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: SvgPicture.asset(
        AppVectors.emailSending,
        width: 150.w,
        height: 150.h,
      ),
    );
  }

  Widget _sentEmail() {
    return Center(
      child: Text(
        'We Sent you an Email to reset your password.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SigninPage());
      },
      width: 200.w,
      title: 'Return to Login',
    );
  }
}
