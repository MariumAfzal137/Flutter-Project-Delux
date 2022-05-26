import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/cart_provider.dart';
import '../controllers/signup_provider.dart';
import '../entities/clothes.dart';
import '../entities/glasses.dart';
import 'ar_core.dart';
import 'login_screen.dart';

class GlassesDetail extends StatefulWidget {
  GlassesDetail({Key? key, required this.c}) : super(key: key);
  Glasses c;
  @override
  State<GlassesDetail> createState() => _GlassesDetailState();
}

class _GlassesDetailState extends State<GlassesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child:
                  Hero(
                    tag: "https://www.gulahmedshop.com/media/catalog/product/3/0/300940_3_.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=560&width=373",
                    child: Image.network(widget.c.image ??
                        "https://www.gulahmedshop.com/media/catalog/product/3/0/300940_3_.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=560&width=373",
                      fit: BoxFit.fill, height: 1500,),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.c.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xff39393b),
                            ),
                          ),

                          SizedBox(height: 20,),
                          Text(
                            "Rs ${widget.c.price}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff39393b),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Price Inclusive of all Taxes",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff979797),
                        ),
                      ),
                      const SizedBox(height: 55,),
                      ElevatedButton(
                          onPressed: () {
                            if(widget.c.isAdded){

                            }
                            else{
                              Provider.of<SignupProvider>(context, listen: false).signedIn == true
                                  ? Provider.of<CartProvider>(context, listen: false).addGItem(
                                  widget.c,
                                  Provider.of<SignupProvider>(context,
                                      listen: false)
                                      .u
                                      .uid)
                                  : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            // Background color
                          ),
                          child: const Text('Add to Cart', style: TextStyle(
                              fontSize: 12, color: Colors.white))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) =>
                                AugmentedReality(s: widget.c.image)));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            // Background color
                          ),
                          child: const Text('TRY IT ON', style: TextStyle(
                              fontSize: 12, color: Colors.red)))
                    ],
                  ),
                ),
              )
            ]
            )
        )
    );
  }
}