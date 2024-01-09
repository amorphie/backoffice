import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/data/dropdown_maturity_renewal_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/model/demo_maturity_renewal_models.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/subjects.dart';

part 'dropdown_maturity_renewal_field_event.dart';
part 'dropdown_maturity_renewal_field_state.dart';

class DropdownMaturityRenewalFieldBloc extends Bloc<DemoMaturityRenewalDropdownFieldEvent, DropdownMaturityRenewalFieldState> {
  final DropdownMaturityRenewalFieldNetworkManager networkManager;
  final demoMap = BehaviorSubject<List<DemoMaturityRenewal>>();

  DropdownMaturityRenewalFieldBloc({required this.networkManager}) : super(DropdownMaturityRenewalFieldInitial()) {
    on<DemoMaturityRenewalNetworkDropdownFieldEventInitialGet>((event, emit) async {
      debugPrint("Event called in $event");
      try {
        final response = await networkManager.fetchInitialData(event.endpoint);
        if (response.isSuccess) {
          final itemMap = DemoMaturityRenewalList.fromJson((response as NeoSuccessResponse).data).items ?? [];
          debugPrint("****Response $itemMap");
          demoMap.add(itemMap);
        } else {
          debugPrint("****Error ${response.isError}");
          // TODO: Handle error if necessary
        }
      } on Exception catch (_) {
        // TODO: Handle error if necessary
      }
    });
  }
}
