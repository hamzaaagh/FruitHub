import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_search_text_field.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_gride_view_bloc_builder.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_header.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/widgets/products_circle_list.dart';

class SectionViewBody extends StatelessWidget {
  const SectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomSearchTextField()), // حقل البحث المخصص
        ProductsCircleList(),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ), // مسافة بين القائمة وشبكة المنتجات
        SliverToBoxAdapter(child: ItemsHeader()),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ), // مسافة بين القائمة وشبكة المنتجات
        ItemsGridViewBlockBuilder(),
      ],
    );
  }
}
