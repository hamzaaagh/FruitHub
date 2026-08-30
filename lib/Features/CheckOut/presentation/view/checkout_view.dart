import 'package:flutter/material.dart';
import 'package:fruit_app/Features/CheckOut/presentation/view/widgets/checkout_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  static const String routeName = 'checkout_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CheckOutViewBody()));
  }
}
