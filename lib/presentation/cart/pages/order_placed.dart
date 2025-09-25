import 'package:flutter/material.dart';
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
            child: Image.asset(AppImages.orderPlaced),
          ),
          SizedBox(height: 60),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order Placed Successfully",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  BasicAppButton(
                    onPressed: () {
                      AppNavigator.pushAndRemove(context, HomePage());
                    },
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
