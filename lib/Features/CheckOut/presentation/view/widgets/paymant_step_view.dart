import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_state.dart';

class PaymentStepView extends StatelessWidget {
  const PaymentStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اختر طريقة الدفع المناسبة:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'من فضلك اختر طريقة الدفع المناسبة لك',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 20),

              _buildPaymentOption(
                title: 'PayPal',
                subtitle: 'الدفع الإلكتروني السريع والآمن',
                icon: Icons.account_balance_wallet_outlined,
                isSelected:
                    state.paymentMethod == PaymentMethod.paypal,
                onTap: () {
                  cubit.selectPaymentMethod(
                    PaymentMethod.paypal,
                  );
                },
              ),

              const SizedBox(height: 12),

              _buildPaymentOption(
                title: 'الدفع عند الاستلام',
                subtitle: 'ادفع نقداً فور استلام الطلب',
                icon: Icons.payments_outlined,
                isSelected:
                    state.paymentMethod ==
                        PaymentMethod.cashOnDelivery,
                onTap: () {
                  cubit.selectPaymentMethod(
                    PaymentMethod.cashOnDelivery,
                  );
                },
              ),

              const SizedBox(height: 20),

              if (state.paymentMethod == PaymentMethod.paypal)
                _buildCardInformation(
                  state: state,
                  cubit: cubit,
                ),
                const SizedBox(height: 25),
              CustomButton(
                title: 'التالي',
                onPressed: () {
                  cubit.goToNextStep();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1E5631)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? const Color(0xFF1E5631).withOpacity(0.03)
              : Colors.white,
        ),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              activeColor: const Color(0xFF1E5631),
              onChanged: (_) => onTap(),
            ),

            const SizedBox(width: 8),

            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF1E5631)
                  : Colors.grey,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? const Color(0xFF1E5631)
                          : Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardInformation({
    required CheckoutState state,
    required CheckoutCubit cubit,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'معلومات البطاقة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 12),

        TextFormField(
          initialValue: state.cardHolderName,
          onChanged: cubit.updateCardHolderName,
          decoration: InputDecoration(
            hintText: 'اسم حامل البطاقة',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        const SizedBox(height: 12),

        TextFormField(
          initialValue: state.cardNumber,
          keyboardType: TextInputType.number,
          onChanged: cubit.updateCardNumber,
          decoration: InputDecoration(
            hintText: 'رقم البطاقة',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: state.expiryDate,
                keyboardType: TextInputType.datetime,
                onChanged: cubit.updateExpiryDate,
                decoration: InputDecoration(
                  hintText: 'تاريخ الصلاحية',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: TextFormField(
                initialValue: state.cvc,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: cubit.updateCvc,
                decoration: InputDecoration(
                  hintText: 'CVC',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Checkbox(
              value: state.setCardDefault,
              activeColor: const Color(0xFF1E5631),
              onChanged: (value) {
                cubit.toggleSetCardDefault(
                  value ?? false,
                );
              },
            ),

            const Text('جعل البطاقة افتراضية'),
          ],
        ),
      ],
    );
  }
}