import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SuccessStepView extends StatefulWidget {
  const SuccessStepView({super.key});

  @override
  State<SuccessStepView> createState() => _SuccessStepViewState();
}

class _SuccessStepViewState extends State<SuccessStepView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
       context.read<CheckoutCubit>().resetCheckout(); 
      context.go('/${HomeView.routeName}');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_pqn0ipwt.json',
            width: 150,
            height: 150,
            repeat: false,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.check_circle,
                size: 100,
                color: Color(0xFF1E5631),
              );
            },
          ),

          const SizedBox(height: 24),

          const Text(
            'تم بنجاح !',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'رقم الطلب : #1245789663',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
