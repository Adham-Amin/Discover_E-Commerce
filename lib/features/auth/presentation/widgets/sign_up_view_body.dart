import 'package:discover/core/utils/app_colors.dart';
import 'package:discover/core/utils/app_styles.dart';
import 'package:discover/core/widgets/custom_button.dart';
import 'package:discover/core/widgets/height_sized.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:discover/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
              Text('Full Name', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(hintText: 'full name'),
              HeightSized(height: 16),
              Text('User Name', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(hintText: 'user name'),
              HeightSized(height: 16),
              Text('Password', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(isPassword: true, hintText: 'password'),
              HeightSized(height: 16),
              Text('Confirm Password', style: AppStyles.textMedium16),
              HeightSized(height: 4),
              CustomTextFormField(
                isPassword: true,
                hintText: 'confirm password',
              ),
              HeightSized(height: 48),
              CustomButton(
                title: 'Create Account',
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
