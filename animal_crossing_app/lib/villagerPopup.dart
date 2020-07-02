import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'popupFunctions.dart';
import 'package:optimized_cached_image/widgets.dart';
import 'gridList.dart';


final bellsPrice = new NumberFormat("#,##0");


Widget villagerPopUp(double percentScale, Color colorTextBlack, snapshotData){
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
                  height:440*percentScale,
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
                          imageUrl: snapshotData.image,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100*percentScale),
                      color:colorVillagerAccent,
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
                  // ---------- Card Body favorite Image ----------
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
                                child: Text("Favorite",
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
                                color: Color(0x347CFFF8)
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
                                color: colorVillagerCheck,
                              )
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0,(1)*percentScale,0),
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: popupCollectedGrid ? 30*percentScale : 0,
                                height: popupCollectedGrid ? 30*percentScale : 0,
                                child: Image.asset(
                                    'assets/heart.png',
                                ),
                              ),
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
                                    checkColor: Color(0x00FFFFFF),
                                    value: popupCollectedGrid,
                                    onChanged: (bool value) {
                                      setState(() {
                                        popupCollectedGrid = value;
                                        saveBool(getKey(snapshotData, "Villagers"), false, popupCollectedGrid);
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
                    transform: Matrix4.translationValues(0, 40*percentScale, 0),
                    height: 340*percentScale,
                    width: 360*percentScale,
                    child: Column(
                      children: [
                        Container(
                          child: new Text(capitalize(snapshotData.name),
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
                        quoteContainer(percentScale, colorTextBlack, getGenderString(snapshotData.gender) + " - “"+snapshotData.catchphrase+"”"),
                        SizedBox(
                          height:30*percentScale,
                        ),

                        //birthday
                        infoContainer(percentScale, 'birthdayCake.png', snapshotData.birthday),
                        //species
                        infoContainer(percentScale, 'cat.png',snapshotData.species),
                        //personaility
                        infoContainer(percentScale, 'personailityEmoji.png', snapshotData.personality),
                        //style
                        Container(
                          child: (){
                            String style;
                            if (snapshotData.style1 == snapshotData.style2){
                              style = snapshotData.style1;
                            } else {
                              style = snapshotData.style1 + ", " + snapshotData.style2;
                            }
                            return infoContainer(percentScale, 'styleEmoji.png', style);
                          }()
                        ),
                        //colours
                        infoContainer(percentScale, 'colorPalette.png',snapshotData.color1 + ", " +snapshotData. color2),
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


String getGenderString(String gender){
  if(gender.toLowerCase()=="male"){
    return "he/him";
  } else if (gender.toLowerCase()=="female"){
    return "she/her";
  } else {
    return "no assumption";
  }
}

