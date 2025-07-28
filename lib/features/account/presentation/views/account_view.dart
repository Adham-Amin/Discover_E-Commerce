import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/features/account/presentation/widgets/account_view_body.dart';
import 'package:flutter/material.dart';
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
      body: const AccountViewBody(),
    );
  }
}