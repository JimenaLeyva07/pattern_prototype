import 'package:flutter/material.dart';

import '../../models/client_model.dart';

class ClientPersonalData extends StatelessWidget {
  const ClientPersonalData({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.person,
          size: 90.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos del cliente',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(client.name),
            Text(client.email),
          ],
        )
      ],
    );
  }
}
