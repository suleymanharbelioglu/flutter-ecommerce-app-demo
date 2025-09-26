import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/order.dart';
import 'package:flutter_ecommerce_app/presentation/settings/pages/order_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailPage({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text(
          "Order ${orderEntity.code}",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            SizedBox(height: 50.h),
            _items(context),
            SizedBox(height: 30.h),
            _shipping(),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      itemCount: orderEntity.orderStatus.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        final status = orderEntity.orderStatus[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: status.done ? AppColors.primary : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: status.done ? Icon(Icons.check, size: 18.sp) : null,
                ),
                SizedBox(width: 15.w),
                Text(
                  status.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: status.done ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              status.createdDate.toDate().toString().split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: status.done ? Colors.white : Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _items(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Items",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              OrderItemsPage(products: orderEntity.products),
            );
          },
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.receipt_rounded, size: 24.sp),
                    SizedBox(width: 20.w),
                    Text(
                      "${orderEntity.products.length} Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 15.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            orderEntity.shippingAddress,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
