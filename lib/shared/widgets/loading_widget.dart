import 'dart:async';

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final String message;
  final TextStyle? style;
  const LoadingWidget({required this.message, this.style, Key? key})
      : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  String state = 'loading';
  late Timer t;

  @override
  void dispose() {
    if (t.isActive) t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    t = Timer(
      Duration(seconds: 10),
      () => setState(() {
        state = 'failed';
        super.setState(() {});
      }),
    );

    if (state == 'failed') {
      return Center(
          child: Text(
        widget.message,
        style: widget.style,
        textAlign: TextAlign.center,
      ));
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
