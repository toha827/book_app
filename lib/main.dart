import 'package:book_mm/my_pop_menu.dart';
import 'package:book_mm/routes.dart';import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:book_mm/screens/home_screen/home_screen.dart';
import 'package:book_mm/screens/initial_screen.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';


import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  Routes.createRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Routes.router.navigatorKey,
      onGenerateRoute: Routes.router.generator(),
      home: InitialScreen(),
    );
  }
}