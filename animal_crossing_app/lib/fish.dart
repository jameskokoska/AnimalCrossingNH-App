import 'package:flutter/material.dart';

//class FishPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    return Container(
//      height: MediaQuery.of(context).size.height,
//      color: Colors.blue,
//    );
//  }
//}

class Fish extends StatefulWidget {
  Fish({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FishPageState createState() => _FishPageState();
}
