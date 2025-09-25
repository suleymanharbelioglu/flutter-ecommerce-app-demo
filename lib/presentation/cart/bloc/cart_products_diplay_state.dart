import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';

abstract class CartProductsDiplayState {}

class CartProductsLoading extends CartProductsDiplayState {}

class CartProductsLoaded extends CartProductsDiplayState {
  final List<ProductOrderedEntity> products;

  CartProductsLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductsDiplayState {
  final String errorMessage;

  LoadCartProductsFailure({required this.errorMessage});
}
