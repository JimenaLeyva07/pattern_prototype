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
        balance: 413.5,
        typeAccount: AccountType.ahorro,
      ),
      AccountModel(
        accountNumber: '002-1547896-215',
        balance: 529.75,
        typeAccount: AccountType.corriente,
      ),
    ]);
