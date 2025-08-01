import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:discover/features/home/data/repos/home_repo_impl.dart';
import 'package:discover/features/home/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:discover/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:discover/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => HomeCubit(
                homeRepo: HomeRepoImpl(
                  remoteHomeDataSource: RemoteHomeDataSourceImpl(
                    apiService: ApiService(Dio()),
                  ),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => AddProductCubit(
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
              automaticallyImplyLeading: false,
              title: Text('Discover', style: AppStyles.textSemiBold32),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AddProductCubit>().addProduct(
                      title: 'Iphone 15 Pro, Blue Tetanium',
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
            body: BlocListener<AddProductCubit, AddProductState>(
              listener: (context, state) {
                if (state is AddProductError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is AddProductLoaded) {
                  customSnackBar(
                    context: context,
                    message: '${state.product.name} has been added',
                    type: AnimatedSnackBarType.success,
                  );
                }
              },
              child: HomeViewBody(),
            ),
          );
        },
      ),
    );
  }
}
