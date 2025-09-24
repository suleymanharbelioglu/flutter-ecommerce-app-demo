import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/order/model/add_to_cart_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartReq addToCartReq);

}