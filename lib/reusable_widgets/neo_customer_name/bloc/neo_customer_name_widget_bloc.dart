import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/models/neo_customer_name_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/network/neo_customer_name_widget_network_manager.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

part 'neo_customer_name_widget_event.dart';
part 'neo_customer_name_widget_state.dart';

class NeoCustomerNameWidgetBloc extends Bloc<NeoCustomerNameWidgetEvent, NeoCustomerNameWidgetState> {
  final NeoCustomerNameWidgetNetworkManager networkManager;

  NeoCustomerNameWidgetBloc({required this.networkManager}) : super(NeoCustomerNameWidgetStateLoading()) {
    on<NeoCustomerNameWidgetEventFetchCustomerName>((event, emit) async {
      emit(NeoCustomerNameWidgetStateLoading());
      try {
        final response = await networkManager.fetchCustomerName();
        if (response.isSuccess) {
          final customerName = NeoCustomerNameResponseData.fromJson((response as NeoSuccessResponse).data).firstLines.first;
          emit(NeoCustomerNameWidgetStateLoaded(customerName: customerName));
        } else {
          // TODO: Handle error if necessary
        }
      } on Exception catch (e) {
        // TODO: Handle error if necessary
        emit(NeoCustomerNameWidgetStateError(e.toString()));
      }
    });
  }
}
