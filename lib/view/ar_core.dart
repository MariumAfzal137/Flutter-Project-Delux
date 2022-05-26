import 'package:ar_core/ar_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AugmentedReality extends StatefulWidget {
   AugmentedReality({required this.s,Key? key}) : super(key: key);
  String? s;
  @override
  _AugmentedRealityState createState() => _AugmentedRealityState();
}

class _AugmentedRealityState extends State<AugmentedReality> {
  @override
  Widget build(BuildContext context) {
    return Augmented(widget.s ?? "https://firebasestorage.googleapis.com/v0/b/delux-1997.appspot.com/o/Blacks%2Fboski.webp?alt=media&token=5b73ec27-33f5-4e5f-b7ca-d473fa2cc3b4");
  }
}