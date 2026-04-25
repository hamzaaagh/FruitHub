import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_navigation_bar.dart';
import 'package:go_router/go_router.dart';


class MainLayout extends StatelessWidget {
  const MainLayout({super.key,  required this.navigationShell});
// هذا الكائن هو المحرك الأساسي لـ GoRouter داخل الـ Shell
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الـ body سيعرض الصفحة المختارة من الـ branches (الرئيسية أو غيرها)
      body: navigationShell,
      
      // شريط التنقل المخصص الذي برمجناه
      bottomNavigationBar: CustomNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}