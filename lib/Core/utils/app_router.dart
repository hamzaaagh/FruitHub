import 'package:fruit_app/Features/Auth/Presentation/Views/forget_password_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/login_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/register_view.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:fruit_app/Features/OnBoarding/Presentation/Views/onboarding_view.dart';
import 'package:fruit_app/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/${SplashView.routeName}',
  routes: [
    GoRoute(
      path: '/${SplashView.routeName}',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/${OnboardingView.routeName}',
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/${LoginView.routeName}',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/${RegisterView.routeName}',
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: '/${ForgetPasswordView.routeName}',
      builder: (context, state) => const ForgetPasswordView(),
    ),
     GoRoute(
      path: '/${HomeView.routeName}',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
