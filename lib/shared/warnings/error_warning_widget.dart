import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  const ErrorMessageWidget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ops..'),
      content: Text.rich(TextSpan(text: message, children: [
        TextSpan(
            text: '\nPlease try again later and check your internet connection',
            style: TextStyle(color: Colors.grey, fontSize: 12, height: 2))
      ])),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok"))
      ],
    );
  }
}
