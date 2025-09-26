import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/helper/cart/cart.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/presentation/cart/pages/checkaout.dart';

class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const Checkout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _rowItem(
            "Subtotal",
            "\$${CartHelper.calculateCartSubtotal(products)}",
          ),
          _rowItem("Shipping Cost", "\$8"),
          _rowItem("Tax", "\$0.0"),
          _rowItem(
            "Total",
            "\$${CartHelper.calculateCartSubtotal(products) + 8}",
            isBold: true,
          ),
          BasicAppButton(
            onPressed: () {
              AppNavigator.push(context, CheckaoutPage(products: products));
            },
            title: "Checkout",
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
