import '../helpers/constants/account_type.dart';
import '../models/account_model.dart';
import '../models/client_model.dart';

ClientModel clientMock = ClientModel(
    name: 'Pepito Pérez',
    email: 'pepito@aleteo.com',
    idDoc: '18293049',
    accounts: [
      AccountModel(
        accountNumber: '002-1547896-215',
        balance: 1375020.50,
        typeAccount: AccountType.ahorro,
      ),
      AccountModel(
        accountNumber: '002-1547896-215',
        balance: 1689310.90,
        typeAccount: AccountType.corriente,
      ),
    ]);
