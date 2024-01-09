import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/home_account_summary_network_manager.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/home_account_summary_widget_ui_model.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/models/home_account_summary_component_details_response.dart';
import 'package:neo_core/neo_core.dart';

part 'home_account_summary_widget_event.dart';
part 'home_account_summary_widget_state.dart';

class HomeAccountSummaryWidgetBloc extends Bloc<HomeAccountSummaryWidgetEvent, HomeAccountSummaryWidgetState> {
  bool isFlipped = false;

  HomeAccountSummaryWidgetBloc() : super(HomeAccountSummaryWidgetStateLoading()) {
    on<HomeAccountSummaryWidgetEventFetchComponentDetails>((event, emit) async {
      emit(HomeAccountSummaryWidgetStateLoading());
      final response = await HomeAccountSummaryNetworkManager().fetchAccountSummaryComponentDetails(event.iban);
      if (response.isSuccess) {
        emit(
          AccountSummaryWidgetStateLoaded(
            HomeAccountSummaryWidgetUIModel.fromResponse(
              HomeAccountSummaryComponentDetailsResponse.fromJson((response as NeoSuccessResponse).data),
            ),
          ),
        );
      }
    });
  }
}
