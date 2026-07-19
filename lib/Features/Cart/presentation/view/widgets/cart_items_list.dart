import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 3; // يمكنك ربطها بالـ List الحقيقية لاحقاً

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            // لمحاكاة الـ separatorBuilder في الـ ListView
            if (index.isOdd) {
              return const Divider(
                color: Color(0xffF1F1F5),
                height: 32,
                thickness: 1,
              );
            }

            return const CartItem();
          },
          // نضرب في 2 ونطرح 1 لتمثيل العناصر مع الفواصل بشكل دقيق
          childCount: itemCount > 0 ? (itemCount * 2) - 1 : 0,
        ),
      ),
    );
  }
}
