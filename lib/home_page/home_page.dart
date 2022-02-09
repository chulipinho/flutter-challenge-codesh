import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/item_list_widget.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();

  @override
  void initState() {
    super.initState();
    controller.load();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state != HomeState.loaded){
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }
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
      body: ItemList(items: controller.items!,),
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"), BottomNavigationBarItem(icon: Icon(Icons.crop), label: "config")])
    );
  }
}
