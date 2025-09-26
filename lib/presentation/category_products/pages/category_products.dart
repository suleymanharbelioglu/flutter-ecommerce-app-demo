import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_state.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';
import 'package:flutter_ecommerce_app/domain/category/entity/category.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/get_product_by_category_id.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryProductsPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(useCase: sl<GetProductByCategoryIdUseCase>())
              ..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryInfo(state.products),
                    SizedBox(height: 10.h),
                    Expanded(child: _products(state.products)),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      "${categoryEntity.title} (${products.length})",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
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
