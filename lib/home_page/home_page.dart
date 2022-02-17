import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';
import 'package:flutter_challenge/home_page/controller/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/credits_widget.dart';
import 'package:flutter_challenge/home_page/widgets/item_list_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bodyList = [
    {'page': ItemList(), 'title': 'FoodLister'},
    {'page': CreditsWidget(), 'title': 'Credits'}
  ];
  int _curentIndex = 0;

  void setIndex(int index) {
    setState(() {
      _curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);

    controller.load();

    return Observer(builder: (context) {
      if (controller.state != HomeState.loaded) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              bodyList[_curentIndex]['title'] as String,
              style: AppTextStyles.appTitle,
            ),
          ),
        ),
        body: bodyList[_curentIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: "Credits")
          ],
          onTap: setIndex,
          currentIndex: _curentIndex,
        ),
      );
    });
  }
}
