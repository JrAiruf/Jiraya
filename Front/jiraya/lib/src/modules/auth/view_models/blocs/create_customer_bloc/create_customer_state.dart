part of 'create_customer_bloc.dart';

@immutable
sealed class CreateCustomerStates {}

final class CreateCustomerInitialState extends CreateCustomerStates {}

final class CreateCustomerLoadingState extends CreateCustomerStates {}

final class CreateCustomerFailureState extends CreateCustomerStates {
  final String message;

  CreateCustomerFailureState(this.message);
}

final class CreateCustomerSuccessState extends CreateCustomerStates {
  final CustomerModel customer;

  CreateCustomerSuccessState(this.customer);
}
