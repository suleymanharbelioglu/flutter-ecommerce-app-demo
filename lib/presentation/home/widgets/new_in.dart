import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_newIn(), SizedBox(height: 20), _products()],
    );
  }

  Widget _newIn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "New In",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }

  _products() {
    return Container(
      height: 300,
      // color: Colors.red,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: 10,
      ),
    );
  }
}
