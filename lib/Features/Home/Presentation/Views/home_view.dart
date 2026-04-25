import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   // This line removes the current focus from any text field
      //   FocusScopeNode currentFocus = FocusScope.of(context);

      //   if (!currentFocus.hasPrimaryFocus) {
      //     currentFocus.unfocus();
      //   }
      // },
      child: Scaffold(
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
      ),
    );
  }
}
