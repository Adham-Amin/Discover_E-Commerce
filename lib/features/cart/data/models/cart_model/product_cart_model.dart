import 'package:discover/features/cart/domain/entities/products_cart_entity.dart';

class ProductCartModel extends ProductsCartEntity {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  ProductCartModel({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  }) : super(
         name: title ?? '',
         image: thumbnail ?? '',
         priceProduct: price ?? 0,
         count: quantity ?? 0,
       );

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        quantity: json['quantity'] as int?,
        total: (json['total'] as num?)?.toDouble(),
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
    'total': total,
    'discountPercentage': discountPercentage,
    'discountedTotal': discountedTotal,
    'thumbnail': thumbnail,
  };
}
