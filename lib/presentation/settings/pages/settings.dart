import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_state.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/signout.dart';
import 'package:flutter_ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter_ecommerce_app/presentation/settings/widgets/my_favorites_tile.dart';
import 'package:flutter_ecommerce_app/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            AppNavigator.pushAndRemove(context, SigninPage());
          }
          if (state is ButtonFailureState) {
            var snackbar = SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(fontSize: 14.sp),
              ),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        child: Scaffold(
          appBar: BasicAppbar(
            hideBack: false,
            title: Text("Settings", style: TextStyle(fontSize: 18.sp)),
          ),
          bottomNavigationBar: _signoutButton(),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                MyFavoritesTile(),
                SizedBox(height: 15.h),
                MyOrdersTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signoutButton() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                usecase: sl<SignoutUseCase>(),
              );
            },
            content: Text("Signout", style: TextStyle(fontSize: 16.sp)),
          );
        },
      ),
    );
  }
}
