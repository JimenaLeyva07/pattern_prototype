import 'package:flutter/material.dart';

import '../../controller/transfer_controller.dart';
import '../../models/client_model.dart';
import '../widgets/card_account_data.dart';
import '../widgets/client_personal_data.dart';
import 'transfer_page.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ClientModel client = TransferController.client;
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyTransfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClientPersonalData(
              client: client,
            ),
            const Divider(),
            CardAccountData(
              accountModel: client.accounts[0],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TransferPafe(
                      destionationAcccount: client.accounts.last,
                      originAccount: client.accounts.first,
                    ),
                  ),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Transferir',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 9.0,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
