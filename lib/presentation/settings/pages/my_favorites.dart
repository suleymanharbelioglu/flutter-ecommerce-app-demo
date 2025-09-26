import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_state.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/get_favorites_products.dart';
import 'package:flutter_ecommerce_app/presentation/cart/bloc/cart_products_diplay_state.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text(
          "My Favorites",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(useCase: sl<GetFavoritesProductsUseCase>())
              ..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return _products(state.products);
            }
            if (state is LoadCartProductsFailure) {
              return Center(
                child: Text(
                  "Please try again",
                  style: TextStyle(fontSize: 16.sp),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }
}
