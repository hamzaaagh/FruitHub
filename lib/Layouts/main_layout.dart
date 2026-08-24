import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Widgets/custom_navigation_bar.dart';
import 'package:fruit_app/Features/Cart/domain/cart_repo.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_state.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(
            cartRepo: getIt<CartRepo>(),
          ),
        ),
        BlocProvider<CartItemActionCubit>(
          create: (context) => CartItemActionCubit(
            cartRepo: getIt<CartRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey(navigationShell.currentIndex),
            child: navigationShell,
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}