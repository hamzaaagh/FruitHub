import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Cubits/cubit/product_cubit.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'BestSellingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "الأكثر مبيعاً", showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => ProductCubit(getIt<ProductRepo>()),
            child: BestSellingViewBody(),
          ),
        ),
      ),
    );
  }
}
