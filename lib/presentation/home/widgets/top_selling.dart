import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/product/product_card.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_topSelling(), SizedBox(height: 20), _products()],
    );
  }

  Widget _topSelling() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Top Selling",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _products() {
    return Container(
      // color: Colors.grey,
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
      ),
    );
  }
}
