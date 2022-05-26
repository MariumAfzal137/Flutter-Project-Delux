import 'dart:ui';

class ModelGlasses {
  String name;
  String? id;
  String? image;
  Color? color;
  int price;
  ModelGlasses(
      {required this.name,
        this.id,
        this.image,
        required this.color,
        required this.price,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color.toString();
    data['price'] = price;
    return data;
  }

  static ModelGlasses fromJson(Map<String, dynamic> json) {

    return  ModelGlasses(
      id: json['id'],
      name: json['name'],
      color: getColor(json['color']),
      price: json['price'],
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