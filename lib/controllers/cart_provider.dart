
import 'package:project/controllers/signup_provider.dart';
import 'package:provider/provider.dart';
import '../entities/glasses.dart';
import '../network_layer/network_call.dart';
import 'package:flutter/cupertino.dart';
import '../entities/cart.dart';
import '../entities/clothes.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cartlist = [];

  FirebaseNetworkCall networkCall = FirebaseNetworkCall();

  Future<void> getProviderCart(String? uidOfUser) async {
      cartlist.clear();
    // Firebase API call

    var response = await networkCall.getCart();

    var ctList = response
        .map((e) => Cart(
      id:e.id,
        uid: e.uid,
        name: e.name,
        image: e.image,
        quantity: e.quantity,
        price: e.price))
        .toList();

    //cartlist=ctList;
      for(int i=0;i<ctList.length;i++){
        String? u= uidOfUser;
        if(ctList[i].uid==u){
          cartlist.add(ctList[i]);
        }
      }
    notifyListeners();
    return;

  }
  void deleteItem(Cart cartitem) async {
    cartlist.remove(cartitem);

    await networkCall.deleteFromCart(cartitem);
    notifyListeners();

  }
  void addQuantity(Cart cartitem,int index) async {
    cartlist[index].quantity++;
    await networkCall.addQuan(cartitem,cartlist[index].quantity);
    notifyListeners();

  }
  void subQuantity(Cart cartitem,int index) async {
    cartlist[index].quantity--;
    await networkCall.subQuan(cartitem,cartlist[index].quantity);
    notifyListeners();

  }
  void addCItem(Clothes item,String? u) async {

    Cart cartitem =Cart(price:item.price,quantity: 1,uid: u,image: item.image,name: item.name);
    cartlist.add(cartitem);
    print(cartlist.length);

    await networkCall.AddToCart(cartitem);
    notifyListeners();

  }
  void addGItem(Glasses item,String? u) async {

    Cart cartitem =Cart(price:item.price,quantity: 1,uid: u,image: item.image,name: item.name);
    cartlist.add(cartitem);
    print(cartlist.length);

    await networkCall.AddToCart(cartitem);
    notifyListeners();

  }

}
