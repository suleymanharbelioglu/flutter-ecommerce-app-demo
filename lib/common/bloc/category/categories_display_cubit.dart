import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/category/categories_display_state.dart';
import 'package:flutter_ecommerce_app/domain/category/usecases/get_categories.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  Future<void> displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(LoadCategoriesFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
