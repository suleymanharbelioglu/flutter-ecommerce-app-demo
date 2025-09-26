import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/helper/images/image_display.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.sh,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          return Container(
            width: 0.5.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  ImageDisplayHelper.generateProductImageURL(
                    productEntity.images[index],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.w);
        },
        itemCount: productEntity.images.length,
      ),
    );
  }
}
