import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_provider.dart';
import '../entities/cart.dart';
import 'body.dart';

class OrderConfirmed extends StatefulWidget {
  OrderConfirmed({Key? key, required this.totalv}) : super(key: key);
  int totalv;
  @override
  _OrderConfirmedState createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  @override
  Widget build(BuildContext context) {
    List<Cart> cart_list =
        Provider.of<CartProvider>(context, listen: false).cartlist;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            Spacer(),
            IconButton(
                icon: Icon(Icons.home),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }),
            SizedBox(width: 100)
          ],
        ),
        body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: cart_list.length + 1,
              itemBuilder: (context, index) {
                if (index == cart_list.length) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                      const Text("Order Complete",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff39393b))),
                      Text("Total Rs ${widget.totalv.toString()}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff39393b))),
                    ],
                  );
                }

                return Card(
                    child: ListTile(
                  title: Text(cart_list[index].name ?? ""),
                  subtitle: Text("Rs. " + cart_list[index].price.toString()),
                ));
              }),

          //]
        ));
  }
}
