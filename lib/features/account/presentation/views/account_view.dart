import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/features/account/presentation/widgets/account_view_body.dart';
import 'package:discover/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:discover/features/auth/data/repos/auth_repo_impl.dart';
import 'package:discover/features/auth/presentation/manager/cubit/delete_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Account',
          style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create:
            (context) => DeleteUserCubit(
              authRepo: AuthRepoImpl(
                remoteAuthDataSource: RemoteAuthDataSourceImpl(
                  apiService: ApiService(Dio()),
                ),
              ),
            ),
        child: const AccountViewBody(),
      ),
    );
  }
}
