import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/model_clothes.dart';
import '../network_layer/network_call.dart';
import 'package:flutter/cupertino.dart';
import '../entities/clothes.dart';

class Clothes_Provider extends ChangeNotifier {

  List<Clothes> clist = [];

  FirebaseNetworkCall networkCall = FirebaseNetworkCall();

  Future<void> getProviderClothes() async {
    var response = await networkCall.getClothes();
    var clothesList = response
        .map((e) => Clothes(
            name: e.name,
            image: e.image,
            color: e.color,
            price: e.price,
            description: e.description,
            size: e.size))
        .toList();
    clist=clothesList;

    notifyListeners();
    return;

  }
}
