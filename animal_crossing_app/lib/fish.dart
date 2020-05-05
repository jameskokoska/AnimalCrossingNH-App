import 'package:flutter/material.dart';

class Fish extends StatefulWidget {
  Fish({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FishPageState createState() => _FishPageState();
}

class _FishPageState extends State<Fish>{

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double designedWidth = 360;

    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    double designedHeight = 640;

    double percentWidth = deviceWidth / designedWidth;
    double percentHeight = deviceHeight / designedHeight;

    double percentScale;

    if (percentWidth < percentHeight) {
      percentScale = percentWidth;
    } else {
      percentScale = percentHeight;
    }
    return Scaffold(
      body:
        Column(
          children: [
            // ---------- Top spacer ----------
            new SizedBox(
              height: 170*percentHeight,
            ),
            // ---------- Card Stack ----------
            Stack(
              children: [
                // ---------- Card Body ----------
                new Container(
                  width: 360*percentScale,
                  height: 459*percentScale,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xffffffff),
                      boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 6,
                        spreadRadius: 0
                      )],
                  )
                ),
                // ---------- Card Tab ----------
                new Center(
                  child: new Container(
                    transform: Matrix4.translationValues(0, -60*percentScale, 0),
                    width: 113*percentScale,
                    height: 113*percentScale,
                    // ---------- Card Tab Image ----------
                    child: new Center(
                      child: new Image.asset(
                        'assets/fish.png',
                        height: 80*percentScale,
                        width: 80*percentScale,
                      )
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color: Color(0xffdefeff),
                      boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 6,
                        spreadRadius: 0
                      )],
                    )
                  ),
                ),
                // ---------- Card Location ----------
                new Container(
                  transform: Matrix4.translationValues(10*percentScale, 10*percentScale, 0),
                  width: 60*percentScale,
                  height: 60*percentScale,
                  // ---------- Card Location Image ----------
                  child: new Center(
                    child: new Image.asset(
                      'assets/fish.png',
                      height: 50*percentScale,
                      width: 50*percentScale,
                    )
                  ),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(100*percentScale),
                    color: Color(0xffb9f4fb)
                  )
                ),
                // ---------- Card Caught ----------
                new Container(
                  transform: Matrix4.translationValues(290*percentScale, 10*percentScale, 0),
                  width: 60*percentScale,
                  height: 60*percentScale,
                    // ---------- Card Body Caught Image ----------
                    child: new Center(
                      child: new Image.asset(
                        'assets/fish.png',
                        height: 50*percentScale,
                        width: 50*percentScale,
                      )
                    ),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(100*percentScale),
                    color: Color(0xff99f9a9)
                  )
                ),
                // ---------- Card Centre Content ----------
                new Center(
                  child: Column(
                    children: [
                      // ---------- Card Centre Quote ----------
                      Container(
                        transform: Matrix4.translationValues(0, 80*percentScale, 0),
                        child: Text("“I caught a red snapper! \u000bIt looks pretty dapper!”",
                          style: TextStyle(
                            fontFamily: 'Baskerville',
                            color: Color(0xff625dde),
                            fontSize: 14*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          )
                        ),
                      ),
                      // ---------- Card Centre Name ----------
                      Container(
                        transform: Matrix4.translationValues(0, 100*percentScale, 0),
                        child: new Text("Red Snapper",
                          style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: Color(0xff373737),
                            fontSize: 31*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                      // ---------- Card Centre Sell Price ----------
                      Container(
                        transform: Matrix4.translationValues(0, 120*percentScale, 0),
                        child: Stack(
                          children: [
                            // ---------- Card Centre Sell Price Image ----------
                            Container(
                              transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                              child: new Image.asset(
                                'assets/fish.png',
                                height: 30*percentScale,
                                width: 30*percentScale,
                              ),
                            ),
                            // ---------- Card Centre Sell Price Text ----------
                            Container(
                              child: new Text("5,000 bells",
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color: Color(0xff3a3a3a),
                                    fontSize: 19*percentScale,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),
                            )
                          ]
                        )
                      ),
                      // ---------- Card Centre Size ----------
                      Container(
                          transform: Matrix4.translationValues(0, 120*percentScale, 0),
                          child: Stack(
                              children: [
                                // ---------- Card Centre Size Image ----------
                                Container(
                                  transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                                  child: new Image.asset(
                                    'assets/fish.png',
                                    height: 30*percentScale,
                                    width: 30*percentScale,
                                  ),
                                ),
                                // ---------- Card Centre Size Text ----------
                                Container(
                                  child: new Text("Large",
                                      style: TextStyle(
                                        fontFamily: 'ArialRoundedBold',
                                        color: Color(0xff3a3a3a),
                                        fontSize: 19*percentScale,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )
                                  ),
                                )
                              ]
                          )
                      ),
                      // ---------- Card Centre Rarity ----------
                      Container(
                          transform: Matrix4.translationValues(0, 120*percentScale, 0),
                          child: Stack(
                              children: [
                                // ---------- Card Centre Rarity Image ----------
                                Container(
                                  transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                                  child: new Image.asset(
                                    'assets/fish.png',
                                    height: 30*percentScale,
                                    width: 30*percentScale,
                                  ),
                                ),
                                // ---------- Card Centre Rarity Text ----------
                                Container(
                                  child: new Text("Rare",
                                      style: TextStyle(
                                        fontFamily: 'ArialRoundedBold',
                                        color: Color(0xff3a3a3a),
                                        fontSize: 19*percentScale,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )
                                  ),
                                )
                              ]
                          )
                      )
                    ],
                  )
                )
              ],
            ),
          ],
        )
    );
  }
}