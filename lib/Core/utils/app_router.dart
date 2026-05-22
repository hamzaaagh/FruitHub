import 'package:fruit_app/Core/functions/build_page.dart';
import 'package:fruit_app/Core/utils/elastic_transition.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/forget_password_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/login_view.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/register_view.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/best_selling_view.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:fruit_app/Features/OnBoarding/Presentation/Views/onboarding_view.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/section_view.dart';
import 'package:fruit_app/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:fruit_app/Layouts/main_layout.dart';
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
      pageBuilder: (context, state) {
        return ElasticSlideTransitionPage(child: const RegisterView());
      },
    ),
    GoRoute(
      path: '/${ForgetPasswordView.routeName}',
      pageBuilder: (context, state) {
        return ElasticSlideTransitionPage(child: const ForgetPasswordView());
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // الـ ShellWrapper هو الذي يحتوي على الـ CustomNavigationBar
        return MainLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${HomeView.routeName}',
              builder: (context, state) => const HomeView(),
            ),
            GoRoute(
              path: '/${BestSellingView.routeName}',
              pageBuilder: (context, state) {
                return buildPage(state, const BestSellingView());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${SectionView.routeName}',
              builder: (context, state) => const SectionView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${HomeView.routeName}',
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${HomeView.routeName}',
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
