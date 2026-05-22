import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
