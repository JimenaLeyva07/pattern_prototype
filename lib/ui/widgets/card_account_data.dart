import 'package:flutter/material.dart';
import '../../models/account_model.dart';

class CardAccountData extends StatelessWidget {
  const CardAccountData({
    super.key,
    required this.accountModel,
  });

  final AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Cuenta Bancaria'),
        subtitle: Text(accountModel.accountNumber),
        trailing: Text(
          '\$${accountModel.balance}',
          style: const TextStyle(fontSize: 14.8),
        ),
      ),
    );
  }
}
