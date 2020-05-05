import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fish.dart';

import 'dart:async';
import 'dart:convert';

class Music {
  final int id;
  final bool collected;

  Music({this.id, this.collected});
}


class FishList extends StatefulWidget {
  FishList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FishListPageState createState() => _FishListPageState();
}


class FishData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String shadow;
  final String totalCatchesToUnlock;
  final String rarity;
  final String rainSnow;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String color1;
  final String color2;
  final String size;
  final String lightingType;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;

  FishData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.shadow,this.totalCatchesToUnlock,this.rarity, this.rainSnow,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.color1,this.color2,this.size,this.lightingType,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId);
  
}

class _FishListPageState extends State<FishList>{

  Future<List<FishData>> getFishData() async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/fish.json");;

    final jsonData = json.decode(data);

    List<FishData> fishData = [];

    for(var u in jsonData){
      FishData fishDatum = FishData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Shadow"],u["Total Catches to Unlock"],u["Rarity"],u["Rain/Snow Catch Up"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Size"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"]);
      fishData.add(fishDatum);
    }

    return fishData;
  }


  @override
  Widget build(BuildContext context){
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    double deviceWidth = MediaQuery.of(context).size.width;
    double designedWidth = 360;

    double deviceHeight = MediaQuery.of(context).size.height;
    double designedHeight = 640;

    double percentWidth = deviceWidth/designedWidth;
    double percentHeight = deviceHeight/designedHeight;

    double percentScale;

    if(percentWidth < percentHeight){
      percentScale = percentWidth;
    } else {
      percentScale = percentHeight;
    }



    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: darkModeColor(darkMode, Color(0xFFDEFEFF), Color(0xFF193D69)),
          ),
          FutureBuilder(
            future:getFishData(),
            builder: (context,snapshot){
              Widget fishListSliver;
              if(snapshot.hasData){
                fishListSliver = SliverPadding(
                  padding: EdgeInsets.only(top:10*percentScale),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return fishContainer(percentScale, index, snapshot.data[index].name, snapshot.data[index].iconImage, snapshot.data[index].whereHow, snapshot.data[index].nhJan);
                      },
                      childCount: snapshot.data.length,
                    ),
                  ),
                );
              } else {
                fishListSliver = SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height:100*percentScale,
                      ),
                      SpinKitThreeBounce(
                        color: darkModeColor(darkMode, Color(0xFF2DA6F7), Color(0xFF8BBADA)),
                        size:80,
                      )
                    ],
                  )
                );
              }

              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 197*percentScale,
                      backgroundColor: Color(0xFF00A1FF),
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 10,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Container(
                          transform: Matrix4.translationValues(0,-13*percentScale,0),
                          child: Text("Fish",
                            style: TextStyle(
                              fontFamily: 'ArialRoundedBold',
                              color: Color(0xffffffff),
                              fontSize: 30*percentScale,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                        titlePadding: EdgeInsetsDirectional.only(start: 25*percentScale),
                        background: Image.asset('assets/fishTitle.png'),
                      ),
                    ),
                  //Add the sliverlist parsed in future function above
                  fishListSliver,
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child:Container(
                      height:100,
                    )
                  ),
                ],
              );
            }
          ),
        ],
      )
    );
  }
}


