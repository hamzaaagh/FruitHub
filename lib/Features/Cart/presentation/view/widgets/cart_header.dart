import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  final int count;

  const CartHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color(0xffEBF7F1),
      child: Text(
        'لديك $count منتجات في سلة التسوق',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff2D935D),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}