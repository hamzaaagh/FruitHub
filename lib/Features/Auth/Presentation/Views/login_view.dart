import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Widgets/custom_Indicator.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/functions/build_snackbar.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/login_view_body.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signin_cubit/signin_state.dart';
import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: "تسجيل الدخول", showBackButton: false),
        body: SafeArea(child: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          buildSnackBar(context, state.message);
        } else if (state is SigninSuccess) {
          buildSnackBar(context, "تم تسجيل الدخول بنجاح ");
          context.push("/${HomeView.routeName}");
        }
      },
      builder: (context, state) {
        return CustomIndicator(
          isLoading: state is SigninLoading,
          widget: LoginViewBody(),
        );
      },
    );
  }
}
