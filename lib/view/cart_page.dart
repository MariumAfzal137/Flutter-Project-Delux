import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/cart_provider.dart';
import '../controllers/signup_provider.dart';
import '../entities/cart.dart';
import '../view/order_confirmed.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Cart> cart_list = [];
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    await Provider.of<CartProvider>(context, listen: false).getProviderCart(
       Provider.of<SignupProvider>(context, listen: false).u.uid
    );
    setState(() {
      cart_list = Provider.of<CartProvider>(context, listen: false).cartlist;
    });

    for (int i = 0; i < cart_list.length; i++) {
      print(cart_list[i].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          shape: const UnderlineInputBorder(borderSide: BorderSide(width: 2)),
          title:
              const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: cart_list.length==0?
        Column(
          children: [

            Text("Fill your cart"),
          ],
        )
            :
        Column(
          children: [

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cart_list.length,
                  itemBuilder: (context, index) {
                    total = total + cart_list[index].price*cart_list[index].quantity;

                    return ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(),
                        side: BorderSide(color: Colors.black),
                      ),
                      leading: Image.network(
                          cart_list[index].image ??
                              "https://firebasestorage.googleapis.com/v0/b/delux-1997.appspot.com/o/Blacks%2Fcotton.webp?alt=media&token=aaeabcc2-97b0-4c10-ae2b-3c6b9efc744d",
                          fit: BoxFit.fill),
                      title: Text(cart_list[index].name ?? ""),
                      subtitle: Text(" Price Rs " +
                          cart_list[index].price.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              if (cart_list[index].quantity == 1) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              'Do you want to remove this item from the cart?'),
                                          content: Text(
                                              'This will delete the item from the cart.'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  setState(() {
                                                    Provider.of<CartProvider>(
                                                            context,
                                                            listen: false)
                                                        .deleteItem(
                                                            cart_list[index]);
                                                  });
                                                },
                                                child: Text('Yes')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('No'))
                                          ],
                                        ));
                                //setState(() {});
                              } else {
                                setState(() {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .subQuantity(cart_list[index], index);
                                });
                              }
                            },
                          ),
                          Text(cart_list[index].quantity.toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addQuantity(cart_list[index], index);
                              });
                            },
                            icon: Icon(Icons.add_circle),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderConfirmed(totalv: total)));
                },
                child: Text("Confirm Order"))
          ],
        ));
  }
}
