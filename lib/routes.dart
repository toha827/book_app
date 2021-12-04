import 'package:book_mm/models/book.dart';
import 'package:book_mm/screens/book_screen/book_screen.dart';
import 'package:book_mm/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  Routes._();

  static final router = Seafarer(
    options: const SeafarerOptions(
      defaultTransitionDuration: Duration(
        microseconds: 500
      ),
      defaultTransitionCurve: Curves.slowMiddle
    )
  );

  static const String homepage = '/homepage';
  static const String bookpage = '/bookpage';

  static createRoutes() {
    router.addRoutes([
      SeafarerRoute(name: homepage, builder: (context, arg, params) => HomePage()),
      SeafarerRoute(name: bookpage, builder: (context, arg, params) => BookScreen(args: arg as BookScreenArgument)),
    ]);
  }
}

class BookScreenArgument extends BaseArguments {
  final BookItem bookItem;

  BookScreenArgument({required this.bookItem});
}