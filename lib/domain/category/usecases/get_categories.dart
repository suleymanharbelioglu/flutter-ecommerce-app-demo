import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/category/repository/category_repository.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class GetCategoriesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
