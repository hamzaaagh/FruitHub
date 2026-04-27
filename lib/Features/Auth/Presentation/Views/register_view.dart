import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Widgets/custom_Indicator.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/functions/build_snackbar.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/Widgets/register_view_body.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: "حساب جديد"),
        body: SafeArea(child: const RegisterViewBodyBlocConsumer()),
      ),
    );
  }
}

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          buildSnackBar(context, state.message);
        } else if (state is SignupSuccess) {
          buildSnackBar(context, "تم إنشاء الحساب بنجاح ");
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomIndicator(
          widget: RegisterViewBody(),
          isLoading: state is SignupLoading,
        );
      },
    );
  }
}
