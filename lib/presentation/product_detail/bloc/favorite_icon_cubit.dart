import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/is_favorite.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  Future<void> isFavorite(String productId) async {
    var result = await sl<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  Future<void> onTap(ProductEntity product) async {
    var result = await sl<AddOrRemoveFavoriteProductUseCase>().call(
      params: product,
    );
    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
