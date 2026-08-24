import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          // إضافة فاصل بين العناصر
          if (index.isOdd) {
            return const Divider(
              color: Color(0xffF1F1F5),
              height: 32,
              thickness: 1,
            );
          }

          // حساب الفهرس الحقيقي للعنصر في القائمة
          final itemIndex = index ~/ 2;
          final cartItem = cartItems[itemIndex];

          return CartItem(cartItem: cartItem);
        }, childCount: (cartItems.length * 2) - 1),
      ),
    );
  }
}
