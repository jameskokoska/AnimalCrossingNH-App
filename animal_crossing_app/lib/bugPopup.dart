import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gridList.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCaughtBug = false;


Widget bugPopUp(double percentScale,bool caught, var snapshot, [bool gridView = false]){
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
                  height:340*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: colorWhite,
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
                          imageUrl: snapshot.iconImage,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color:colorBugAccent,
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
                circleContainer(percentScale, Color(0xffB9F4FB), colorCircleContainerPopUp, snapshot.whereHow, true),
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
                            opacity: !caught ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Caught!",
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
                                    checkColor: colorWhite,
                                    value: (){
                                      if(gridView)
                                        return popupCollectedGrid;
                                      else
                                        return currentCaughtBug;
                                    }(),
                                    onChanged: (bool value) {
                                      setState(() {
                                        caught = value;
                                        currentCaughtBug = value;
                                        if(gridView)
                                          popupCollectedGrid = !popupCollectedGrid;
                                        saveBool("bugCheckList"+snapshot.name, false, caught);
                                        if (caught)
                                          saveInt("totalCollectedBugs", 0, totalCollectedBugs++);
                                        else
                                          saveInt("totalCollectedBugs", 0, totalCollectedBugs--);
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
                            child: quoteContainer(percentScale, colorBugTextDarkGreen, "“"+snapshot.catchphrase+"”"),
                          ),
                          SizedBox(
                            height:10*percentScale,
                          ),
                          // ---------- Card Centre Name ----------
                          Container(
                            child: new Text(capitalize(snapshot.name),
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
                            height:20*percentScale,
                          ),
                          infoContainer(percentScale, 'bellBag.png', bellsPrice.format(int.parse(snapshot.sell))+" bells"),
                          infoContainerDoubleLined(percentScale, 'magnifyingGlass.png', snapshot.whereHow),
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
