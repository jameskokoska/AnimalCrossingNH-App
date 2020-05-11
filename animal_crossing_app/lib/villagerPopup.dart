import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final bellsPrice = new NumberFormat("#,##0");
bool currentFavoriteVillager = false;


Widget villagerPopUp(double percentScale,bool favorite,String name,String imageLink,String species, String gender, String personality, String birthday, String catchphrase, String style1, String style2, String color1, String color2){
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
                  height:440*percentScale,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30*percentScale),
                      color: Color(0xFFFFFFFF),
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
                  // ---------- Card Body favorite Image ----------
                  child: Container(
                    width: 55*percentScale,
                    height: 55*percentScale,
                      child: Stack(
                        children: <Widget>[
                          AnimatedOpacity(
                            duration: Duration(milliseconds:300),
                            opacity: favorite ? 0 : 1,
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
                            opacity: !favorite ? 0 : 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(0,(37)*percentScale,0),
                                child: Text("Favorite",
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
                            top: favorite ? 55*percentScale : 0,     //check needs changing to be based on current state
                            bottom: favorite ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE0F2F1)
                              )
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            top: !favorite ? 55*percentScale : 0,      //check needs changing to be based on current state
                            bottom: !favorite ? 55*percentScale : 0,
                            child: new Container(
                              width: 55*percentScale,
                              height: 55*percentScale,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorVillagerAccent,
                              )
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0,(1)*percentScale,0),
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: favorite ? 30*percentScale : 0,
                                height: favorite ? 30*percentScale : 0,
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
                                    value: currentFavoriteVillager,
                                    onChanged: (bool value) {
                                      setState(() {
                                        favorite = value;
                                        currentFavoriteVillager = value;
                                        saveBool("villagerCheckList"+name, false, favorite);
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
                            child: Text(getGenderString(gender) + " - “"+catchphrase+"”",
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
                            height:30*percentScale,
                          ),

                          //birthday
                          Container(
                            height: 45*percentScale,
                            width:200*percentScale,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: new Image.asset(
                                    'assets/birthdayCake.png',
                                    height: 25*percentScale,
                                    width: 25*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 10*percentScale,
                                ),
                                Container(
                                  child: new Text(birthday,
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //species
                          Container(
                            width:200*percentScale,
                            height: 45*percentScale,
                           
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: new Image.asset(
                                    'assets/personailityEmoji.png',
                                    height: 25*percentScale,
                                    width: 25*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 10*percentScale,
                                ),
                                Container(
                                  child: new Text(personality,
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ]
                            )
                          ),
                          //species
                          Container(
                            width:200*percentScale,
                            height: 45*percentScale,
                           
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: new Image.asset(
                                    'assets/cat.png',
                                    height: 25*percentScale,
                                    width: 25*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 10*percentScale,
                                ),
                                Container(
                                  child: new Text(species,
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ]
                            )
                          ),
                          Container(
                            width:200*percentScale,
                            height: 45*percentScale,
                           
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: new Image.asset(
                                    'assets/styleEmoji.png',
                                    height: 25*percentScale,
                                    width: 25*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 10*percentScale,
                                ),
                                Container(
                                  child: new Text((){
                                      if (style1 == style2){
                                        return style1;
                                      } else {
                                        return style1 + ", " + style2;
                                      }
                                    }(),
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ]
                            )
                          ),
                          //Colours
                          Container(
                            height: 45*percentScale,
                            width:200*percentScale,
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: new Image.asset(
                                    'assets/colorPalette.png',
                                    height: 25*percentScale,
                                    width: 25*percentScale,
                                  ),
                                ),
                                SizedBox(
                                  width: 13*percentScale,
                                ),
                                Container(
                                  child: new Text(color1 + ", " + color2,
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
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


String getGenderString(String gender){
  if(gender.toLowerCase()=="male"){
    return "he/him";
  } else if (gender.toLowerCase()=="female"){
    return "she/her";
  } else {
    return "no assumption";
  }
}
