import 'package:discover/core/services/api_service.dart';
import 'package:discover/features/home/data/models/product_model/product_model.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';

abstract class RemoteHomeDataSource {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> getProductCategory({required String category});
  Future<List<ProductEntity>> search({required String q});
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
}
