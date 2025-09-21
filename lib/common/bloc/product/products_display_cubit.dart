import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_state.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';

class ProductsDisplayCubit extends Cubit<ProductDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit(  {required this.useCase}) : super(ProductsInitialState());
  Future<void> displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    Either returnedData = await useCase.call(params: params);

    returnedData.fold(
      (error) {
        emit(ProductsLoadFailure());
      },
      (data) {
        emit(ProductsLoaded(products: data));
      },
    );
  }
}
