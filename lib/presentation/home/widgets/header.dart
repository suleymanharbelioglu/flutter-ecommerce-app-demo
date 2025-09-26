import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_images.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/auth/entity/user.dart';
import 'package:flutter_ecommerce_app/presentation/cart/pages/cart.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter_ecommerce_app/presentation/settings/pages/settings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, right: 16.w, left: 16.w),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is UserInfoLoaed) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user, context),
                  _gender(state.user),
                  _card(context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, SettingsPage());
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: user.image.isEmpty
                ? AssetImage(AppImages.profile)
                : NetworkImage(user.image) as ImageProvider,
          ),
        ),
      ),
    );
  }

  _gender(UserEntity user) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? "Men" : "Women",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
      ),
    );
  }

  _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, CartPage());
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppVectors.bag, fit: BoxFit.none),
      ),
    );
  }
}
