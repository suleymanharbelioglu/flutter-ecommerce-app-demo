import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_state.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:flutter_ecommerce_app/data/auth/model/user_signin_req.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/forgot_password.dart';
import 'package:flutter_ecommerce_app/presentation/home/pages/home.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({super.key, required this.signinReq});
  final _formKey = GlobalKey<FormState>();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonSuccessState) {
                  AppNavigator.pushAndRemove(context, HomePage());
                }
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _siginText(),
                    SizedBox(height: 20.h),
                    _passwordField(),
                    SizedBox(height: 20.h),
                    _continueButton(context),
                    SizedBox(height: 20.h),
                    _forgotPassword(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText() {
    return Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32.sp, // responsive font
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordField() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _passwordCon,
        obscureText: true, // şifre gizlensin
        decoration: InputDecoration(
          hintText: 'Enter Password',
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Password is required';
          if (value.length < 6) return 'Password must be at least 6 characters';
          return null;
        },
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              signinReq.password = _passwordCon.text;
              context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: signinReq,
              );
            }
          },
          title: 'Continue',
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Forgot password? ",
            style: TextStyle(fontSize: 14.sp),
          ),
          TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
              },
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
