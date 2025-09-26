import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_state.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/get_products_by_title.dart';
import 'package:flutter_ecommerce_app/presentation/search/widgets/search_field.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          height: 80.h,
          title: SearchField(),
        ),
        body: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return state.products.isEmpty
                  ? _notFound()
                  : _products(state.products);
            }
            return Container();
          },
        ),
      ),
    );
  }

  _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.notFound, width: 150.w, height: 150.h),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            "Sorry, we couldn't find any matching result for your search",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(16.w),
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
