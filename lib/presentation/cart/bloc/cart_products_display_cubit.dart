import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/domain/order/usecases/get_cart_products.dart';
import 'package:flutter_ecommerce_app/domain/order/usecases/remove_cart_product.dart';
import 'package:flutter_ecommerce_app/presentation/cart/bloc/cart_products_diplay_state.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDiplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      },
    );
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData = await sl<RemoveCartProductUseCase>().call(
      params: product.id,
    );
    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}
