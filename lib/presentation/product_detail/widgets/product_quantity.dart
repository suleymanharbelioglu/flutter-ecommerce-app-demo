import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuantity({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quantity",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(child: Icon(Icons.remove, size: 30)),
                ),
              ),
              SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  );
                },
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(child: Icon(Icons.add, size: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
