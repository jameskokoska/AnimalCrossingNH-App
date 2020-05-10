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
        children: [
          // ---------- Top Spacer ----------
          Column(
            children: <Widget>[
              Container(
                height: 150 * percentScale,
                color: darkModeColor(darkMode, Color( 0xFF81C0FF), Color( 0xff08354E)),
              ),
              // ---------- Card Body ----------
              Container(
                height: 490 * percentScale,
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
          ),
          // ---------- Card Body Content ----------
          CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                expandedHeight: 150.0,
                pinned: false,
                floating: false,
                snap: false,
              ),
              SliverPadding(
                padding: EdgeInsets.only(top:30 * percentScale),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1.4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                    return appContainer(percentScale, index, textColor);
                    },
                    childCount: 6,
                  ),
                ),
              ),
              SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:170,
                  )
              ),
            ],
          )
        ],
      )
    );
  }
}

Widget appContainer(double percentScale, int index, Color textColor){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: <Widget>[
          new Container(
            width: 88 * percentScale,
            height: 88 * percentScale,
            child: Center(
              child: Image.asset(
                'assets/' + appIconName[index],
                height:50*percentScale,
                width:50*percentScale,
              ),
            ),
            decoration: new BoxDecoration(
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
          new SizedBox(
              height: 10 * percentScale),
          new Text(appName[index],
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              color: Color(0xff64622c),
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