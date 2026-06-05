import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Cubits/cubit/product_cubit.dart';
import 'package:fruit_app/Core/Widgets/custom_search_text_field.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/home_view_appbar.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_gride_view_bloc_builder.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_header.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/offer_banner_row.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeViewAppBar()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: CustomSearchTextField()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: OfferBannerRow()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: ItemsHeader()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        ItemsGridViewBlockBuilder(),
      ],
    );
  }
}
