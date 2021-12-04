import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPopUpMenu extends StatefulWidget {
  final Widget child;
  final Widget popUpChild;

  const MyPopUpMenu({Key? key, required this.child, required this.popUpChild}) : super(key: key);

  @override
  _MyPopUpMenuState createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showPopUp,
      child: widget.child,
    );
  }

  void _showPopUp() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          RenderBox renderBox = (widget.child.key as GlobalKey)
              .currentContext
              ?.findRenderObject() as RenderBox;
          Offset position = renderBox.localToGlobal(Offset.zero);

          return Container(
            child: Stack(
              children: [
                Positioned(
                    top: position.dy,
                    left: position.dx,
                    child: widget.popUpChild)
              ],
            ),
          );
        });
  }
}
