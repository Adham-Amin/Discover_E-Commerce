import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:discover/features/home/data/repos/home_repo_impl.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:discover/features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:discover/features/home/presentation/manager/delete_product_cubit/delete_product_cubit.dart';
import 'package:discover/features/home/presentation/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final ProductEntity product;
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => DeleteProductCubit(
                homeRepo: HomeRepoImpl(
                  remoteHomeDataSource: RemoteHomeDataSourceImpl(
                    apiService: ApiService(Dio()),
                  ),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => AddToCartCubit(
                homeRepo: HomeRepoImpl(
                  remoteHomeDataSource: RemoteHomeDataSourceImpl(
                    apiService: ApiService(Dio()),
                  ),
                ),
              ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                'Details',
                style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<DeleteProductCubit>().deleteProduct(
                      id: product.idProduct,
                    );
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                ),
              ],
            ),
            body: BlocListener<DeleteProductCubit, DeleteProductState>(
              listener: (context, state) {
                if (state is DeleteProductLoaded) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: state.product.message,
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is DeleteProductError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              child: ProductViewBody(product: product),
            ),
          );
        },
      ),
    );
  }
}
