import 'package:book_mm/models/book.dart';
import 'package:book_mm/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import '../../my_pop_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0);

  List<BookItem> books = [
    BookItem(
        title: 'Test1',
        fontSize: 12.0,
        fontColor: const Color(0xFF123533),
        isActive: true,
        imageAsset: 'assets/images/1.png'),
    BookItem(
        title: 'Test2',
        fontSize: 12.0,
        fontColor: const Color(0xFF123643),
        isActive: true,
        imageAsset: 'assets/images/2.png'),
    BookItem(
        title: 'Test3',
        fontSize: 12.0,
        fontColor: const Color(0xFF127423),
        isActive: false,
        imageAsset: 'assets/images/3.png'),
    BookItem(
        title: 'Test4',
        fontSize: 12.0,
        fontColor: const Color(0xFF123123),
        isActive: false,
        imageAsset: 'assets/images/3.png'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  Future<void> setup() async {
    // Ставим запрет на скриншоты и запись
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void cachePrepare(BuildContext context) async {
    await Future.wait(books
        .where((element) => element.imageAsset != null)
        .map((photo) => precacheImage(AssetImage(photo.imageAsset!), context)));
  }

  @override
  Widget build(BuildContext context) {
    cachePrepare(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                itemCount: books.length,
                controller: controller,
                onPageChanged: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    color: Colors.lightBlue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${books[index].title}',
                          style: TextStyle(
                              fontSize: books[index].fontSize,
                              color: books[index].fontColor),
                        ),
                        // Промежуток между текстлом и картинкой
                        const SizedBox(
                          height: 100,
                        ),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (books[index].imageAsset != null)
                              Container(
                                width: 200,
                                height: 200,
                                color: Colors.grey,
                                child: Image.asset(books[index].imageAsset!),
                              ),
                            InkWell(
                              onTap: () {
                                Routes.router.navigate(Routes.bookpage,
                                    args: BookScreenArgument(
                                        bookItem: books[index]));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightGreenAccent
                                        .withOpacity(0.6)),
                                child: books[index].isActive
                                    ? Text('Start')
                                    : Text('Blocked'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: books
                        .asMap()
                        .entries
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: e.key == currentPage
                                        ? Colors.purple
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                              ),
                            ))
                        .toList(),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