Widget fishContainer(double percentScale, int index, String name, String iconImage, String whereHow, String nhJan){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { return Column(
      children: <Widget>[
        SizedBox(
          height:8*percentScale,
        ),
        new Stack(
          children: <Widget>[
            
            ClipRRect(
              borderRadius: BorderRadius.circular(8*percentScale),
              child: new Container(
                child: new Material(
                  child: new InkWell(
                    highlightColor: Color(0xFF98D5DB),
                    splashColor: Color(0xFF90DAE0),
                    enableFeedback: true,
                    onLongPress: (){
                      setState(() {
                        check = !check;
                      });
                    },
                    onTap: (){
                      //print(index);
                      tappedFishItem(context, percentScale, index);
                    },
                    child: new Container(
                      width: 334*percentScale,
                      height: 71*percentScale,
                    ),
                  ),
                  color: Color(0xffb9f4fb),
                ),
                
              ),
            ),
            // 
            // new Container(
            //     width: 334*percentScale,
            //     height: 71*percentScale,
            //     decoration: new BoxDecoration(
            //       color: Color(0xffb9f4fb),
            //       borderRadius: BorderRadius.circular(8)
            //     )
            //   ),
            //
            //
            IgnorePointer(
              child: Stack(
                children: <Widget>[
                  new Container(
                    transform: Matrix4.translationValues(8*percentScale,8*percentScale,0),
                    width: 55*percentScale,
                    height: 55*percentScale,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff9edcf4)
                    )
                  ),
                  Container(
                    transform: Matrix4.translationValues((8+5)*percentScale,(8+5)*percentScale,0),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        width: 45*percentScale,
                        height: 45*percentScale,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4*percentScale),
                          image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      imageUrl: iconImage,
                      //placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                      fadeInDuration: Duration(milliseconds:800),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues((79)*percentScale,(6)*percentScale,0),
                    child: new Text((capitalize(name)),
                      style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: Color(0xff373737),
                      fontSize: 19*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues((79)*percentScale,(29)*percentScale,0),
                    child: new Text(nhJan,
                      style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: Color(0xff625dde),
                      fontSize: 14*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues((79)*percentScale,(46)*percentScale,0),
                    child: new Text(whereHow,
                      style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: Color(0xff625dde),
                      fontSize: 14*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                  //Checkmark background
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    top: check ? 55*percentScale : 0,
                    bottom: check ? 55*percentScale : 0,
                    child: new Container(
                      transform: Matrix4.translationValues((271)*percentScale,(8)*percentScale,0),
                      width: 55*percentScale,
                      height: 55*percentScale,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF9E4E4)
                      )
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    top: !check ? 55*percentScale : 0,
                    bottom: !check ? 55*percentScale : 0,
                    child: new Container(
                      transform: Matrix4.translationValues((271)*percentScale,(8)*percentScale,0),
                      width: 55*percentScale,
                      height: 55*percentScale,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF99F9A9)
                      )
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              transform: Matrix4.translationValues((271)*percentScale,(8)*percentScale,0),
              width:55*percentScale,
              height:55*percentScale,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300*percentScale),
                  child: new Transform.scale(
                    scale: 2.5*percentScale,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: Color(0x00F9E4E4)),
                      child: new Checkbox(
                        activeColor: Color(0x0499F9A9),
                        checkColor: Color(0xFF444444),
                        value: check,
                        onChanged: (bool value) {
                          setState(() {
                            check = value;
                            HapticFeedback.mediumImpact();
                          });
                        },
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ],
    );
  });
}

bool check = false;


void tappedFishItem(BuildContext context, double percentScale, int index){
  showModalBottomSheet(
    context: context, 
    builder: (context){
      return Container(
        height: 350*percentScale,
          child: Container(
            child: fishPopUp(percentScale, index),
        ),
      );
  });
}

Widget fishPopUp(double percentScale,int index){
  return Scaffold(
    body:
      Column(
        children: [
          // ---------- Card Stack ----------
          
          Stack(
            children: [
              // ---------- Cheaty Background and curved card ----------
              Container(
                transform: Matrix4.translationValues(0, -30*percentScale, 0),
                height:400,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30*percentScale),
                    color: Color(0xFFFFFFFF),
                )
              ),
              Container(
                transform: Matrix4.translationValues(0, 0, 0),
                height:400,
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
                    child: new Image.asset(
                      'assets/fish.png',
                      height: 80*percentScale,
                      width: 80*percentScale,
                    )
                  ),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(100*percentScale),
                    color: Color(0xffdefeff),
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
                transform: Matrix4.translationValues(10*percentScale, -20*percentScale, 0),
                width: 60*percentScale,
                height: 60*percentScale,
                // ---------- Card Location Image ----------
                child: new Center(
                  child: new Image.asset(
                    'assets/fish.png',
                    height: 50*percentScale,
                    width: 50*percentScale,
                  )
                ),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(100*percentScale),
                  color: Color(0xffb9f4fb)
                )
              ),
              // ---------- Card Caught ----------
              new Container(
                transform: Matrix4.translationValues(290*percentScale, -20*percentScale, 0),
                width: 60*percentScale,
                height: 60*percentScale,
                  // ---------- Card Body Caught Image ----------
                  child: new Center(
                    child: new Image.asset(
                      'assets/fish.png',
                      height: 50*percentScale,
                      width: 50*percentScale,
                    )
                  ),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(100*percentScale),
                  color: Color(0xff99f9a9)
                )
              ),
              // ---------- Card Centre Content ----------
              new Center(
                child: Column(
                  children: [
                    // ---------- Card Centre Quote ----------
                    Container(
                      transform: Matrix4.translationValues(0, 50*percentScale, 0),
                      child: Text("“I caught a red snapper! \u000bIt looks pretty dapper!”",
                        style: TextStyle(
                          fontFamily: 'Baskerville',
                          color: Color(0xff625dde),
                          fontSize: 14*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        )
                      ),
                    ),
                    // ---------- Card Centre Name ----------
                    Container(
                      transform: Matrix4.translationValues(0, 70*percentScale, 0),
                      child: new Text("Red Snapper" + index.toString(),
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: Color(0xff373737),
                          fontSize: 31*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                    // ---------- Card Centre Sell Price ----------
                    Container(
                      transform: Matrix4.translationValues(0, 90*percentScale, 0),
                      child: Stack(
                        children: [
                          // ---------- Card Centre Sell Price Image ----------
                          Container(
                            transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                            child: new Image.asset(
                              'assets/fish.png',
                              height: 30*percentScale,
                              width: 30*percentScale,
                            ),
                          ),
                          // ---------- Card Centre Sell Price Text ----------
                          Container(
                            child: new Text("5,000 bells",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: Color(0xff3a3a3a),
                                  fontSize: 19*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                          )
                        ]
                      )
                    ),
                    // ---------- Card Centre Size ----------
                    Container(
                        transform: Matrix4.translationValues(0, 90*percentScale, 0),
                        child: Stack(
                            children: [
                              // ---------- Card Centre Size Image ----------
                              Container(
                                transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                                child: new Image.asset(
                                  'assets/fish.png',
                                  height: 30*percentScale,
                                  width: 30*percentScale,
                                ),
                              ),
                              // ---------- Card Centre Size Text ----------
                              Container(
                                child: new Text("Large",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              )
                            ]
                        )
                    ),
                    // ---------- Card Centre Rarity ----------
                    Container(
                        transform: Matrix4.translationValues(0, 90*percentScale, 0),
                        child: Stack(
                            children: [
                              // ---------- Card Centre Rarity Image ----------
                              Container(
                                transform: Matrix4.translationValues(-40*percentScale, -4*percentScale, 0),
                                child: new Image.asset(
                                  'assets/fish.png',
                                  height: 30*percentScale,
                                  width: 30*percentScale,
                                ),
                              ),
                              // ---------- Card Centre Rarity Text ----------
                              Container(
                                child: new Text("Rare",
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 19*percentScale,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              )
                            ]
                        )
                    )
                  ],
                )
              )
            ],
          ),
        ],
      )
    );
  } 
