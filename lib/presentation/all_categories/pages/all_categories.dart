import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/bloc/category/categories_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/category/categories_display_state.dart';
import 'package:flutter_ecommerce_app/common/helper/images/image_display.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/presentation/category_products/pages/category_products.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _shopByCategories(),
              SizedBox(height: 10.h),
              _categories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return Text(
      "Shop by Categories",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.categories.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return GestureDetector(
                onTap: () {
                  AppNavigator.push(
                    context,
                    CategoryProductsPage(categoryEntity: category),
                  );
                },
                child: Container(
                  height: 70.h,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              ImageDisplayHelper.generateCategoryImageURL(
                                category.image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        category.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
