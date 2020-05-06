import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fishPopup.dart';

import 'dart:async';
import 'dart:convert';

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
                          return fishContainer(percentScale, index, check, snapshot.data[index].name,snapshot.data[index].iconImage,snapshot.data[index].sell,snapshot.data[index].whereHow,snapshot.data[index].shadow,snapshot.data[index].nhJan,snapshot.data[index].nhFeb,snapshot.data[index].nhMar,snapshot.data[index].nhApr,snapshot.data[index].nhMay,snapshot.data[index].nhJun,snapshot.data[index].nhJul,snapshot.data[index].nhAug,snapshot.data[index].nhSep,snapshot.data[index].nhOct,snapshot.data[index].nhNov,snapshot.data[index].nhDec,snapshot.data[index].shJan,snapshot.data[index].shFeb,snapshot.data[index].shMar,snapshot.data[index].shApr,snapshot.data[index].shMay,snapshot.data[index].shJun,snapshot.data[index].shJul,snapshot.data[index].shAug,snapshot.data[index].shSep,snapshot.data[index].shOct,snapshot.data[index].shNov,snapshot.data[index].shDec);
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


Widget fishContainer(double percentScale, int index, bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
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
                      tappedFishItem(context, percentScale, caught, name, iconImage, sell, whereHow, shadow, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec);
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


void tappedFishItem(BuildContext context, double percentScale, bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  showModalBottomSheet(
    context: context, 
    builder: (context){
      return Container(
        height: 350*percentScale,
          child: Container(
            child: fishPopUp(percentScale, caught, name, iconImage, sell, whereHow, shadow, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec),
        ),
      );
  });
}

