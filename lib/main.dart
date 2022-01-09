import 'package:flutter/material.dart';
import 'package:lokibankv2/components/app_bar_loki.dart';

void main() => runApp(Lokibankv2());

class Lokibankv2 extends StatelessWidget {
  const Lokibankv2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.amber[700]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLoki(
        appBarTitle: 'DashBoard',
        mostraImagem: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/dashboardv2.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 150,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.people,
                      color: Colors.amber,
                      size: 32.0,
                    ),
                    Text(
                      'Contacts',
                      style: TextStyle(color: Colors.amber,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

