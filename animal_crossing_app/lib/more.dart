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
      body: Column(
        children: [
          // ---------- Top Spacer ----------
          Container(
            height: 150 * percentScale,
            color: darkModeColor(darkMode, Color( 0xFF81C0FF), Color( 0xff08354E)),
          ),
          // ---------- Card Body ----------
          Stack(
            children: [
              Container(
                height: 490,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60*percentScale),
                color: Color(0xfffefdfc),
                boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0
                  ) ],
                )
              ),
            ],
          )
        ],
      )
    );
  }
}
