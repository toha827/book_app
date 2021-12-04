import 'package:flutter/material.dart';

class BookItem {
  final String? title;
  final double? fontSize;
  final Color? fontColor;
  final bool isActive;
  final String? imageAsset;

  BookItem(
      {this.title,
      this.fontSize,
      this.fontColor,
      this.isActive = false,
      this.imageAsset});
}
