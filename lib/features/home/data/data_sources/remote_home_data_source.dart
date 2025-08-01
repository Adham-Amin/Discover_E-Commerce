import 'package:discover/core/services/api_service.dart';
import 'package:discover/features/home/data/models/add_cart_model/add_cart_model.dart';
import 'package:discover/features/home/data/models/add_product_model.dart';
import 'package:discover/features/home/data/models/delete_product_model/delete_product_model.dart';
import 'package:discover/features/home/data/models/product_model/product_model.dart';
import 'package:discover/features/home/domain/entities/add_cart_entity.dart';
import 'package:discover/features/home/domain/entities/add_product_entity.dart';
import 'package:discover/features/home/domain/entities/delete_product_entity.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';

abstract class RemoteHomeDataSource {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> getProductCategory({required String category});
  Future<List<ProductEntity>> search({required String q});
  Future<AddProductEntity> addProduct({required String title});
  Future<DeleteProductEntity> deleteProduct({required int id});
  Future<AddCartEntity> addToCart({required int id, required int quantity});
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final ApiService apiService;
  RemoteHomeDataSourceImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> getProductCategory({
    required String category,
  }) async {
    var data = await apiService.get(endPoint: '/products/category/$category');

    List<ProductEntity> products = [];
    for (var product in data['products']) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    var data = await apiService.get(endPoint: '/products');

    List<ProductEntity> products = [];
    for (var product in data['products']) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }

  @override
  Future<List<ProductEntity>> search({required String q}) async {
    var data = await apiService.get(endPoint: '/products/search?q=$q');

    List<ProductEntity> products = [];
    for (var product in data['products']) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }

  @override
  Future<AddProductEntity> addProduct({required String title}) async {
    var data = await apiService.post(
      endPoint: '/products/add',
      data: {'title': title},
    );

    AddProductEntity product = AddProductModel.fromJson(data);

    return product;
  }

  @override
  Future<DeleteProductEntity> deleteProduct({required int id}) async {
    var data = await apiService.delete(endPoint: '/products/$id');

    DeleteProductEntity product = DeleteProductModel.fromJson(data);
    return product;
  }

  @override
  Future<AddCartEntity> addToCart({
    required int id,
    required int quantity,
  }) async {
    var data = await apiService.post(
      endPoint: '/carts/add',
      data: {
        "userId": 1,
        "products": [
          {"id": id, "quantity": quantity},
        ],
      },
    );

    AddCartEntity product = AddCartModel.fromJson(data);

    return product;
  }
}
