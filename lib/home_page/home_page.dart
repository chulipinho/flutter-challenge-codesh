import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("App Name", style: AppTextStyles.appTitle,),
        ),
      ),
      body: Center(
        child: Text('teste'),
      ),
    );
  }
}
