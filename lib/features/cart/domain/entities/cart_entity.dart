import 'package:discover/features/cart/domain/entities/products_cart_entity.dart';

class CartEntity {
  final List<ProductsCartEntity> product;
  final double totalPrice;
  final double discount;
  final int countProducts;
  final int countQuantity;

  CartEntity({
    required this.product,
    required this.totalPrice,
    required this.discount,
    required this.countProducts,
    required this.countQuantity,
  });
}