import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_state.dart';
import 'package:flutter_ecommerce_app/common/helper/cart/cart.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:flutter_ecommerce_app/data/order/model/order_registration_req.dart';
import 'package:flutter_ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:flutter_ecommerce_app/domain/order/usecases/order_registration.dart';
import 'package:flutter_ecommerce_app/presentation/cart/pages/order_placed.dart';

class CheckaoutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckaoutPage({super.key, required this.products});
  final TextEditingController _addressCon = TextEditingController(
    text: "address bla bla ",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false, title: Text("Checkout")),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context, OrderPlaced());
            }
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _addressFiled(context),
                    BasicReactiveButton(
                      onPressed: () {
                        context.read<ButtonStateCubit>().execute(
                          usecase: OrderRegistrationUseCase(),
                          params: OrderRegistrationReq(
                            products: products,
                            createdDate: DateTime.now().toString(),
                            shippingAdress: _addressCon.text,
                            itemCount: products.length,
                            totalPrice: CartHelper.calculateCartSubtotal(
                              products,
                            ),
                          ),
                        );
                      },
                      content: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${CartHelper.calculateCartSubtotal(products)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Place order",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _addressFiled(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: InputDecoration(hintText: "Shipping Address"),
    );
  }
}
