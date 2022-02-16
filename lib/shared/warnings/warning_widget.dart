import 'package:flutter/material.dart';

class WarningWidget extends StatelessWidget {
  final String message;
  final String title;
  final String? subtext;
  final String buttonText;
  const WarningWidget(
      {required this.message,
      Key? key,
      required this.title,
      this.subtext,
      this.buttonText = 'Ok'})
      : super(key: key);

  factory WarningWidget.error(String message) => WarningWidget(
        message: message,
        title: 'Ops...',
        subtext: 'Please try again later and check your internet connection',
      );
  factory WarningWidget.success(String message) =>
      WarningWidget(message: message, title: 'Success!');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text.rich(TextSpan(
          text: message,
          children: subtext != null
              ? [
                  TextSpan(
                      text: '\n$subtext',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12, height: 2))
                ]
              : null)),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text(buttonText))
      ],
    );
  }
}
