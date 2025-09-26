import 'package:flutter_ecommerce_app/data/order/model/order_status.dart';
import 'package:flutter_ecommerce_app/data/order/model/product_ordered.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAdress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;
  OrderRegistrationReq({
    required this.products,
    required this.createdDate,
    required this.shippingAdress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "products": products.map((e) => e.fromEntity().toMap()).toList(),
      "createdDate": createdDate,
      "itemCount": itemCount,
      "totalPrice": totalPrice,
      "shippingAddress": shippingAdress,
      "code": code,
      "orderStatus": orderStatus.map((e) => e.toMap()).toList(),
    };
  }
}
