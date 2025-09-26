import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        productEntity.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
    );
  }
}
