import 'package:dio/dio.dart';
import 'package:discover/core/services/api_service.dart';
import 'package:discover/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:discover/features/auth/data/repos/auth_repo_impl.dart';
import 'package:discover/features/auth/presentation/manager/auth_cubit.dart';
import 'package:discover/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => AuthCubit(
              authRepo: AuthRepoImpl(
                remoteAuthDataSource: RemoteAuthDataSourceImpl(
                  apiService: ApiService(Dio()),
                ),
              ),
            ),
        child: SignUpViewBody(),
      ),
    );
  }
}
