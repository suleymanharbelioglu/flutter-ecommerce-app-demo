import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/order.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailPage({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text("Order ${orderEntity.code}"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            SizedBox(height: 50),
            _items(context),
            SizedBox(height: 30),
            _shipping(),
          ],
        ),
      ),
    );
  }

  _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: orderEntity.orderStatus[index].done
                        ? AppColors.primary
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: orderEntity.orderStatus[index].done
                      ? Icon(Icons.check)
                      : Container(),
                ),
                SizedBox(width: 15),
                Text(
                  orderEntity.orderStatus[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: orderEntity.orderStatus[index].done
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              orderEntity.orderStatus[index].createdDate
                  .toDate()
                  .toString()
                  .split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: orderEntity.orderStatus[index].done
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: orderEntity.orderStatus.length,
    );
  }

  _items(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Itmes",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            // Order Items Page
          },
          child: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.receipt_rounded),
                    SizedBox(width: 20),
                    Text(
                      "${orderEntity.products.length} Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
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

  _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(orderEntity.shippingAddress),
        ),
      ],
    );
  }
}
