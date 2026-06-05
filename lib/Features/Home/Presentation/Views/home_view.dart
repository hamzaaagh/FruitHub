import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Cubits/cubit/product_cubit.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: BlocProvider(
            create: (context) => ProductCubit(getIt<ProductRepo>()),
            child: HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
