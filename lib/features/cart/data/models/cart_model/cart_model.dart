import 'package:discover/features/cart/domain/entities/cart_entity.dart';

import 'product_cart_model.dart';

class CartModel extends CartEntity {
  int? id;
  List<ProductCartModel>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  CartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  }) : super(
         product: products ?? [],
         totalPrice: total ?? 0.0,
         discount: discountedTotal ?? 0.0,
         countProducts: totalProducts ?? 0,
         countQuantity: totalQuantity ?? 0,
       );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['id'] as int?,
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => ProductCartModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    total: (json['total'] as num?)?.toDouble(),
    discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
    userId: json['userId'] as int?,
    totalProducts: json['totalProducts'] as int?,
    totalQuantity: json['totalQuantity'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'products': products?.map((e) => e.toJson()).toList(),
    'total': total,
    'discountedTotal': discountedTotal,
    'userId': userId,
    'totalProducts': totalProducts,
    'totalQuantity': totalQuantity,
  };
}
