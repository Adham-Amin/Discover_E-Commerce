import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:discover/core/services/secure_storage.dart';
import 'package:discover/core/utils/app_assets.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/core/widgets/width_sized.dart';
import 'package:discover/features/account/presentation/widgets/account_item.dart';
import 'package:discover/features/account/presentation/widgets/divider_account.dart';
import 'package:discover/features/auth/presentation/manager/cubit/delete_user_cubit.dart';
import 'package:discover/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) {
        if (state is DeleteUserLoaded) {
          customSnackBar(
            context: context,
            message: '${state.user.emailUser} has been deleted',
            type: AnimatedSnackBarType.success,
          );
          SecureStorage.delete(key: 'token');
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.routeName,
            (route) => false,
          );
        }
        if (state is DeleteUserError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: Column(
        children: [
          HeightSized(height: 10.h),
          AccountItem(icon: AppAssets.imagesIconBox, title: 'My Orders'),
          Divider(height: 48.h, color: AppColors.secondary, thickness: 8),
          AccountItem(icon: AppAssets.imagesIconDetails, title: 'My Details'),
          DividerAcount(),
          AccountItem(icon: AppAssets.imagesIconAddress, title: 'Address Book'),
          DividerAcount(),
          AccountItem(icon: AppAssets.imagesIconQuestion, title: 'FAQs'),
          DividerAcount(),
          AccountItem(
            icon: AppAssets.imagesIconHeadphones,
            title: 'Help Center',
          ),
          Divider(height: 48.h, color: AppColors.gray, thickness: 8),
          Expanded(child: HeightSized(height: 24.h)),
          GestureDetector(
            onTap: () {
              SecureStorage.delete(key: 'token');
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginView.routeName,
                (route) => false,
              );
            },
            child: Row(
              children: [
                WidthSized(width: 24.w),
                Image.asset(
                  AppAssets.imagesIconLogout,
                  width: 24.h,
                  height: 24.h,
                ),
                WidthSized(width: 16),
                Text(
                  'Logout',
                  style: AppStyles.textRegular16.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          DividerAcount(),
          GestureDetector(
            onTap: () {
              BlocProvider.of<DeleteUserCubit>(context).deleteUser(id: 1);
            },
            child: Row(
              children: [
                WidthSized(width: 24.w),
                Icon(Icons.cancel_outlined, color: Colors.red, size: 24.sp),
                WidthSized(width: 16),
                Text(
                  'Delete Account',
                  style: AppStyles.textRegular16.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          HeightSized(height: 24.h),
        ],
      ),
    );
  }
}
