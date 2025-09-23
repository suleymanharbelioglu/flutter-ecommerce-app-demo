import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/product_sizes.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedSize({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizeSelectionCubit>(context),
            child: ProductSizes(productEntity: productEntity),
          ),
        );
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Size",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return Text(productEntity.sizes[state]);
                  },
                ),
                SizedBox(width: 15),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
