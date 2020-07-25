import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gridList.dart';


final bellsPrice = new NumberFormat("#,##0");
bool currentCollectedClothing = false;


Widget clothingPopup(double percentScale, Color colorTextBlack, var snapshotData){

  String currencyAmount = buyPriceConverted(snapshotData.buy, snapshotData.milesPrice, snapshotData.source);
  String currencyType = buyPriceConvertedType(snapshotData.buy, snapshotData.milesPrice, snapshotData.source);
  String currencyIcon = buyPriceConvertedIcon(snapshotData.buy, snapshotData.milesPrice, snapshotData.source);

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
                      height:450*percentScale,
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
                    new Center(
                      child: new Container(
                          transform: Matrix4.translationValues(0, -80*percentScale, 0),
                          width: 113*percentScale,
                          height: 113*percentScale,
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
                            color:colorClothingAccent,
                            boxShadow: [BoxShadow(
                                color: colorShadowPopUp,
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                            )],
                          )
                      ),
                    ),

                    circleContainer(percentScale, colorClothingAccent, colorCircleContainerPopUp, snapshotData.source),
                    new Container(
                      transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                      child: Container(
                          width: 55*percentScale,
                          height: 55*percentScale,
                          child: Stack(
                            children: <Widget>[
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
                                top: popupCollectedGrid ? 55*percentScale : 0,
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
                                top: !popupCollectedGrid ? 55*percentScale : 0,
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
                                            saveBool(getKey(snapshotData, "Clothing"), false, popupCollectedGrid);
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
                              height:20*percentScale,
                            ),
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                    (){
                                      if(currencyType==""||currencyType==null)
                                        return Container();
                                      if (snapshotData.milesPrice != null) {
                                        if (snapshotData.milesPrice != "NA") {
                                          return infoContainer(percentScale, currencyIcon, currencyAmount + currencyType);
                                        } else if (currencyType != "None") {
                                          return infoContainer(percentScale, currencyIcon, currencyAmount + currencyType);
                                        }
                                      } else {
                                        //return infoContainer(percentScale, "leaf.png", "None" + "");
                                        return Container();
                                      }
                                    }(),
                                      (){
                                    if(currencyType!="None"){
                                      return SizedBox(width: 20*percentScale,);
                                    }
                                    return Container();
                                  }(),
                                  infoContainer(percentScale, 'coin.png', snapshotData.sell+" bells"),
                                ],
                              ),
                            ),
                                (){
                              if(snapshotData.color2 != snapshotData.color1){
                                return infoContainer(percentScale, 'colorPalette.png', snapshotData.color1 + ", " + snapshotData.color2);
                              } else {
                                return infoContainer(percentScale, 'colorPalette.png', snapshotData.color1);
                              }
                            }(),
                            IntrinsicWidth(
                              child: Row(
                                children: <Widget>[
                                      (){
                                    if(snapshotData.variation!="NA"){
                                      return infoContainer(percentScale, 'droplet.png', snapshotData.variation);
                                    }
                                    return Container();
                                  }(),
                                      (){
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

