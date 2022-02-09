import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';
import 'package:flutter_challenge/home_page/widgets/item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "App Name",
            style: AppTextStyles.appTitle,
          ),
        ),
      ),
      body: ItemList(),
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"), BottomNavigationBarItem(icon: Icon(Icons.crop), label: "config")])
    );
  }
}
