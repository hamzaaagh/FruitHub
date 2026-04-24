import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ElasticSlideTransitionPage<T> extends CustomTransitionPage<T> {
  ElasticSlideTransitionPage({
    required super.child,
    super.key,
    Duration duration = const Duration(
      milliseconds: 500,
    ), // مدة أطول قليلاً لتظهر حركة الارتداد
  }) : super(
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return SlideTransition(
             position:
                 Tween<Offset>(
                   begin: const Offset(1.0, 0.0), // يبدأ من اليمين
                   end: Offset.zero, // ينتهي في مكانه الطبيعي
                 ).animate(
                   CurvedAnimation(
                     parent: animation,
                     // Curves.elasticOut يعطي تأثير الارتداد الجميل في النهاية
                     curve: Curves.elasticOut,
                     // نستخدم منحنى مختلف عند العودة لجعل الخروج انسيابياً
                     reverseCurve: Curves.easeIn,
                   ),
                 ),
             child: child,
           );
         },
       );
}
