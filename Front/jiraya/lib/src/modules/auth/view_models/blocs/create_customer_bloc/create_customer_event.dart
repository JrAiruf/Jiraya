part of 'create_customer_bloc.dart';

@immutable
sealed class CreateCustomerEvents {}

class CreateCustomerEvent extends CreateCustomerEvents {
final  CreateCustomerModel newCustomer;

  CreateCustomerEvent(this.newCustomer);
}
