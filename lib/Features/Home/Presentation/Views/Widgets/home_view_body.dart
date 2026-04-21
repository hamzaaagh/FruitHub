import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_search_text_field.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/best_seller_item.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/home_view_appbar.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_header.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/offer_banner_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        SliverGrid.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 163 / 214,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return BestSellerItem();
          },
        ),
      ],
    );
  }
}
