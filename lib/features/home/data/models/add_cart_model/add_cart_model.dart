import 'package:discover/features/home/domain/entities/add_cart_entity.dart';

import 'product.dart';

class AddCartModel extends AddCartEntity {
  int? id;
  List<Product>? products;
  double? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  AddCartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  }) : super(name: products?[0].title ?? '', count: products?[0].quantity ?? 0);

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
    id: json['id'] as int?,
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
    total: (json['total'] as num?)?.toDouble(),
    discountedTotal: json['discountedTotal'] as int?,
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
