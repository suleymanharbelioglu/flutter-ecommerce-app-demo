import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_images.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/presentation/home/pages/home.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.orderPlaced,
              width: 200.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 60.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order Placed Successfully",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  BasicAppButton(
                    onPressed: () {
                      AppNavigator.pushAndRemove(context, HomePage());
                    },
                    width: 200.w,
                    title: "Finish",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
