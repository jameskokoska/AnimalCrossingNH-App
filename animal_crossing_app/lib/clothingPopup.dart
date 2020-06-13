import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:optimized_cached_image/widgets.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCollectedClothing = false;


Widget clothingPopUp(double percentScale, Color colorTextBlack, String name, String image, String source, bool collected, String buy, String milesPrice, String sell, String color1, String color2, String hhaConcept1, String hhaConcept2, String hhaSeries, String tag, String variation, String pattern, String kitCost){

  String currencyAmount = buyPriceConverted(buy, milesPrice, source);
  String currencyType = buyPriceConvertedType(buy, milesPrice, source);
  String currencyIcon = buyPriceConvertedIcon(buy, milesPrice, source);

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
                        height:500*percentScale,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(30*percentScale),
                          color: colorWhite,
                        )
                    ),
                    new Center(
                      child: new Container(
                          transform: Matrix4.translationValues(0, -90*percentScale, 0),
                          width: 113*percentScale,
                          height: 113*percentScale,
                          child: new Center(
                            child: new Center(
                              child:  OptimizedCacheImage(
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
                    circleContainer(percentScale, Color(0xffB9F4FB), colorCircleContainerPopUp, source),
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
                                        checkColor: colorWhite,
                                        value: currentCollectedClothing,
                                        onChanged: (bool value) {
                                          setState(() {
                                            collected = value;
                                            currentCollectedClothing = value;
                                            saveBool("clothingCheckList"+name+variation, false, currentCollectedClothing);
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
                        height: 440*percentScale,
                        child: Column(
                          children: [
                            SizedBox(
                              height:20*percentScale,
                            ),
                            Container(
                              width: 250*percentScale,
                              child: new Text(capitalize(name),
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
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                      (){
                                    if(milesPrice!="NA"){
                                      return infoContainer(percentScale, currencyIcon, bellsPrice.format(int.parse(currencyAmount))+currencyType);
                                    } else if(currencyType!="None") {
                                      return infoContainer(percentScale, currencyIcon, bellsPrice.format(int.parse(currencyAmount))+currencyType);
                                    }
                                    return Container();
                                  }(),
                                      (){
                                    if(currencyType!="None"){
                                      return SizedBox(width: 20*percentScale,);
                                    }
                                    return Container();
                                  }(),
                                  infoContainer(percentScale, 'coin.png', bellsPrice.format(int.parse(sell))+" bells"),
                                ],
                              ),
                            ),
                                (){
                              if(color2 != color1){
                                return infoContainer(percentScale, 'colorPalette.png', color1 + ", " + color2);
                              } else {
                                return infoContainer(percentScale, 'colorPalette.png', color1);
                              }
                            }(),
                            infoContainerHHA(percentScale, 'house.png', capitalize(hhaSeries), capitalize(hhaConcept1), capitalize(hhaConcept2)),
                            infoContainer(percentScale, 'tag.png', tag),
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                      (){
                                    if(variation!="NA"){
                                      return infoContainer(percentScale, 'droplet.png', variation);
                                    }
                                    return Container();
                                  }(),
                                      (){
                                    if(pattern!="NA"){
                                      return SizedBox(width: 20*percentScale,);
                                    }
                                    return Container();
                                  }(),
                                      (){
                                    if(pattern!="NA"){
                                      return infoContainer(percentScale, 'pattern.png', pattern);
                                    }
                                    return Container();
                                  }(),
                                      (){
                                    if(kitCost!="NA"){
                                      return SizedBox(width: 20*percentScale,);
                                    }
                                    return Container();
                                  }(),
                                      (){
                                    if(kitCost!="NA"){
                                      return infoContainer(percentScale, 'tag.png', kitCost);
                                    }
                                    return Container();
                                  }(),
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

