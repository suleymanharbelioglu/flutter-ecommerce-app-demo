import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/presentation/cart/bloc/cart_products_diplay_state.dart';
import 'package:flutter_ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/cart/widgets/checkout.dart';
import 'package:flutter_ecommerce_app/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false, title: Text("Cart")),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDiplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(child: _cartIsEmpty())
                  : Stack(
                      children: [
                        _products(state.products),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Checkout(products: state.products),
                        ),
                      ],
                    );
            }
            return Container();
          },
        ),
      ),
    );
  }

  _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.cartBag),
        SizedBox(height: 20),
        Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(productOrderedEntity: products[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: products.length,
    );
  }
}
