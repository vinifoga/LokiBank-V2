import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Progress extends StatelessWidget {
  final String? message;
  const Progress({Key? key, this.message = 'Loading'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(message!, style: const TextStyle(
              fontSize: 24.0
            ),),
          ),
        ],
      ),
    );
  }
}
