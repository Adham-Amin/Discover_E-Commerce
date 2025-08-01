import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/custom_loading.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/auth/presentation/manager/auth_cubit.dart';
import 'package:discover/features/auth/presentation/manager/auth_state.dart';
import 'package:discover/features/auth/presentation/views/sign_up_view.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:discover/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSized(height: 60),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Login to your account',
                style: AppStyles.textSemiBold32,
              ),
            ),
            HeightSized(height: 6),
            Text(
              'It’s great to see you again.',
              style: AppStyles.textRegular16.copyWith(
                color: AppColors.secondary,
              ),
            ),
            HeightSized(height: 24),
            Text('User Name', style: AppStyles.textMedium16),
            HeightSized(height: 4),
            CustomTextFormField(
              onSaved: (user) => email = user!,
              hintText: 'user name',
            ),
            HeightSized(height: 16),
            Text('Password', style: AppStyles.textMedium16),
            HeightSized(height: 4),
            CustomTextFormField(
              onSaved: (pass) => password = pass!,
              isPassword: true,
              hintText: 'password',
            ),
            HeightSized(height: 48),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                } else if (state is AuthLoaded) {
                  Navigator.pushReplacementNamed(context, MainView.routeName);
                  customSnackBar(
                    context: context,
                    message: 'Hello ${state.name}',
                    type: AnimatedSnackBarType.success,
                  );
                }
              },
              builder: (context, state) {
                return state is AuthLoading
                    ? CustomLoading()
                    : CustomButton(
                      title: 'Sign In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(
                            context,
                          ).login(email: email, password: password);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
              },
            ),
            Expanded(child: HeightSized(height: 24)),
            Center(
              child: CustomTextRich(
                textOne: 'Don’t have an account? ',
                textTwo: 'Join',
                onTap: () => Navigator.pushNamed(context, SignUpView.routeName),
              ),
            ),
            HeightSized(height: 12),
          ],
        ),
      ),
    );
  }
}
