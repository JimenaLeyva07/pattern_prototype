import 'package:flutter/material.dart';
import 'client_home_page.dart';

import '../../controller/transfer_controller.dart';
import '../../models/account_model.dart';
import '../widgets/card_account_data.dart';

class TransferPafe extends StatefulWidget {
  const TransferPafe({
    super.key,
    required this.destionationAcccount,
    required this.originAccount,
  });

  final AccountModel destionationAcccount;
  final AccountModel originAccount;

  @override
  State<TransferPafe> createState() => _TransferPafeState();
}

class _TransferPafeState extends State<TransferPafe> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Now'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cuenta destino',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardAccountData(
              accountModel: widget.destionationAcccount,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Transferencia',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                  hintText: 'Ingresar monto',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  TransferController.modifyBalance(
                    widget.originAccount,
                    double.parse(amountController.text),
                  );
                  _showConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  'Listo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Seguro de realizar la transferencia?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cuenta actual',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              CardAccountData(
                accountModel: widget.originAccount,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Cuenta luego de transferencia',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              CardAccountData(accountModel: TransferController.modifiedAccount)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ClientHomePage(),
                    ),
                    (route) => false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                TransferController.setCloneToOriginal();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("¡Transferencia exitosa!"),
                ));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ClientHomePage(),
                    ),
                    (route) => false);
              },
              child: const Text('Aceptar'),
            )
          ],
        );
      },
    );
  }
}
