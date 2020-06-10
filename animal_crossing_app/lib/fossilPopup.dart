import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCollectedFossil = false;


Widget fossilPopUp(double percentScale, bool collected, String name, String image, String sell, String source){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(0, -30*percentScale, 0),
                  height:300*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
                  )
                ),
                new Center(
                  child: new Container(
                    transform: Matrix4.translationValues(0, -90*percentScale, 0),
                    width: 113*percentScale,
                    height: 113*percentScale,
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
                          imageUrl: image,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color:Color(0xFFF5EDE2),
                      boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 6,
                        spreadRadius: 0
                      )],
                    )
                  ),
                ),
                
                circleContainer(percentScale, Color(0x5e533f00), Color(0xff90a4ae), source),
                new Container(
                  transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                  child: Container(
                    width: 55*percentScale,
                    height: 55*percentScale,
                      child: Stack(
                        children: <Widget>[
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
                            top: collected ? 55*percentScale : 0, 
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
                            top: !collected ? 55*percentScale : 0,
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
                                    value: currentCollectedFossil,
                                    onChanged: (bool value) {
                                      setState(() {
                                        collected = value;
                                        currentCollectedFossil = value;
                                        saveBool("fossilCheckList"+name, false, collected);
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
                Center(
                  child: Container(
                    transform: Matrix4.translationValues(0, 50*percentScale, 0),
                    height: 340*percentScale,
                    child: Column(
                      children: [
                        SizedBox(
                          height:30*percentScale,
                        ),
                        Container(
                          width: 250*percentScale,
                          child: new Text(capitalize(name),
                            textAlign: TextAlign.center,
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
                        infoContainer(percentScale, 'coin.png', bellsPrice.format(int.parse(sell))+" bells")
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

