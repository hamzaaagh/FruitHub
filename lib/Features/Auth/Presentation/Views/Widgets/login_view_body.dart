import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/Widgets/custom_text_form_field.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/custom_divider.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/custom_rich_text_auth.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/social_auth_button.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/forget_password_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/register_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "كلمة المرور",
                obscureText: true,
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    context.push("/${ForgetPasswordView.routeName}");
                  },
                  child: Text(
                    "نسيت كلمة المرور؟",
                    style: AppStyles.bold14.copyWith(
                      color: AppColors.secondarycolor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                title: "تسجيل دخول",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPass(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              CustomRichTextAuth(
                text1: "لا تمتلك حساب؟ ",
                text2: "قم بإنشاء حساب",
                onTap: () => context.push("/${RegisterView.routeName}"),
              ),
              const SizedBox(height: 32),
              CustomDivider(),
              const SizedBox(height: 32),
              SocialAuthButton(
                title: " تسجيل بواسطة جوجل",
                image: Assets.assetsImagesGoogleIcon,
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              SocialAuthButton(
                title: "تسجيل بواسطة اّبل",
                image: Assets.assetsImagesAppleIcon,
                onPressed: () {
                  // Logic هنا
                },
              ),
              const SizedBox(height: 16),
              SocialAuthButton(
                title: "تسجيل بواسطة فيسبوك",
                image: Assets.assetsImagesFacebookIcon,
                onPressed: () {
                  // Logic هنا
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
