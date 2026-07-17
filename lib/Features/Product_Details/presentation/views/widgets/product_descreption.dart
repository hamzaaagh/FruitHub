// --- 4. الـ Widget الخاصة بوصف المنتج ---
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
    );
  }
}
