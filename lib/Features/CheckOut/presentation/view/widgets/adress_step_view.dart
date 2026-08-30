import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:fruit_app/Features/CheckOut/presentation/manager/checkout_cubit/checkout_state.dart';

class AddressStepView extends StatelessWidget {
  const AddressStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField(
                hint: 'الاسم كامل',
                initialValue: state.fullName,
                onChanged: cubit.updateFullName,
              ),

              const SizedBox(height: 12),

              _buildTextField(
                hint: 'البريد الإلكتروني',
                initialValue: state.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: cubit.updateEmail,
              ),

              const SizedBox(height: 12),

              _buildTextField(
                hint: 'العنوان',
                initialValue: state.address,
                onChanged: cubit.updateAddress,
              ),

              const SizedBox(height: 12),

              _buildTextField(
                hint: 'المدينة',
                initialValue: state.city,
                onChanged: cubit.updateCity,
              ),

              const SizedBox(height: 12),

              _buildTextField(
                hint: 'رقم الطابق، رقم الشقة ..',
                initialValue: state.floorApartment,
                onChanged: cubit.updateFloorApartment,
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('حفظ العنوان'),

                  Switch(
                    value: state.saveAddress,
                    activeThumbColor: const Color(0xFF1E5631),
                    onChanged: cubit.toggleSaveAddress,
                  ),
                ],
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

  Widget _buildTextField({
    required String hint,
    required String initialValue,
    required ValueChanged<String> onChanged,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
