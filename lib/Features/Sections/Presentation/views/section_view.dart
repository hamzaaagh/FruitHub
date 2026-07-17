import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Cubits/cubit/product_cubit.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/Widgets/notifacation_widget.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/widgets/section_view_body.dart';

class SectionView extends StatelessWidget {
  const SectionView({super.key});
  static const String routeName = 'SectionView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "المنتجات",
        suffixIcon: NotifacationWidget(),
        showBackButton: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => ProductCubit(
              getIt<ProductRepo>(),
            ), // يمكنك إضافة Cubit أو Bloc هنا إذا لزم الأمر
            child: SectionViewBody(),
          ),
        ),
      ),
    );
  }
}
