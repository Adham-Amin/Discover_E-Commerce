import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/features/cart/data/data_source/remote_cart_data_source.dart';
import 'package:discover/features/cart/data/repo/cart_repo_impl.dart';
import 'package:discover/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:discover/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CartCubit(
            cartRepo: CartRepoImpl(
              remoteCartDataSource: RemoteCartDataSourceImpl(
                apiService: ApiService(Dio()),
              ),
            ),
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'My Cart',
            style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
          ),
          centerTitle: true,
        ),
        body: const CartViewBody(),
      ),
    );
  }
}
