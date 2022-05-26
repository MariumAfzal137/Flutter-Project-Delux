class UserModel {
  String? uid;
  String? email;
  String? name;
  String? address;
  String? phone;

  UserModel({this.uid, this.email, this.name, this.address, this.phone});

  // receiving data from server
  static UserModel fromMap(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] ,
        email: json['email'] ,
        name: json['name'] ,
        address: json['address'] ,
        phone: json['phone'],
      );

  // sending data to our server
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}
