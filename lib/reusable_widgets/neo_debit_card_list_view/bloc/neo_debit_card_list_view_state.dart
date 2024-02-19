import 'package:equatable/equatable.dart';

import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';

class NeoDebitCardListViewState extends Equatable {
  final List<NeoDebitCardItemData>? itemList;

  const NeoDebitCardListViewState({this.itemList});

  @override
  List<Object?> get props => [itemList];
}
