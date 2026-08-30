import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState());

  /// إعادة ضبط الـ Cubit للحالة الابتدائية (الخطوة الأولى وتصفير البيانات)
  void resetCheckout() {
    emit(const CheckoutState());
  }

  void goToNextStep() {
    // تم التعديل إلى 2 لأن الصفحات لديك 3 (0: Address, 1: Payment, 2: Success)
    if (state.currentStep < 2) {
      emit(
        state.copyWith(
          currentStep: state.currentStep + 1,
        ),
      );
    }
  }

  void goToPreviousStep() {
    if (state.currentStep > 0) {
      emit(
        state.copyWith(
          currentStep: state.currentStep - 1,
        ),
      );
    }
  }

  void selectDeliveryOption(DeliveryOption option) {
    emit(
      state.copyWith(
        deliveryOption: option,
      ),
    );
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(
      state.copyWith(
        paymentMethod: method,
      ),
    );
  }

  void updateFullName(String value) {
    emit(
      state.copyWith(
        fullName: value,
      ),
    );
  }

  void updateEmail(String value) {
    emit(
      state.copyWith(
        email: value,
      ),
    );
  }

  void updateAddress(String value) {
    emit(
      state.copyWith(
        address: value,
      ),
    );
  }

  void updateCity(String value) {
    emit(
      state.copyWith(
        city: value,
      ),
    );
  }

  void updateFloorApartment(String value) {
    emit(
      state.copyWith(
        floorApartment: value,
      ),
    );
  }

  void toggleSaveAddress(bool value) {
    emit(
      state.copyWith(
        saveAddress: value,
      ),
    );
  }

  void updateCardHolderName(String value) {
    emit(
      state.copyWith(
        cardHolderName: value,
      ),
    );
  }

  void updateCardNumber(String value) {
    emit(
      state.copyWith(
        cardNumber: value,
      ),
    );
  }

  void updateExpiryDate(String value) {
    emit(
      state.copyWith(
        expiryDate: value,
      ),
    );
  }

  void updateCvc(String value) {
    emit(
      state.copyWith(
        cvc: value,
      ),
    );
  }

  void toggleSetCardDefault(bool value) {
    emit(
      state.copyWith(
        setCardDefault: value,
      ),
    );
  }
}