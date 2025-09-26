import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({super.key, required this.productEntity});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
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
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductSizeSelectionCubit>().itemSelection(
                          index,
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 60.h,
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
                              productEntity.sizes[index],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            state == index
                                ? Icon(Icons.check, size: 30.sp)
                                : SizedBox(width: 30.w),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: productEntity.sizes.length,
            ),
          ),
        ],
      ),
    );
  }
}
