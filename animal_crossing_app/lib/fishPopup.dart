import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fishList.dart';
import 'package:intl/intl.dart';

final bellsPrice = new NumberFormat("#,##0");
bool currentCaught = false;


Widget fishPopUp(double percentScale,bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec,String catchphrase){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            // ---------- Card Stack ----------
            Stack(
              children: [
                // ---------- Cheaty Background and curved card ----------
                Container(
                  transform: Matrix4.translationValues(0, -30*percentScale, 0),
                  height:340*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
                  )
                ),
                Container(
                  transform: Matrix4.translationValues(0, 20*percentScale, 0),
                  height:340*percentScale,
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
                      color:colorFishAccent,
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
                  width: 80*percentScale,
                  height: 80*percentScale,
                  // ---------- Card Location Image ----------
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          transform: Matrix4.translationValues(-13*percentScale,(31)*percentScale,0),
                          height:30,
                          width:70,
                          child: Text(capitalize(whereHow),
                          textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'ArialRoundedBold',
                                color: Color(0xff90a4ae),
                                fontSize: 11*percentScale,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                        ),
                      ),
                      new Container(
                        width: 55*percentScale,
                        height: 55*percentScale,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(100*percentScale),
                          color: Color(0xffB9F4FB)
                        )
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100*percentScale),
                        child: new Image.asset(
                          'assets/'+determineLocationImage(whereHow)+'.png',
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
                            opacity: caught ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Not found",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff90a4ae),
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
                            opacity: !caught ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Caught!",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff90a4ae),
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
                            top: caught ? 55*percentScale : 0,     //check needs changing to be based on current state
                            bottom: caught ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorCheckRed
                              )
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            top: !caught ? 55*percentScale : 0,      //check needs changing to be based on current state
                            bottom: !caught ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorCheckGreen,
                              )
                            ),
                          ),
                          Center(
                            child: Container(
                              transform: Matrix4.translationValues(0,(1)*percentScale,0),
                              child: new Transform.scale(
                                scale: 2*percentScale,
                                child: Theme(
                                  data: ThemeData(unselectedWidgetColor: Color(0x00F9E4E4)),
                                  child: new Checkbox(
                                    activeColor: Color(0x0499F9A9),
                                    checkColor: Color(0xFFFFFFFF),
                                    value: currentCaught,
                                    onChanged: (bool value) {
                                      setState(() {
                                        caught = value;
                                        currentCaught = value;
                                        saveBool("fishCheckList"+name, false, caught);
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
                
                  Center(
                    child: Container(
                      transform: Matrix4.translationValues(0, 50*percentScale, 0),
                      height: 340*percentScale,
                      width: 360*percentScale,
                      child: Column(
                        children: [
                          SizedBox(
                            height:10*percentScale,
                          ),
                          // ---------- Card Centre Quote ----------
                          AnimatedOpacity(
                            duration: Duration(milliseconds:200),
                            opacity: caught||showCatchPhraseNow ? 1 : 0,
                            child: Container(
                              width: 220*percentScale,
                              child: Text("“"+catchphrase+"”",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Baskerville',
                                  color: colorFishTextDarkBlue,
                                  fontSize: 14*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            height:10*percentScale,
                          ),
                          // ---------- Card Centre Name ----------
                          Container(
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
                          SizedBox(
                            height:20*percentScale,
                          ),
                          //Shadow
                          Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  width: 120*percentScale,
                                  height: 55*percentScale,
                                  decoration: new BoxDecoration(
                                    color: colorLightDarkAccent,
                                    borderRadius:  BorderRadius.circular(15*percentScale)
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 90*percentScale,
                                  height: 55*percentScale,
                                  child: new Image.asset(
                                    'assets/shadowNormal'+determineShadowImage(shadow, whereHow)+'.png',
                                    height: 70*percentScale,
                                    width: 100*percentScale,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:8*percentScale,
                          ),
                          //Shadow size
                          Container(
                            height: 45*percentScale,
                            width:200*percentScale,
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: new Image.asset(
                                    'assets/magnifyingGlass.png',
                                    height: 30*percentScale,
                                    width: 26*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 13*percentScale,
                                ),
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
                                ),
                              ],
                            ),
                          ),
                          //Sell price
                          Container(
                            width:200*percentScale,
                            height: 45*percentScale,
                           
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: new Image.asset(
                                    'assets/bellBag.png',
                                    height: 30*percentScale,
                                    width: 30*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 10*percentScale,
                                ),
                                Container(
                                  child: new Text(bellsPrice.format(int.parse(sell))+" bells",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ]
                            )
                          ),
                          
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ],
        )
      );
    }
  );
} 
