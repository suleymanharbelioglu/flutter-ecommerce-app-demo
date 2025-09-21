import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';

abstract class ProductDisplayState {}

class ProductsInitialState extends ProductDisplayState {}

class ProductsLoading extends ProductDisplayState {}

class ProductsLoaded extends ProductDisplayState {
  final List<ProductEntity> products;

  ProductsLoaded({required this.products});
}

class ProductsLoadFailure extends ProductDisplayState {}
