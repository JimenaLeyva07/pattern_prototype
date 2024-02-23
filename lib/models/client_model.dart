import 'account_model.dart';
import 'bank_protoype.dart';

class ClientModel implements BankPrototype {
  String name = '';
  String email = '';
  String idDoc = '';
  List<AccountModel> accounts = [];

  int? _hashCode;

  ClientModel({
    String? name,
    String? email,
    String? idDoc,
    List<AccountModel>? accounts,
  }) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.idDoc = idDoc ?? this.idDoc;
    this.accounts = accounts ?? this.accounts;
  }

  ClientModel.clone(ClientModel client) {
    name = client.name;
    email = client.email;
    idDoc = client.idDoc;
    accounts = client.accounts;
    _hashCode = client.hashCode;
  }

  @override
  int get hashCode {
    if (_hashCode != null) return _hashCode!;
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode!;
  }

  @override
  bool operator ==(Object other) {
    return other is ClientModel &&
        other.runtimeType == runtimeType &&
        other.hashCode == hashCode;
  }

  @override
  ClientModel clone() {
    return ClientModel.clone(this);
  }
}
