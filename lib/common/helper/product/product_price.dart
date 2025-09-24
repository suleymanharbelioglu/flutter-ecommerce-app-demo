import 'package:flutter_ecommerce_app/domain/product/entity/product.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}
