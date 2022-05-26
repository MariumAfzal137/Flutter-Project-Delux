import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/user.dart';
import '../models/model_clothes.dart';
import '../models/user_model.dart';
import '../network_layer/network_call.dart';
import 'package:flutter/cupertino.dart';
import '../entities/clothes.dart';

class SignupProvider extends ChangeNotifier {
  bool signedIn=false;
  late UserModel u;
  Future<void> Signin(String uid) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    var response=await ref
        .doc(uid).get();
        var resp=response.data() as Map<String, dynamic>;
        u=UserModel.fromMap(resp);
        signedIn=true;
        notifyListeners();

  }
}
