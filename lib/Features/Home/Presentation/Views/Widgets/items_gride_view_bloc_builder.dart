import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Cubits/cubit/product_cubit.dart';
import 'package:fruit_app/Core/functions/get_dummy_product.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/items_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemsGridViewBlockBuilder extends StatelessWidget {
  const ItemsGridViewBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ItemsGridView(items: state.products);
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(child: Text("Failure"));
        } else {
          return Skeletonizer.sliver(
            child: ItemsGridView(items: getDummyProducts(6)),
          );
        }
      },
    );
  }
}
