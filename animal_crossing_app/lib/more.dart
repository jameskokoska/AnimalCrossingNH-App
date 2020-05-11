import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;


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
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // ---------- Top Spacer ----------
                SizedBox(
                  height: 60 * percentScale,
                ),
                Stack(
                  children: <Widget>[
                    // ---------- Card Body ----------
                    Container(
                      height: 580 * percentScale,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60*percentScale),
                        color: darkModeColor(darkMode,Color(0xFFFFFFFF),Color(0xFF000000)),
                        boxShadow: [BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0,3),
                          blurRadius: 6,
                          spreadRadius: 0
                        ) ],
                      ),
                      // ---------- Card Body Content ----------
                      child: CustomScrollView(
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: EdgeInsets.only(top:60 * percentScale),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.2
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                return appContainer(percentScale, index, textColor, darkMode);
                                },
                                childCount: appColour.length,
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child:Container(
                              height:0,
                            )
                          ),
                        ],
                      ),
                    ),
                    // ---------- Title ----------
                    Transform.rotate(
                      angle: -math.pi / 20.0,
                      child: Container(
                        transform: Matrix4.translationValues(21*percentScale,-8*percentScale,0),
                        width: 105*percentScale,
                        height: 35*percentScale,
                        decoration: new BoxDecoration(
                          color: darkModeColor(darkMode,Color(0xFFFFFFFF),Color(0xff202020)),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                            color:  darkModeColor(darkMode,Color(0x28000000),Color(0x409D99FC)),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                          ) ],
                        ),
                        child: Center(
                          child: Text("More Pages",
                              style: TextStyle(
                                fontFamily: 'ArialRoundedBold',
                                color: darkModeColor(darkMode,Color(0xFF000000),Color(0xFFFFFFFF)),
                                fontSize: 16*percentScale,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

Widget appContainer(double percentScale, int index, Color textColor, bool darkMode){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: <Widget>[
          new Container(
            width: 90,
            height: 90,
            child: Center(
              child: Image.asset(
                'assets/' + appIconName[index],
                height: 60 * percentScale,
                width: 60 * percentScale,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(appColour[index]),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0,3),
                blurRadius: 6,
                spreadRadius: 0
              ) ],
            )
          ),
          SizedBox(
              height: 10 * percentScale),
          Text(appName[index],
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              color: darkModeColor(darkMode,Color(0xff64622c),Color(0xfff4ebd6)),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )
          )
        ],
      );
    }
  );
}

bool check = false;
List<int> appColour = [0xffacffb5, 0xfffbff8b, 0xffffda9b, 0xffffa2a2, 0xff8dd1ff, 0xffbababa];
List<String> appIconName = ["leaf.png", "emote.png", "cat.png", "flower.png", "music.png", "settings.png"];
List<String> appName = ["Furniture", "Emotipedia", "Villagers", "Flowers", "Music", "Settings"];