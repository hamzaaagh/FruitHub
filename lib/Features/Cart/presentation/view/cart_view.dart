import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'CartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: CartViewBody()),
    );
  }
}
