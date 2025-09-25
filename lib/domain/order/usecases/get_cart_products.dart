import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/order/repository/order.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class GetCartProductsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<OrderRepository>().getCartProducts();
  }
}
