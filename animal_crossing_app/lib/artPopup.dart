import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCollectedArt = false;


Widget artPopUp(double percentScale,bool collected,String name,String imageLink,String genuine,String category,String buy,String sell,String color1, String color2,String size,String realArtworkTitle,String artist,String museumDescription,String source,String version, String hhaConcept1,String hhaConcept2,String hhaSeries,String hhaSet,String interact,String tag,String speakerType,String lightingType,String catalog,String filename,String internalID,String uniqueEntryID,String identification){
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
                        height:300*percentScale,
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
                                imageUrl: imageLink,
                                //placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => new Icon(Icons.error),
                                fadeInDuration: Duration(milliseconds:800),
                              ),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(100*percentScale),
                            color:colorArtAccent,
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
                    circleContainer(percentScale, colorBugAccent, colorCircleContainerPopUp, "Treasure Trawler"),
                    // ---------- Card Collected ----------
                    new Container(
                      transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                      // ---------- Card Body favorite Image ----------
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
                                opacity: collected ? 0 : 1,
                                child: Center(
                                  child: Container(
                                    transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                    child: Text("Missing",
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
                                opacity: !collected ? 0 : 1,
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
                                      color: colorCheckRed,
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
                                        checkColor: colorWhite,
                                        value: currentCollectedArt,
                                        onChanged: (bool value) {
                                          setState(() {
                                            collected = value;
                                            currentCollectedArt = value;
                                            saveBool("artCheckList"+name+genuine, false, collected);
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
                            // ---------- Card Centre Quote ----------
                            AnimatedOpacity(
                              duration: Duration(milliseconds:200),
                              opacity: collected||showCatchPhraseNow ? 1 : 0,
                              child: quoteContainer(percentScale, colorTextBlack, artist),
                            ),
                            SizedBox(
                              height:10*percentScale,
                            ),
                            Container(
                              child: new Text(capitalize(name),
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
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                  infoContainer(percentScale, 'bellBag.png', priceFormat.format(int.parse(buy))+" bells"),
                                  SizedBox(width: 20*percentScale,),
                                  infoContainer(percentScale, 'coin.png', priceFormat.format(int.parse(sell))+" bells"),
                                ]
                              )
                            ),
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                  infoContainerHHA(percentScale, 'house.png', capitalize(hhaSeries), capitalize(hhaConcept1), capitalize(hhaConcept2)),
                                  SizedBox(width: 20*percentScale,),
                                  infoContainer(percentScale, 'tag.png', tag)
                                ]
                              )
                            ),
                            SizedBox(height: 10*percentScale),
                            Center(
                                child: infoContainerDoubleLined(percentScale, 'magnifyingGlass.png', identification, true)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
        );
      }
  );
}

