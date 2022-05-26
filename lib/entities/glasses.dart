import 'package:flutter/material.dart';

class Glasses {
  String name;
  String? image;
  Color? color;
  int price;
  bool isAdded=false;
  Glasses(
      {required this.name,
        this.image,
        this.color,
        required this.price,});
}
