import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/favorite_button.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/product_image.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/product_price.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/product_title.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/selected_color.dart';
import 'package:flutter_ecommerce_app/presentation/product_detail/widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FavoriteIconCubit()..isFavorite(productEntity.productId),
        ),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: FavoriteButton(productEntity: productEntity),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(productEntity: productEntity),
              SizedBox(height: 10),
              ProductTitle(productEntity: productEntity),
              SizedBox(height: 10),
              ProductPrice(productEntity: productEntity),
              SizedBox(height: 10),
              SelectedSize(productEntity: productEntity),
              SizedBox(height: 10),
              SelectedColor(productEntity: productEntity),
            ],
          ),
        ),
      ),
    );
  }
}
