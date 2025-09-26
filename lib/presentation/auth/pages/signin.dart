import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter_ecommerce_app/data/auth/model/user_signin_req.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/enter_password.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCon = TextEditingController(
    text: "harba.suleyman@gmail.com",
  );

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: GestureDetector(
        onTap: () => FocusScope.of(
          context,
        ).unfocus(), 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _siginText(context),
                SizedBox(height: 20.h),
                _emailField(context),
                SizedBox(height: 20.h),
                _continueButton(context),
                SizedBox(height: 20.h),
                _createAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32.sp, 
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _emailCon,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!regex.hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Enter Email',
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          AppNavigator.push(
            context,
            EnterPasswordPage(signinReq: UserSigninReq(email: _emailCon.text)),
          );
        }
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't you have an account? ",
            style: TextStyle(fontSize: 14.sp),
          ),
          TextSpan(
            text: 'Create one',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
