import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/helper/images/image_display.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const ProductOrderedCard({super.key, required this.productOrderedEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          ImageDisplayHelper.generateProductImageURL(
                            productOrderedEntity.productImage,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productOrderedEntity.productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      Row(
                        children: [
                          _textInfo(
                            title: "Size - ",
                            value: productOrderedEntity.productSize,
                          ),
                          SizedBox(width: 10.w),
                          _textInfo(
                            title: "Color - ",
                            value: productOrderedEntity.productColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${productOrderedEntity.totalPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CartProductsDisplayCubit>().removeProduct(
                      productOrderedEntity,
                    );
                  },
                  child: Container(
                    height: 23.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFF8383),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.remove, size: 15.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textInfo({required String title, required String value}) {
    return Text.rich(
      TextSpan(
        text: title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
