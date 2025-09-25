import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/order/repository/order.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class RemoveCartProductUseCase extends UseCase<Either,String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<OrderRepository>().removeCartProduct(params!);
  }
}