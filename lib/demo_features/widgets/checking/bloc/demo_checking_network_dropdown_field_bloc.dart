import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/checking/data/demo_checking_network_dropdown_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/checking/model/demo_checking_account_models.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/rxdart.dart';

part 'demo_checking_network_dropdown_field_event.dart';
part 'demo_checking_network_dropdown_field_state.dart';

class DemoCheckingNetworkDropdownFieldBloc extends Bloc<DemoCheckingNetworkDropdownFieldEvent, DemoCheckingNetworkDropdownFieldState> {
  final DemoCheckingNetworkDropdownFieldNetworkManager networkManager;
  final demoMap = BehaviorSubject<List<DemoChecking>>();

  DemoCheckingNetworkDropdownFieldBloc({required this.networkManager}) : super(DemoCheckingNetworkDropdownFieldInitial()) {
    on<DemoCheckingNetworkDropdownFieldEventInitialGet>(
      (event, emit) async {
        debugPrint("Event called in $event");
        try {
          final response = await networkManager.fetchInitialData(event.endpoint);
          if (response.isSuccess) {
            final itemMap = List<DemoChecking>.from(
              (response as NeoSuccessResponse).data["data"].map(DemoChecking.fromJson),
            );

            debugPrint("****Response $itemMap");
            demoMap.add(itemMap);
          } else {
            debugPrint("****Error ${response.isError}");
            // TODO: Handle error if necessary
          }
        } on Exception catch (_) {
          // TODO: Handle error if necessary
        }
      },
    );
  }
}
