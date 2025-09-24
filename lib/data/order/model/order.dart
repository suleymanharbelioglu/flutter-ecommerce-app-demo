import 'package:flutter_ecommerce_app/data/order/model/order_status.dart';
import 'package:flutter_ecommerce_app/data/order/model/product_ordered.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/order.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: List<ProductOrderedModel>.from(
        map["product"].map((e) => ProductOrderedModel.fromMap(e)),
      ),
      createdDate: map["createdDate"] as String,
      shippingAddress: map["shippingAddress"] as String,
      itemCount: map["itemCount"] as int,
      totalPrice: map["totalPrice"] as double,
      code: map["code"] as String,
      orderStatus: List<OrderStatusModel>.from(
        map["orderStatus"].map((e) => OrderStatusModel.fromMap(e)),
      ),
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
