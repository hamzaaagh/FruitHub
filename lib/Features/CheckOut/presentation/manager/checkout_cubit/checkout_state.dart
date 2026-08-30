import 'package:equatable/equatable.dart';

enum DeliveryOption {
  home,
  store,
}

enum PaymentMethod {
  paypal,
  cashOnDelivery,
}

class CheckoutState extends Equatable {
  final int currentStep;

  final DeliveryOption deliveryOption;

  final String fullName;
  final String email;
  final String address;
  final String city;
  final String floorApartment;

  final bool saveAddress;

  final PaymentMethod paymentMethod;

  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvc;

  final bool setCardDefault;

  const CheckoutState({
    this.currentStep = 0,
    this.deliveryOption = DeliveryOption.home,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.floorApartment = '',
    this.saveAddress = false,
    this.paymentMethod = PaymentMethod.paypal,
    this.cardHolderName = '',
    this.cardNumber = '',
    this.expiryDate = '',
    this.cvc = '',
    this.setCardDefault = false,
  });

  CheckoutState copyWith({
    int? currentStep,
    DeliveryOption? deliveryOption,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? floorApartment,
    bool? saveAddress,
    PaymentMethod? paymentMethod,
    String? cardHolderName,
    String? cardNumber,
    String? expiryDate,
    String? cvc,
    bool? setCardDefault,
  }) {
    return CheckoutState(
      currentStep: currentStep ?? this.currentStep,
      deliveryOption: deliveryOption ?? this.deliveryOption,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      floorApartment: floorApartment ?? this.floorApartment,
      saveAddress: saveAddress ?? this.saveAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvc: cvc ?? this.cvc,
      setCardDefault: setCardDefault ?? this.setCardDefault,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        deliveryOption,
        fullName,
        email,
        address,
        city,
        floorApartment,
        saveAddress,
        paymentMethod,
        cardHolderName,
        cardNumber,
        expiryDate,
        cvc,
        setCardDefault,
      ];
}