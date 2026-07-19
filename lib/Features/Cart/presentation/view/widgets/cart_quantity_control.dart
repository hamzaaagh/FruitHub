import 'package:flutter/material.dart';

class CartQuantityController extends StatelessWidget {
  final int quantity;

  const CartQuantityController({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton(
          icon: Icons.remove,
          iconColor: const Color(0xff8E8E93),
          backgroundColor: const Color(0xffF2F2F7),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        Text(
          '$quantity',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 16),
        _buildActionButton(
          icon: Icons.add,
          iconColor: Colors.white,
          backgroundColor: const Color(0xff1B5E3A),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: iconColor),
      ),
    );
  }
}