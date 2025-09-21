import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/repository/product.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class AddOrRemoveFavoriteProductUseCase implements UseCase<Either,ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
   return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }
}