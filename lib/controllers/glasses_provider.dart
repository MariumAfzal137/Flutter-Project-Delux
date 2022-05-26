import '../entities/glasses.dart';
import '../network_layer/network_call.dart';
import 'package:flutter/cupertino.dart';

class GlassesProvider extends ChangeNotifier {

  List<Glasses> glist = [];

  FirebaseNetworkCall networkCall = FirebaseNetworkCall();

  Future<void> getProviderGlasses() async {
    var response = await networkCall.getGlasses();
    var glassesList = response
        .map((e) => Glasses(
        name: e.name,
        image: e.image,
        color: e.color,
        price: e.price,))
        .toList();
    glist=glassesList;

    notifyListeners();
    return;

  }
}