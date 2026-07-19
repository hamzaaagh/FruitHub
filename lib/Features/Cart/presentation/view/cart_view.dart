import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_header.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_items_list.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'CartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // الـ CustomScrollView تأخذ المساحة المتبقية كاملة وتدعم السكرول المشترك
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomAppBar(title: 'السلة', showBackButton: false),
                  ), // الـ AppBar الخاص بالسلة
                  SliverToBoxAdapter(child: CartHeader(count: 3)),
                  CartItemList(),
                ],
              ),
            ),
            // زر الدفع يبقى هنا بالأسفل ثابت دائماً خارج السكرول
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomButton(title: 'الدفع 100 جنيه', onPressed: null),
            ),
          ],
        ),
      ),
    );
  }
}