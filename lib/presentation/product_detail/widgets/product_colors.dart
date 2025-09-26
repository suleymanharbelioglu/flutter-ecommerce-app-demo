import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductColors({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, size: 24.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorSelectionCubit>()
                            .itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: state == index
                              ? AppColors.primary
                              : AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.colors[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      productEntity.colors[index].rgb[0],
                                      productEntity.colors[index].rgb[1],
                                      productEntity.colors[index].rgb[2],
                                      1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                state == index
                                    ? Icon(Icons.check, size: 30.sp)
                                    : Container(width: 30.w),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemCount: productEntity.colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
