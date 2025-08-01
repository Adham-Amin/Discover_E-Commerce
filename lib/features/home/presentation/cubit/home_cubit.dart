import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:discover/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getProductsCategory({required String category}) async {
    emit(HomeLoading());
    var result = await homeRepo.getProductCategory(category: category);
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(HomeLoaded(products: products)),
    );
  }

  Future<void> getProducts() async {
    emit(HomeLoading());
    var result = await homeRepo.getProducts();
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(HomeLoaded(products: products)),
    );
  }

  Future<void> search({required String q}) async {
    emit(HomeLoading());
    var result = await homeRepo.search(q: q);
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(HomeLoaded(products: products)),
    );
  }
}
