class Model_Cart {
  String? id;
  String? uid;
  String? name;
  int quantity;
  int price;
  String? image;

  Model_Cart(
      {this.name,
        this.uid,
      required this.quantity,
      required this.price,
      this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }

  static Model_Cart fromJson(Map<String, dynamic> json) {
    return Model_Cart(

      uid: json['uid'],
      name: json['name'] ,
      price: json['price'] ,
      quantity: json['quantity'] ,
      image: json['image'] ,
    );
  }
  }
