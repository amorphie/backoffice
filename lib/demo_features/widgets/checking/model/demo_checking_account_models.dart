class ItemList {
  List<DemoChecking>? items;

  ItemList({this.items});

  ItemList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      items = <DemoChecking>[];
      json['data'].forEach((v) {
        items!.add(DemoChecking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> items = <String, dynamic>{};
    if (this.items != null) {
      items['data'] = this.items!.map((v) => v.toJson()).toList();
    }
    return items;
  }
}

class DemoChecking {
  String? accountType;
  Balance? balance;
  Branch? branch;
  String? iban;
  String? name;
  String? number;

  DemoChecking({this.accountType, this.balance, this.branch, this.iban, this.name, this.number});

  DemoChecking.fromJson(Map<String, dynamic> json) {
    accountType = json['accountType'];
    balance = json['balance'] != null ? Balance?.fromJson(json['balance']) : null;
    branch = json['branch'] != null ? Branch?.fromJson(json['branch']) : null;
    iban = json['iban'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountType'] = accountType;
    data['balance'] = balance!.toJson();
    data['branch'] = branch!.toJson();
    data['iban'] = iban;
    data['name'] = name;
    data['number'] = number;
    return data;
  }
}

class Balance {
  num? availableBalance;
  num? availableBalanceNonCredit;
  num? balance;
  String? currencyCode;
  List<Blockage?>? blockage;
  List<Credit?>? credits;

  Balance({
    this.availableBalance,
    this.availableBalanceNonCredit,
    this.balance,
    this.currencyCode,
    this.blockage,
    this.credits,
  });

  Balance.fromJson(Map<String, dynamic> json) {
    availableBalance = json['availableBalance'];
    availableBalanceNonCredit = json['availableBalanceNonCredit'];
    balance = json['balance'];
    currencyCode = json['currencyCode'];
    if (json['blockage'] != null) {
      blockage = <Blockage>[];
      json['blockage'].forEach((v) {
        blockage!.add(Blockage.fromJson(v));
      });
    }
    if (json['credits'] != null) {
      credits = <Credit>[];
      json['credits'].forEach((v) {
        credits!.add(Credit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['availableBalance'] = availableBalance;
    data['availableBalanceNonCredit'] = availableBalanceNonCredit;
    data['balance'] = balance;
    data['currencyCode'] = currencyCode;
    data['blockage'] = blockage?.map((v) => v?.toJson()).toList();
    data['credits'] = credits?.map((v) => v?.toJson()).toList();
    return data;
  }
}

class Blockage {
  int? amount;
  String? createDate;
  String? description;
  String? dueDate;
  String? name;

  Blockage({this.amount, this.createDate, this.description, this.dueDate, this.name});

  Blockage.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    createDate = json['createDate'];
    description = json['description'];
    dueDate = json['dueDate'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['createDate'] = createDate;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['name'] = name;
    return data;
  }
}

class Branch {
  String? code;
  String? name;

  Branch({this.code, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class Credit {
  int? amount;
  int? availableAmount;
  String? code;
  String? createDate;
  String? dueDate;
  double? monthlyInterestRate;
  String? name;
  int? remainingAmount;
  int? totalDebt;
  int? totalInterestDebtAmount;
  double? yearlyInterestRate;

  Credit({
    this.amount,
    this.availableAmount,
    this.code,
    this.createDate,
    this.dueDate,
    this.monthlyInterestRate,
    this.name,
    this.remainingAmount,
    this.totalDebt,
    this.totalInterestDebtAmount,
    this.yearlyInterestRate,
  });

  Credit.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    availableAmount = json['availableAmount'];
    code = json['code'];
    createDate = json['createDate'];
    dueDate = json['dueDate'];
    monthlyInterestRate = json['monthlyInterestRate'];
    name = json['name'];
    remainingAmount = json['remainingAmount'];
    totalDebt = json['totalDebt'];
    totalInterestDebtAmount = json['totalInterestDebtAmount'];
    yearlyInterestRate = json['yearlyInterestRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['availableAmount'] = availableAmount;
    data['code'] = code;
    data['createDate'] = createDate;
    data['dueDate'] = dueDate;
    data['monthlyInterestRate'] = monthlyInterestRate;
    data['name'] = name;
    data['remainingAmount'] = remainingAmount;
    data['totalDebt'] = totalDebt;
    data['totalInterestDebtAmount'] = totalInterestDebtAmount;
    data['yearlyInterestRate'] = yearlyInterestRate;
    return data;
  }
}
