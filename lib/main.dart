import 'package:flutter/material.dart';
import 'package:lokibankv2/screens/dashboard.dart';

import 'http/webclient.dart';
import 'models/contact.dart';
import 'models/transaction.dart';

void main() {
  runApp(const Lokibankv2());
  save(Transaction(157, Contact('Jorge', 1578))).then((transaction) => print(transaction));
}

class Lokibankv2 extends StatelessWidget {
  const Lokibankv2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.amber[700]),
      ),
      home: const Dashboard(),
    );
  }
}
