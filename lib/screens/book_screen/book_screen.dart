import 'package:book_mm/models/book.dart';
import 'package:book_mm/routes.dart';
import 'package:book_mm/widgets/my_pop_up_menu.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  final BookScreenArgument args;

  const BookScreen({Key? key, required this.args}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
      ),
      body: Wrap(
        spacing: 8,
        children: [
          ..."Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
              .split(' ')
              .map(
                (e) => MyPopUpMenu(
                  popUpChild: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                    child: Container(
                      key: GlobalKey(),
                  child: Text(e),
                )),
              )
        ],
      ),
    );
  }
}
