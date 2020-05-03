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

class _FishPageState extends State<Fish>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}