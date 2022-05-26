import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/view/registrarion_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_provider.dart';
import '../controllers/clothes_provider.dart';
import '../controllers/signup_provider.dart';
import '../entities/clothes.dart';
import '../view/cart_page.dart';
import '../view/product_detail.dart';
import 'glasses_screen.dart';
import 'login_screen.dart';
import 'navigator_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Clothes> clothes_list = [];


  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    await Provider.of<Clothes_Provider>(context, listen: false)
        .getProviderClothes();


    setState(() {
      clothes_list =
          Provider.of<Clothes_Provider>(context, listen: false).clist;
    });
  }

  RangeValues _currentRangeValues = const RangeValues(20, 80);

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          height: 950,
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                alignment: Alignment.topRight,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'Assets/logo.jpeg',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text('DELUX',
                      style: TextStyle(fontSize: 18, color: Colors.black87)),
                  const Text(' CLOTHING',
                      style: TextStyle(fontSize: 18, color: Colors.black87)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Cotton'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Wash & Wear'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Linen'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Boski'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text(' Soft Cotton'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Blacks'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Blues'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Brown'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text('  Whites'),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Text(' Others'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              RangeSlider(
                values: _currentRangeValues,
                max: 80,
                divisions: 5,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              const Text('Price Range: Rs 4000 to Rs 8000'),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.black87,
        shadowColor: Colors.black12,
        title: Text(""),
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Provider.of<SignupProvider>(context, listen: false).signedIn == true
                            ? const RegistrationScreen()
                            : const LoginScreen()));
              });
            },
            child: Provider.of<SignupProvider>(context, listen: false).signedIn == true
                ? const Icon(Icons.verified_user)
                : const Icon(
                    Icons.person, // add custom icons also
                  )),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Provider.of<SignupProvider>(context, listen: false).signedIn == true ?
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()))
                      : Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GlassesScreen()));
                },
                child: const Icon(
                  Icons.remove_red_eye,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         showDialog(
          //           context: context,
          //           builder: (context) {
          //             return Dialog(
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20.0),
          //               ),
          //               backgroundColor: Colors.pinkAccent,
          //               child: dialogContent(context),
          //             );
          //           },
          //         );
          //       },
          //       icon: const Icon(Icons.filter_alt_outlined),
          //     ),
          //     const Text('SHOW FILTER'),
          //     const Spacer(),
          //
          //   ],
          // ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 400,
              ),
              itemCount: clothes_list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detail_page(c: clothes_list[index])));
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: SizedBox(
                          width: 1200,
                          height: 295,
                          child: Image.network(clothes_list[index].image ??
                              "https://www.gulahmedshop.com/media/catalog/product/3/0/300940_3_.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=&width="),
                        )),
                        Text(clothes_list[index].name,
                            style: TextStyle(fontSize: 12)),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          clothes_list[index].price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if(clothes_list[index].isAdded){

                              }
                              else{
                                Provider.of<SignupProvider>(context, listen: false).signedIn == true
                                    ? Provider.of<CartProvider>(context, listen: false).addCItem(
                                    clothes_list[index],
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
                            child: const Text("Add to cart",
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))
                                )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ],

      ),

    );
    //
  }
}
