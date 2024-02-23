import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/network/neo_card_details_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:rxdart/rxdart.dart';

part 'debit_card_limit_information_widget_event.dart';
part 'debit_card_limit_information_widget_state.dart';

class DebitCardLimitInformationWidgetBloc extends Bloc<DebitCardLimitInformationWidgetEvent, DebitCardLimitInformationWidgetState> {
  final NeoCardDetailsNetworkManager networkManager;
  final cardDetailsStream = BehaviorSubject<NeoDebitCardItemData>();

  DebitCardLimitInformationWidgetBloc({required this.networkManager}) : super(DebitCardLimitInformationWidgetInitial()) {
    on<DebitCardLimitInformationWidgetEventFetchCardDetails>(_onFetchCardDetails);
  }
  Future<void> _onFetchCardDetails(
    DebitCardLimitInformationWidgetEventFetchCardDetails event,
    Emitter<DebitCardLimitInformationWidgetState> emit,
  ) async {
    try {
      final response = await networkManager.fetchCardDetails();
      if (response.isSuccess) {
        final NeoDebitCardItemData cardDetails = NeoDebitCardItemData.fromJson((response as NeoSuccessResponse).data);
        if (!cardDetailsStream.isClosed) {
          cardDetailsStream.add(cardDetails);
        }
      } else {
        //TODO: handle error
      }
    } on Exception catch (_) {
      //TODO: handle exception
    }
  }

  @override
  Future<void> close() {
    cardDetailsStream.close();
    return super.close();
  }
}
