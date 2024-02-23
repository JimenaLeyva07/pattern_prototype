import '../helpers/constants/account_type.dart';

import 'bank_protoype.dart';

class AccountModel implements BankPrototype {
  String accountNumber = '';
  double balance = 0;
  AccountType typeAccount = AccountType.ahorro;
  int? _hashCode;

  AccountModel({
    String? accountNumber,
    double? balance,
    AccountType? typeAccount,
  }) {
    this.accountNumber = accountNumber ?? this.accountNumber;
    this.balance = balance ?? this.balance;
    this.typeAccount = typeAccount ?? this.typeAccount;
  }

  AccountModel.clone(AccountModel account) {
    accountNumber = account.accountNumber;
    balance = account.balance;
    typeAccount = account.typeAccount;
    _hashCode = account.hashCode;
  }

  @override
  int get hashCode {
    if (_hashCode != null) return _hashCode!;
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode!;
  }

  @override
  bool operator ==(Object other) {
    return other is AccountModel &&
        other.runtimeType == runtimeType &&
        other.hashCode == hashCode;
  }

  @override
  AccountModel clone() {
    return AccountModel.clone(this);
  }
}
