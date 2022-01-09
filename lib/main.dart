import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lokibankv2/components/app_bar_loki.dart';
import 'package:lokibankv2/screens/contact_form.dart';
import 'package:lokibankv2/screens/contacts_list.dart';
import 'package:lokibankv2/screens/dashboard.dart';

import 'database/app_database.dart';
import 'models/contact.dart';

void main() {
  runApp(Lokibankv2());
  save(Contact('Vini', 100)).then((id){
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
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
