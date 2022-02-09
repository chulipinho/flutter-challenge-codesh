import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app_widget/app_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const AppWidget());
}
