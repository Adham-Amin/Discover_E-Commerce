import 'package:discover/features/home/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  int? id;
  String? title;

  AddProductModel({this.id, this.title}) : super(name: title ?? '');

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}
