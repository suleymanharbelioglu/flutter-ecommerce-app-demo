import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: _textEditingController,
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<ProductsDisplayCubit>().displayInitial();
          } else {
            context.read<ProductsDisplayCubit>().displayProducts(params: value);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          prefixIcon: SvgPicture.asset(
            AppVectors.search,
            fit: BoxFit.none,
            width: 24.w,
            height: 24.h,
          ),
          hintText: "search",
          hintStyle: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
