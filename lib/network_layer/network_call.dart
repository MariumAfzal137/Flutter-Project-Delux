import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/model_clothes.dart';
import '../entities/cart.dart';
import '../models/model_cart.dart';
import '../models/model_glasses.dart';
import '../models/user_model.dart';

// abstract class NetworkCall {
//   Future<QuerySnapshot<Object?>> getClothes();
//
//   Future<QuerySnapshot<Object?>> getGlasses();
// }
//implements NetworkCall
class FirebaseNetworkCall {
  final _auth = FirebaseAuth.instance;
  @override
  Future<List<Model_Clothes>> getClothes() async {
    List<Model_Clothes> clist = [];
    CollectionReference ref = FirebaseFirestore.instance.collection('clothes');
    //int count=0;
   await ref.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        //print(count++);
        Model_Clothes newitem =
            Model_Clothes.fromJson(doc.data() as Map<String, dynamic>);

        clist.add(newitem);
      }
    });

    return clist;
  }

  Future<List<Model_Cart>> getCart() async {
    List<Model_Cart> cartlist = [];

    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    var response = await ref.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Model_Cart newitem =
        Model_Cart.fromJson(doc.data() as Map<String, dynamic>);
        newitem.id=doc.id;
        cartlist.add(newitem);
      }
    });
    return cartlist;
  }

  @override
  Future<List<ModelGlasses>> getGlasses() async {
    List<ModelGlasses> glist = [];
    CollectionReference ref = FirebaseFirestore.instance.collection('sunglasses');
    await ref.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {

        ModelGlasses newitem =
        ModelGlasses.fromJson(doc.data() as Map<String, dynamic>);
        newitem.id=doc.id;
        glist.add(newitem);
      }
    });
    return glist;
  }

  Future<void> deleteFromCart(Cart item)async{
    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    await ref
        .doc(item.uid).delete()
        .then((value) => print("item deleted"))
        .catchError((error) => print("item not deleted: $error"));

  }

  Future<void> AddToCart(Cart item)async{
    Model_Cart cartModel = Model_Cart(uid: item.uid,image: item.image, name: item.name,quantity: item.quantity, price: item.price);
    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    await ref
        .doc()
        .set(cartModel.toJson());
    Fluttertoast.showToast(msg: "Item added to cart successfully :) ");


  }


  Future<void> addQuan(Cart item,int q)async{
    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    await ref
        .doc(item.id).update({'quantiy':q})
        .then((value) => print("user updated"))
        .catchError((error) => print("user not updated: $error"));


  }
  Future<void> subQuan(Cart item,int q)async{
    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    await ref
        .doc(item.id).update({'quantiy':q})
        .then((value) => print("user updated"))
        .catchError((error) => print("user not updated: $error"));


  }
  postDetailsToFirestore(String? name,String? address,String? phone) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = name;
    userModel.address = address;
    userModel.phone=phone;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    // Navigator.pushAndRemoveUntil(
    //     (context),
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //         (route) => false);
  }
}
