import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_quantity_control.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: const Color(0xffF3F5F7),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            'assets/images/watermelon.png',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.fastfood, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'بطيخ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '3 كم',
              style: TextStyle(fontSize: 12, color: Color(0xffF4A723)),
            ),
            const SizedBox(height: 8),
            const CartQuantityController(quantity: 3),

            const SizedBox(height: 4),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Color(0xffB1B1B1),
                size: 24,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text(
              '60 جنيه',
              style: TextStyle(
                color: Color(0xffF4A723),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}