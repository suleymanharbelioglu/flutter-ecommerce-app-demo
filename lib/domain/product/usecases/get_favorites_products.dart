import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/product/repository/product.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class GetFavoritesProductsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getFavoritesProducts();
  }
}
