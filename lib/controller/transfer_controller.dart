import '../models/account_model.dart';

import '../mocks/client_mock.dart';

import '../models/client_model.dart';

class TransferController {
  static ClientModel client = clientMock;
  static late AccountModel modifiedAccount;

  static void modifyBalance(AccountModel accountOrigin, double transferAmount) {
    modifiedAccount = accountOrigin.clone();
    modifiedAccount.balance = modifiedAccount.balance - transferAmount;
  }

  static void setCloneToOriginal() {
    ClientModel modifiedClient = client.clone();
    modifiedClient.accounts[0] = modifiedAccount;
    client = modifiedClient;
  }
}
