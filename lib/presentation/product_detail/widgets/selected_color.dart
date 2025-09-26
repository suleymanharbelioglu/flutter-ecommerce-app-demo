import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/product_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorSelectionCubit>(context),
            child: ProductColors(productEntity: productEntity),
          ),
        );
      },
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Color",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          productEntity.colors[state].rgb[0],
                          productEntity.colors[state].rgb[1],
                          productEntity.colors[state].rgb[2],
                          1,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                SizedBox(width: 15.w),
                Icon(Icons.keyboard_arrow_down, size: 30.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
