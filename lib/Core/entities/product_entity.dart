import 'dart:io';

class ProductEntity {
  final String name;
  final String code;
  final num price;
  final File? image;
  final String description;
  final bool isFeatured;
  final String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmounts;

  ProductEntity({
    required this.name,
    required this.code,
    required this.price,
    this.image,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmounts,
  });
}
