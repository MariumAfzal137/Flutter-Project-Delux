import 'package:flutter/material.dart';

class Clothes {
  String name;
  String? image;
  Color? color;
  int price;
  String? description;
  String? size;
  bool isAdded=false;
  Clothes(
      {required this.name,
       this.image,
       this.color,
      required this.price,
      this.description,
       this.size});
}
