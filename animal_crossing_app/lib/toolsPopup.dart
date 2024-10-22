import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gridList.dart';


final bellsPrice = new NumberFormat("#,##0");


Widget toolsPopUp(double percentScale,Color colorTextBlack,var snapshotData){
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
                      color: colorWhite,
                  )
                ),
                Container(
                  transform: Matrix4.translationValues(0, 20*percentScale, 0),
                  height:400*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: colorWhite,
                  )
                ),
                // ---------- Card Tab ----------
                new Center(
                  child: new Container(
                    transform: Matrix4.translationValues(0, -85*percentScale, 0),
                    width: 113*percentScale,
                    height: 113*percentScale,
                    // ---------- Card Tab Image ----------
                    child: new Center(
                      child: new Center(
                        child:  CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80*percentScale,
                            height: 80*percentScale,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4*percentScale),
                              image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          imageUrl: snapshotData.image,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color:colorToolsAccent,
                      boxShadow: [BoxShadow(
                        color: colorShadowPopUp,
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
                ),
                // ---------- Card favorite ----------
                new Container(
                  transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                  // ---------- Card Body Collected Image ----------
                  child: Container(
                      width: 55*percentScale,
                      height: 55*percentScale,
                      child: Stack(
                        children: <Widget>[
                          AnimatedOpacity(
                            duration: Duration(milliseconds:300),
                            opacity: popupCollectedGrid ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: colorCircleContainerPopUp,
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
                            opacity: !popupCollectedGrid ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Collected",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: colorCircleContainerPopUp,
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
                            top: popupCollectedGrid ? 55*percentScale : 0,     //check needs changing to be based on current state
                            bottom: popupCollectedGrid ? 55*percentScale : 0,
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
                            top: !popupCollectedGrid ? 55*percentScale : 0,      //check needs changing to be based on current state
                            bottom: !popupCollectedGrid ? 55*percentScale : 0,
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
                                    checkColor: colorWhite,
                                    value: popupCollectedGrid,
                                    onChanged: (bool value) {
                                      setState(() {
                                        popupCollectedGrid = value;
                                        saveBool(getKey(snapshotData,"Tools"), false, popupCollectedGrid);
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
                circleContainer(percentScale, colorToolsAccent, colorCircleContainerPopUp, snapshotData.source),
                // ---------- Card Centre Content ----------
                Center(
                  child: Container(
                    transform: Matrix4.translationValues(0, 70*percentScale, 0),
                    height: 340*percentScale,
                    
                    child: Column(
                      children: [
                        Container(
                          width: 250*percentScale,
                          child: new Text(capitalize(snapshotData.name),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'ArialRoundedBold',
                              color: colorTextBlack,
                              fontSize: 31*percentScale,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                        SizedBox(
                          height:10*percentScale,
                        ),
                        quoteContainer(percentScale, colorTextBlack, snapshotData.uses + " Uses"),
                        SizedBox(
                          height:10*percentScale,
                        ),

                        //birthday
                        infoContainer(percentScale, 'bellBag.png', snapshotData.buy),
                        //species
                        infoContainer(percentScale, 'coin.png',snapshotData.sell),
                        //personaility
                        infoContainer(percentScale, 'magnifyingGlass.png', snapshotData.source),
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

