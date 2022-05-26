import '../network_layer/network_call.dart';
import 'package:flutter/material.dart';
import '../entities/clothes.dart';
import '../entities/glasses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Model_Clothes {
  String name;
  String? id;
  String? image;
  Color? color;
  int price;
  String? description;
  String? size;
  Model_Clothes(
      {required this.name,
       this.id,
       this.image,
      required this.color,
      required this.price,
      this.description,
       this.size});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['color'] = color.toString();
    data['price'] = price;
    data['size'] = size;
    return data;
  }

  static Model_Clothes fromJson(Map<String, dynamic> json) {

   return  Model_Clothes(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      color: getColor(json['color']),
      price: json['price'],
      size: json['size'],
      image: json['image'],

    );
  }
  static Color? getColor(String? c){
    if(c=="white") return Color(0xFFFFFFFF);
    if(c=="brown") return Color(0xFF5D4037);
    if(c=="blue") return Color(0xFF0D47A1);
    else { return Color(0xFF000000);}

  }
}
