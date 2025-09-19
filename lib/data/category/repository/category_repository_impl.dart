import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/category/model/category.dart';
import 'package:flutter_ecommerce_app/data/category/source/category_firebase_service.dart';
import 'package:flutter_ecommerce_app/domain/category/repository/category_repository.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();

    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => CategoryModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
