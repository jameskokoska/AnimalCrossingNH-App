import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MorePage extends StatefulWidget {
  MorePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage>{
  @override
  Widget build(BuildContext context){
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    double deviceWidth = MediaQuery.of(context).size.width;
    double designedWidth = 360;

    double deviceHeight = MediaQuery.of(context).size.height;
    double designedHeight = 640;

    double percentWidth = deviceWidth/designedWidth;
    double percentHeight = deviceHeight/designedHeight;

    double percentScale;

    if(percentWidth < percentHeight){
      percentScale = percentWidth;
    } else {
      percentScale = percentHeight;
    }

    Color textColor;
    if(!darkMode)
      textColor = Color( 0xFFFFFFFF);
    else
      textColor = Color( 0xFFF5F5F5);

      
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: darkModeColor(darkMode, Color( 0xFF81C0FF), Color( 0xff08354E)),
          ),
        ],
      )
    );
  }
}
