import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData? icon;
  final Color colorIcon;

  const ResponseDialog({
    Key? key,
    this.title = "",
    this.message = "",
    this.buttonText = 'Ok',
    this.icon,
    this.colorIcon = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Visibility(
        child: Center(child: Text(title)),
        visible: title.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(
                icon,
                size: 64,
                color: colorIcon,
              ),
            ),
            visible: icon != null,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text(buttonText),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const SuccessDialog({
    Key? key,
    this.title = 'Success',
    this.message = '',
    this.icon = Icons.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const FailureDialog({
    Key? key,
    this.title = 'Failure',
    this.message = '',
    this.icon = Icons.warning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.red,
    );
  }
}
