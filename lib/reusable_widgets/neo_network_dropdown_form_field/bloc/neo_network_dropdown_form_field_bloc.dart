import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_network_dropdown_form_field/network/neo_network_dropdown_form_field_network_manager.dart';
import 'package:neo_core/neo_core.dart';
import 'package:rxdart/rxdart.dart';

part 'neo_network_dropdown_form_field_event.dart';
part 'neo_network_dropdown_form_field_state.dart';

class NeoNetworkDropdownFormFieldBloc extends Bloc<NeoNetworkDropdownFormFieldEvent, NeoNetworkDropdownFormFieldState> {
  final NeoNetworkDropdownFormFieldNetworkManager networkManager;
  final itemListStream = BehaviorSubject<List<String>>();

  NeoNetworkDropdownFormFieldBloc({required this.networkManager}) : super(NeoNetworkDropdownFormFieldInitial()) {
    on<NeoNetworkDropdownFormFieldEventFetchItemList>(
      (event, emit) async {
        try {
          final response = await networkManager.fetchItemList(event.endpoint);
          if (response.isSuccess) {
            final itemList = (response as NeoSuccessResponse).data["items"].cast<String>();
            itemListStream.add(itemList);
          } else {
            // TODO: Handle error if necessary
          }
        } on Exception catch (_) {
          // TODO: Handle error if necessary
        }
      },
    );
  }

  @override
  Future<void> close() {
    itemListStream.close();
    return super.close();
  }
}
