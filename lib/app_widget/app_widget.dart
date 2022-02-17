import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/controller/home_page_controller.dart';
import 'package:flutter_challenge/home_page/home_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomePageController>(create: (_) => HomePageController()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
