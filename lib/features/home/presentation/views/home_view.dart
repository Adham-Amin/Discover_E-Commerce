import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:discover/features/home/data/repos/home_repo_impl.dart';
import 'package:discover/features/home/presentation/cubit/home_cubit.dart';
import 'package:discover/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeCubit(
            homeRepo: HomeRepoImpl(
              remoteHomeDataSource: RemoteHomeDataSourceImpl(
                apiService: ApiService(Dio()),
              ),
            ),
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Text('Discover', style: AppStyles.textSemiBold32),
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
