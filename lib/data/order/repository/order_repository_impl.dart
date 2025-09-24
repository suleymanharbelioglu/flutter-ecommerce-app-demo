import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/order/model/add_to_cart_req.dart';
import 'package:flutter_ecommerce_app/data/order/source/order_firebase_service.dart';
import 'package:flutter_ecommerce_app/domain/order/repository/order.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class OrderRepositoryImpl  extends OrderRepository{
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
   return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }
}