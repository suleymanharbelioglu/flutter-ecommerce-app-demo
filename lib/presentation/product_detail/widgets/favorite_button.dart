import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(productEntity);
      },
      icon: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) {
            return Icon(
              state ? Icons.favorite : Icons.favorite_outline,
              size: 15.sp,
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
