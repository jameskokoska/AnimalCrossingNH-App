import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fishList.dart';
import 'package:intl/intl.dart';

Widget fishPopUp(double percentScale,bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Scaffold(
        body: Column(
          children: [
            // ---------- Card Stack ----------
            Stack(
              children: [
                // ---------- Cheaty Background and curved card ----------
                Container(
                  transform: Matrix4.translationValues(0, -30*percentScale, 0),
                  height:400,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
                  )
                ),
                Container(
                  transform: Matrix4.translationValues(0, 0, 0),
                  height:400,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
                  )
                ),
                // ---------- Card Tab ----------
                new Center(
                  child: new Container(
                    transform: Matrix4.translationValues(0, -90*percentScale, 0),
                    width: 113*percentScale,
                    height: 113*percentScale,
                    // ---------- Card Tab Image ----------
                    child: new Center(
                      child: new Center(
                        child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80*percentScale,
                            height: 80*percentScale,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4*percentScale),
                              image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          imageUrl: iconImage,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
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
                  transform: Matrix4.translationValues(15*percentScale, -15*percentScale, 0),
                  width: 55*percentScale,
                  height: 55*percentScale,
                  // ---------- Card Location Image ----------
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          transform: Matrix4.translationValues((0)*percentScale,(37)*percentScale,0),
                          child: Text(capitalize(whereHow),
                              style: TextStyle(
                                fontFamily: 'ArialRoundedBold',
                                color: Color(0xff3a3a3a),
                                fontSize: 11*percentScale,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                        ),
                      ),
                      new Container(
                        width: 60*percentScale,
                        height: 60*percentScale,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(100*percentScale),
                          color: Color(0xffB9F4FB)
                        )
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100*percentScale),
                        child: new Image.asset(
                          'assets/ocean.png',
                          height: 55*percentScale,
                          width: 55*percentScale,
                        )
                      ),
                    ],
                  ),
                ),
                // ---------- Card Caught ----------
                new Container(
                  transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                  // ---------- Card Body Caught Image ----------
                  child: Container(
                    width: 55*percentScale,
                    height: 55*percentScale,
                      child: Stack(
                        children: <Widget>[
                          AnimatedOpacity(
                            duration: Duration(milliseconds:300),
                            opacity: check ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Not found",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 11*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds:200),
                            opacity: !check ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Caught!",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 11*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            top: check ? 55*percentScale : 0,     //check needs changing to be based on current state
                            bottom: check ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF9E4E4)
                              )
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            top: !check ? 55*percentScale : 0,      //check needs changing to be based on current state
                            bottom: !check ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF99F9A9)
                              )
                            ),
                          ),
                          Center(
                            child: Container(
                              child: new Transform.scale(
                                scale: 2.5*percentScale,
                                child: Theme(
                                  data: ThemeData(unselectedWidgetColor: Color(0x00F9E4E4)),
                                  child: new Checkbox(
                                    activeColor: Color(0x0499F9A9),
                                    checkColor: Color(0xFF444444),
                                    value: check,
                                    onChanged: (bool value) {
                                      setState(() {
                                        check = value;
                                        HapticFeedback.mediumImpact();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                // ---------- Card Centre Content ----------
                new Center(
                  child: Column(
                    children: [
                      // ---------- Card Centre Quote ----------
                      Container(
                        transform: Matrix4.translationValues(0, 50*percentScale, 0),
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
                        transform: Matrix4.translationValues(0, 70*percentScale, 0),
                        child: new Text(capitalize(name),
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
                        transform: Matrix4.translationValues(0, 90*percentScale, 0),
                        child: Stack(
                          children: [
                            // ---------- Card Centre Sell Price Image ----------
                            Container(
                              transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                              child: new Image.asset(
                                'assets/bellBag.png',
                                height: 30*percentScale,
                                width: 30*percentScale,
                              ),
                            ),
                            // ---------- Card Centre Sell Price Text ----------
                            Container(
                              child: new Text(sell+" bells",
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
                          transform: Matrix4.translationValues(0, 90*percentScale, 0),
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
                                  child: new Text(capitalize(shadow),
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
                      // // ---------- Card Centre Rarity ----------
                      // Container(
                      //     transform: Matrix4.translationValues(0, 90*percentScale, 0),
                      //     child: Stack(
                      //         children: [
                      //           // ---------- Card Centre Rarity Image ----------
                      //           Container(
                      //             transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                      //             child: new Image.asset(
                      //               'assets/fish.png',
                      //               height: 30*percentScale,
                      //               width: 30*percentScale,
                      //             ),
                      //           ),
                      //           // ---------- Card Centre Rarity Text ----------
                      //           Container(
                      //             child: new Text("Rare",
                      //                 style: TextStyle(
                      //                   fontFamily: 'ArialRoundedBold',
                      //                   color: Color(0xff3a3a3a),
                      //                   fontSize: 19*percentScale,
                      //                   fontWeight: FontWeight.w400,
                      //                   fontStyle: FontStyle.normal,
                      //                 )
                      //             ),
                      //           )
                      //         ]
                      //     )
                      // )
                    ],
                  )
                )
              ],
            ),
          ],
        )
      );
    }
  );
} 
