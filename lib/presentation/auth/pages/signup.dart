import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter_ecommerce_app/data/auth/model/user_creation_req.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameCon = TextEditingController(
    text: "suleyman",
  );
  final TextEditingController _lastNameCon = TextEditingController(
    text: "harbelioglu",
  );
  final TextEditingController _emailCon = TextEditingController(
    text: "harba.suleyman@gmail.com",
  );
  final TextEditingController _passwordCon = TextEditingController(
    text: "cmylmZ.31",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: GestureDetector(
        onTap: () => FocusScope.of(
          context,
        ).unfocus(), // boşluğa dokununca klavye kapanır
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _siginText(),
                SizedBox(height: 20.h),
                _firstNameField(),
                SizedBox(height: 20.h),
                _lastNameField(),
                SizedBox(height: 20.h),
                _emailField(),
                SizedBox(height: 20.h),
                _passwordField(),
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

  Widget _siginText() {
    return Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32.sp, // responsive font
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField() {
    return TextFormField(
      controller: _firstNameCon,
      decoration: InputDecoration(
        hintText: 'Firstname',
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Firstname is required';
        return null;
      },
    );
  }

  Widget _lastNameField() {
    return TextFormField(
      controller: _lastNameCon,
      decoration: InputDecoration(
        hintText: 'Lastname',
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Lastname is required';
        return null;
      },
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailCon,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email Address',
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email is required';
        final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!regex.hasMatch(value)) return 'Enter a valid email';
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordCon,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Password is required';
        if (value.length < 6) return 'Password must be at least 6 characters';
        return null;
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          AppNavigator.push(
            context,
            GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
                firstName: _firstNameCon.text,
                lastName: _lastNameCon.text,
                email: _emailCon.text,
                password: _passwordCon.text,
              ),
            ),
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
            text: "Do you have an account? ",
            style: TextStyle(fontSize: 14.sp),
          ),
          TextSpan(
            text: 'Signin',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SigninPage());
              },
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
