import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/data/order/model/add_to_cart_req.dart';
import 'package:flutter_ecommerce_app/domain/order/repository/order.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class AddToCartUseCase extends UseCase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await sl<OrderRepository>().addToCart(params!);
  }
}
