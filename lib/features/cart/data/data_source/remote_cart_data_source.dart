import 'package:discover/core/services/api_service.dart';
import 'package:discover/features/cart/data/models/cart_model/cart_model.dart';
import 'package:discover/features/cart/domain/entities/cart_entity.dart';

abstract class RemoteCartDataSource {
  Future<CartEntity> getCart();
}

class RemoteCartDataSourceImpl implements RemoteCartDataSource {
  final ApiService apiService;

  RemoteCartDataSourceImpl({required this.apiService});
  @override
  Future<CartEntity> getCart() async {
    var data = await apiService.get(endPoint: '/carts/5');

    CartEntity cart = CartModel.fromJson(data);
    return cart;
  }
}