import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/order.dart';
import 'package:flutter_ecommerce_app/presentation/settings/bloc/orders_display_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/settings/bloc/orders_display_state.dart';
import 'package:flutter_ecommerce_app/presentation/settings/pages/order_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text(
          "My Orders",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => OrdersDisplayCubit()..displayOrders(),
        child: BlocBuilder<OrdersDisplayCubit, OrdersDisplayState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is OrdersLoaded) {
              return _orders(state.orders);
            }
            if (state is LoadOrdersFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(fontSize: 16.sp),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _orders(List<OrderEntity> orders) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              OrderDetailPage(orderEntity: orders[index]),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order #${orders[index].code}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "${orders[index].products.length} item",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 20.sp),
              ],
            ),
          ),
        );
      },
    );
  }
}
