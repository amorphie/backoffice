import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/demo_accounts_second/widgets/branch_code_dropdown_field/network/neo_network_dropdown_form_field_network_manager.dart';
import 'package:neo_core/neo_core.dart';
import 'package:rxdart/rxdart.dart';

part 'neo_network_dropdown_form_field_event.dart';
part 'neo_network_dropdown_form_field_state.dart';

class NeoNetworkDropdownFormFieldBloc2 extends Bloc<NeoNetworkDropdownFormFieldEvent2, NeoNetworkDropdownFormFieldState2> {
  final NeoNetworkDropdownFormFieldNetworkManager2 networkManager;
  final itemListStream = BehaviorSubject<List<String>>();

  NeoNetworkDropdownFormFieldBloc2({required this.networkManager}) : super(NeoNetworkDropdownFormFieldInitial2()) {
    on<NeoNetworkDropdownFormFieldEventFetchItemList2>(
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
}
