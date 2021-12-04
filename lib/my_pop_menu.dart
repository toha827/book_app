import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  final Widget child;

  const PopUpMenu({Key? key, required this.child}) : super(key: key);

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showPopUpMenu,
      child: widget.child,
    );
  }

  void _showPopUpMenu() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          //Find renderbox object
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
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          );
        });
  }
}
