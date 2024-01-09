import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/data/dropdown_maturity_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/model/demo_maturity_models.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/rxdart.dart';

part 'demo_maturity_dropdown_field_event.dart';
part 'demo_maturity_dropdown_field_state.dart';

class DemoMaturityDropdownFieldBloc extends Bloc<DemoMaturityDropdownFieldEvent, DemoMaturityDropdownFieldState> {
  final DropdownMaturityFieldNetworkManager networkManager;
  final demoMap = BehaviorSubject<List<DemoMaturity>>();

  DemoMaturityDropdownFieldBloc({required this.networkManager}) : super(DemoMaturityDropdownFieldInitial()) {
    on<DemoMaturityNetworkDropdownFieldEventInitialGet>((event, emit) async {
      debugPrint("Event called in $event");
      try {
        final response = await networkManager.fetchInitialData(event.endpoint);
        if (response.isSuccess) {
          final itemMap = DemoMaturityList.fromJson((response as NeoSuccessResponse).data).items ?? [];
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
