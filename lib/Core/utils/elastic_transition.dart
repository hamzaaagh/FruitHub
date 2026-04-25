import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ElasticSlideTransitionPage extends CustomTransitionPage {
  ElasticSlideTransitionPage({required super.child})
    : super(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(
                  CurvedAnimation(parent: animation, curve: Curves.elasticOut),
                ),
            child: child,
          );
        },
      );
}
