import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCollectedTool = false;


Widget toolsPopUp(double percentScale,bool collected,String name,String imageLink,String variation, String bodyTile, String diy, String customize, String kitCost, String uses, String stackSize, String buy, String sell, String color1, String color2, String size, String set, String milesPrice, String source, String version, String filename, String variantID, String internalID, String uniqueEntryID){
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
                  height:400*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
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
                          imageUrl: imageLink,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color:Color(0xFFE0F2F1),
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
                            opacity: collected ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("",
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
                            opacity: !collected ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Collected",
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
                            top: collected ? 55*percentScale : 0,     //check needs changing to be based on current state
                            bottom: collected ? 55*percentScale : 0,
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
                            top: !collected ? 55*percentScale : 0,      //check needs changing to be based on current state
                            bottom: !collected ? 55*percentScale : 0,
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
                                    value: currentCollectedTool,
                                    onChanged: (bool value) {
                                      setState(() {
                                        collected = value;
                                        currentCollectedTool = value;
                                        saveBool("toolsCheckList"+name+variation, false, collected);
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
                    transform: Matrix4.translationValues(0, 70*percentScale, 0),
                    height: 340*percentScale,
                    width: 360*percentScale,
                    child: Column(
                      children: [
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
                          height:10*percentScale,
                        ),
                        Container(
                          width: 220*percentScale,
                          child: Text(uses + " Uses",
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
                        SizedBox(
                          height:10*percentScale,
                        ),

                        //birthday
                        infoContainer(percentScale, 'bellBag.png', buy),
                        //species
                        infoContainer(percentScale, 'bellBag.png',sell),
                        //personaility
                        infoContainer(percentScale, 'magnifyingGlass.png', source),
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

