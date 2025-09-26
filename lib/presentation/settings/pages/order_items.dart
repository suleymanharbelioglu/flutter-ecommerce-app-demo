import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/presentation/settings/widgets/order_item_card.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderItemsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false, title: Text("Order Items")),
      body: _products(),
    );
  }

  _products() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return OrderItemCard(productOrderedEntity: products[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: products.length,
    );
  }
}
