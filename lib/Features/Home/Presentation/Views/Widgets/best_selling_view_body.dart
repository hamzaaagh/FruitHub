import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [ItemsGridView(count: 10)]);
  }
}
