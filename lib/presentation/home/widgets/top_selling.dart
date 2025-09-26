import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_state.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/domain/product/usecases/get_top_selling.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetTopSellingUseCase>())
            ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(),
                SizedBox(height: 20.h),
                _products(state.products),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _topSelling() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "Top Selling",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(productEntity: products[index]);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: products.length,
      ),
    );
  }
}
