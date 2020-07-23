import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gridList.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;


final bellsPrice = new NumberFormat("#,##0");
bool currentCaughtSea = false;


Widget seaPopUp(double percentScale,bool caught, var snapshot, [bool gridView=false]){
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
                  transform: Matrix4.translationValues(0, 200*percentScale, 0),
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
                      color:colorSeaAccent,
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
                circleContainer(percentScale, Color(0xffB9F4FB), colorCircleContainerPopUp, "Ocean"),
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
                                        return currentCaughtSea;
                                    }(),
                                    onChanged: (bool value) {
                                      setState(() {
                                        caught = value;
                                        currentCaughtSea = value;
                                        if(gridView)
                                          popupCollectedGrid = !popupCollectedGrid;
                                        saveBool("seaCheckList"+snapshot.name, false, caught);
                                        if (caught)
                                          saveInt("totalCollectedSea", 0, totalCollectedSea++);
                                        else
                                          saveInt("totalCollectedSea", 0, totalCollectedSea--);
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
                    height: 480*percentScale,
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
                          //child: quoteContainer(percentScale, colorFishTextDarkBlue, "“"+"”"),
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
                        infoContainerDoubleLined(percentScale, 'magnifyingGlass.png', snapshot.shadow),
                        infoContainerDoubleLined(percentScale, 'speed.png', snapshot.movementSpeed),
                        IntrinsicWidth(
                          child: Row(
                            children: <Widget>[
                              // ---------- Clock ----------
                              Container(
                                height: 180*percentScale,
                                width: 180*percentScale,
                                child: Stack(
                                  children: <Widget>[
                                    // ---------- Availability Indicator Bar ----------
                                    Center(
                                      child: new RotationTransition(
                                        turns: new AlwaysStoppedAnimation((timeToAngle(determineActiveTimeStart(determineTime(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec))) + 180) / 360),
                                        child: new CircularPercentIndicator(
                                          radius: 160.0*percentScale,
                                          lineWidth: 15.0*percentScale,
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          percent: timeToAngle(activeDuration(determineActiveTimeStart(determineTime(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec)), determineActiveTimeEnd(determineTime(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec)))) / 360,
                                          progressColor: Colors.green,
                                        ),
                                      ),
                                    ),
                                    // ---------- Clock Body ----------
                                    Center(
                                      child: new Image.asset(
                                        "assets/clock.png",
                                        height: 150*percentScale,
                                        width: 150*percentScale,
                                      ),
                                    ),
                                    // ---------- Time Indicator Dot ----------
                                    Center(
                                      child: Transform.rotate(
                                        angle: (timeToAngle(DateTime.now().hour) + 172.5) * math.pi / 180,
                                        child: new Transform (
                                          child: Container(
                                            child: new Image.asset(
                                              "assets/indicator.png",
                                              height: 10*percentScale,
                                              width: 10*percentScale,
                                            ),
                                          ),
                                          alignment: FractionalOffset.center, // set transform origin
                                          transform: new Matrix4.translationValues(0, -72, 0), // rotate -10 deg
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 0 * percentScale,),
                              // ---------- Seasons ----------
                              Container(
                                height: 180*percentScale,
                                width: 180*percentScale,
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: new Image.asset(
                                        'assets/months.png',
                                        height: 160*percentScale,
                                        width: 160*percentScale,
                                      ),
                                    ),
                                    Center(
                                      child: new Stack(
                                          children: circularMonthText(percentScale, snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec)),
                                    ),
                                    Center(
                                      child: new Stack(
                                          children: circularMonthActive(percentScale, snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
