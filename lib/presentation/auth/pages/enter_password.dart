import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final TextEditingController _passwordCon = TextEditingController(
    text: "suley.2000",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _siginText(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(context),
                const SizedBox(height: 20),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: signinReq,
            );
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
          const TextSpan(text: "Forgot password? "),
          TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
