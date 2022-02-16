import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/item_list_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                "FoodLister",
                style: AppTextStyles.appTitle,
              ),
            ),
          ),
          body: ItemList(),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.crop), label: "config")
          ]));
    });
  }
}
