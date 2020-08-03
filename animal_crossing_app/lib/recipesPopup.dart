import 'package:animal_crossing_app/databases.dart';
import 'package:animal_crossing_app/gridList.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'popupFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';




Widget recipesPopUp(double percentScale, Color colorTextBlack, var snapshotData){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return FutureBuilder(
        future: getRecipeData(snapshotData.name),
        builder: (context,snapshot){
          if(snapshot.hasData){
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
                          transform: Matrix4.translationValues(0, -90*percentScale, 0),
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
                            color:colorFurnitureAccent,
                            boxShadow: [BoxShadow(
                              color: colorShadowPopUp,
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                            )],
                          )
                        ),
                      ),
                      
                      circleContainer(percentScale, colorFurnitureAccent, colorCircleContainerPopUp, snapshotData.source),
                      new Container(
                        transform: Matrix4.translationValues(290*percentScale, -15*percentScale, 0),
                        child: Container(
                          width: 55*percentScale,
                          height: 55*percentScale,
                            child: Stack(
                              children: <Widget>[
                                AnimatedOpacity(
                                  duration: Duration(milliseconds:200),
                                  opacity: popupCollectedGrid ? 0 : 1,
                                  child: Center(
                                    child: Container(
                                      transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                      child: Text("Uncrafted",
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
                                      child: Text("Crafted!",
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
                                              saveBool(getKey(snapshotData, "Recipes"), false, popupCollectedGrid);
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
                                child: new Text(capitalize(snapshot.data.name),
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
                              FutureBuilder(
                                future: getOtherData(snapshot.data.material1),
                                builder: (context,snapshotOther){
                                  if(snapshotOther.hasData){
                                    return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number1 + " " + snapshot.data.material1, true);
                                  } else {
                                    return infoContainer(percentScale, 'leaf.png', snapshot.data.number1 + " " + snapshot.data.material1);
                                  }
                                }
                              ),
                              (){
                                if(snapshot.data.number2 != null && snapshot.data.number2 != "")
                                  return FutureBuilder(
                                    future: getOtherData(snapshot.data.material2),
                                    builder: (context,snapshotOther){
                                      if(snapshotOther.hasData){
                                        return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number2 + " " + snapshot.data.material2, true);
                                      } else {
                                        return infoContainer(percentScale, 'leaf.png', snapshot.data.number2 + " " + snapshot.data.material2);
                                      }
                                    }
                                  );
                                else
                                  return Container();
                              }(),
                              (){
                                if(snapshot.data.number3 != null && snapshot.data.number3 != "")
                                  return FutureBuilder(
                                    future: getOtherData(snapshot.data.material3),
                                    builder: (context,snapshotOther){
                                      if(snapshotOther.hasData){
                                        return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number3 + " " + snapshot.data.material3, true);
                                      } else {
                                        return infoContainer(percentScale, 'leaf.png', snapshot.data.number3 + " " + snapshot.data.material3);
                                      }
                                    }
                                  );
                                else
                                  return Container();
                              }(),
                              (){
                                if(snapshot.data.number4 != null && snapshot.data.number4 != "")
                                  return FutureBuilder(
                                    future: getOtherData(snapshot.data.material4),
                                    builder: (context,snapshotOther){
                                      if(snapshotOther.hasData){
                                        return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number4 + " " + snapshot.data.material4, true);
                                      } else {
                                        return infoContainer(percentScale, 'leaf.png', snapshot.data.number4 + " " + snapshot.data.material4);
                                      }
                                    }
                                  );
                                else
                                  return Container();
                              }(),
                              (){
                                if(snapshot.data.number5 != null && snapshot.data.number5 != "")
                                  return FutureBuilder(
                                    future: getOtherData(snapshot.data.material5),
                                    builder: (context,snapshotOther){
                                      if(snapshotOther.hasData){
                                        return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number5 + " " + snapshot.data.material5, true);
                                      } else {
                                        return infoContainer(percentScale, 'leaf.png', snapshot.data.number5 + " " + snapshot.data.material5);
                                      }
                                    }
                                  );
                                else
                                  return Container();
                              }(),
                              (){
                                if(snapshot.data.number6 != null && snapshot.data.number6 != "")
                                  return FutureBuilder(
                                    future: getOtherData(snapshot.data.material6),
                                    builder: (context,snapshotOther){
                                      if(snapshotOther.hasData){
                                        return infoContainer(percentScale, snapshotOther.data.image, snapshot.data.number6 + " " + snapshot.data.material6, true);
                                      } else {
                                        return infoContainer(percentScale, 'leaf.png', snapshot.data.number6 + " " + snapshot.data.material6);
                                      }
                                    }
                                  );
                                else
                                  return Container();
                              }(),
                              (){
                                if(snapshot.data.sources!=null)
                                  return infoContainerDoubleLined(percentScale, 'magnifyingGlass.png', snapshot.data.sources);
                                else
                                  return Container();
                              }()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            );
          } else {
            return Container();
          }
        }
      );
    }
  );
} 

Future<String> determineMaterialImage(String materialName) async{
  var getOther = await getOtherData(materialName);
  return getOther.name;
}