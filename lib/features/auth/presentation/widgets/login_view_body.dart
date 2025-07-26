import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/auth/presentation/views/sign_up_view.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
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
              CustomTextFormField(hintText: 'user name'),
              HeightSized(height: 16),
              Text('Password', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(isPassword: true, hintText: 'password'),
              HeightSized(height: 48),
              CustomButton(
                title: 'Sign In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              HeightSized(height: 24),
              Center(
                child: CustomTextRich(
                  textOne: 'Don’t have an account? ',
                  textTwo: 'Join',
                  onTap:
                      () => Navigator.pushNamed(context, SignUpView.routeName),
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
