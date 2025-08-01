import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/custom_loading.dart';
import 'package:discover/core/widgets/custom_snack_bar.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/auth/presentation/manager/auth_cubit.dart';
import 'package:discover/features/auth/presentation/manager/auth_state.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:discover/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String userName, email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSized(height: 60),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Create an account',
                  style: AppStyles.textSemiBold32,
                ),
              ),
              HeightSized(height: 6),
              Text(
                'Let’s create your account.',
                style: AppStyles.textRegular16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              HeightSized(height: 24),
              Text('Email', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(
                hintText: 'email',
                onSaved: (data) => email = data!,
              ),
              HeightSized(height: 16),
              Text('User Name', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(
                hintText: 'user name',
                onSaved: (data) => userName = data!,
              ),
              HeightSized(height: 16),
              Text('Password', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(
                isPassword: true,
                hintText: 'password',
                onSaved: (data) => password = data!,
              ),
              HeightSized(height: 48),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoaded) {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(MainView.routeName);
                    customSnackBar(
                      context: context,
                      message: 'Account created successfully.',
                      type: AnimatedSnackBarType.success,
                    );
                  }
                  if (state is AuthError) {
                    customSnackBar(
                      context: context,
                      message: state.message,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return state is AuthLoading
                      ? const CustomLoading()
                      : CustomButton(
                        title: 'Create Account',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<AuthCubit>().signup(
                              username: userName,
                              email: email,
                              password: password,
                            );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      );
                },
              ),
              HeightSized(height: 24),
              Center(
                child: CustomTextRich(
                  textOne: 'Already have an account? ',
                  textTwo: 'Log In',
                  onTap: () => Navigator.pop(context),
                ),
              ),
              HeightSized(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
