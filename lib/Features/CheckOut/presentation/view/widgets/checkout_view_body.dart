import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_state.dart';
import 'package:fruit_app/Features/CheckOut/presentation/view/widgets/adress_step_view.dart';
import 'package:fruit_app/Features/CheckOut/presentation/view/widgets/paymant_step_view.dart';
import 'package:fruit_app/Features/CheckOut/presentation/view/widgets/stepper_bar.dart';
import 'package:fruit_app/Features/CheckOut/presentation/view/widgets/success_step_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentStep,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        );
      },
      child: Column(
        children: [
          // Step Bar
          BlocBuilder<CheckoutCubit, CheckoutState>(
            buildWhen: (previous, current) =>
                previous.currentStep != current.currentStep,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomStepperBar(currentStep: state.currentStep),
              );
            },
          ),

          // Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                AddressStepView(),
                PaymentStepView(),
                SuccessStepView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}