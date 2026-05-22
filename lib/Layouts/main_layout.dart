import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
