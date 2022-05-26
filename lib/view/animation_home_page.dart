import 'package:flutter/material.dart';
import 'package:project/view/body.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);

  @override
  _AnimationHomePageState createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> with SingleTickerProviderStateMixin {
  late Animation<int> animation;
  late Animation<double> offsetAnimation;
  late AnimationController controller;

  double height = 100;
  double width = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(child: AnimatedLogo(animation: animation)),
          SizedBox(height: 200,),
          MaterialButton (
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
            },
            child: Text("View Products",style: TextStyle(color: Colors.white24,fontSize: 20),)
            ,
          )
        ],
      ),
    );
  }

  void initAnimation() async {
    final Animation<double> curve =
    CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = IntTween(begin: 0, end: 255).animate(curve);
    // animation = Tween<int>(begin: 0, end: 300).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {

      if (status == AnimationStatus.completed) controller.stop( );

      //if (status == AnimationStatus.dismissed) controller.forward();
      //controller.stop();
    });
    // await Future.delayed(const Duration(seconds: 1),(){
    //   //controller.stop();
    // });
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key? key, required Animation<int> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<int>;
    return Center(
      child: Transform.translate(
        offset: Offset(0, animation.value.toDouble()),
        child: Column(

          children: [
            Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: animation.value.toDouble(),
            width: animation.value.toDouble(),
            child: Image(image: AssetImage("assets/logo.jpeg")),

          ),
          ],
        ),
      ),

    );
  }
}