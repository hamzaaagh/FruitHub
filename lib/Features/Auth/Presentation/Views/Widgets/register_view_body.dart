import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/Widgets/custom_text_form_field.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/accept_terms_widget.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/custom_rich_text_auth.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // متغيرات لاستقبال البيانات
  late String email, password, userName;
  bool isTermsAccepted = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "الاسم الكامل",
                onSaved: (value) {
                  userName = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: "كلمة المرور",
                obscureText: true,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              AcceptTermsWidget(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                isActive: isTermsAccepted,
                title: "إنشاء حساب جديد",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // إذا كانت البيانات صحيحة، نقوم بحفظها
                    _formKey.currentState!.save();

                    // استدعاء الـ Cubit لإرسال البيانات لـ Firebase
                    context.read<SignupCubit>().createUserWithEmailAndPass(
                      email: email,
                      name: userName,
                      password: password,
                    );
                  } else {
                    // إذا كانت البيانات خاطئة، نغير نمط التحقق ليصبح تلقائياً (Live)
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),
              CustomRichTextAuth(
                text1: "تمتلك حساب بالفعل؟ ",
                text2: "تسجيل دخول",
                onTap: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
