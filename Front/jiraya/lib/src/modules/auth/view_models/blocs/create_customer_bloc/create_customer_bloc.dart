import "package:bloc/bloc.dart";
import "package:jiraya_app/src/modules/auth/view_models/blocs/create_customer_bloc/create_customer_events.dart";
import "package:jiraya_app/src/modules/auth/view_models/blocs/create_customer_bloc/create_customer_states.dart";

class CreateCustomerBloc
    extends Bloc<CreateCustomerEvents, CreateCustomerStates> {
  CreateCustomerBloc() : super(CreateCustomerInitialState()) {
    on<CreateCustomerEvent>(_mapCreateCustomerEventToState);
  }

  void _mapCreateCustomerEventToState(CreateCustomerEvent event, Emitter<CreateCustomerStates> states) {}
}
