import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/data/order/model/order_registration_req.dart';
import 'package:flutter_ecommerce_app/domain/order/repository/order.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class OrderRegistrationUseCase extends UseCase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}
