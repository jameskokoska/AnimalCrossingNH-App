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
  final String catchphrase;
  final String museum;
  final bool caught;

  FishData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.shadow,this.totalCatchesToUnlock,this.rarity, this.rainSnow,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.color1,this.color2,this.size,this.lightingType,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);
  
}

class _FishListPageState extends State<FishList>{

  void callback() {
    setState(() {
    });
  }

  Future<List<FishData>> getFishData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/fish.json");

    final jsonData = json.decode(data);
    bool caught = false;
    List<FishData> fishData = [];
    for(var u in jsonData){
      getStoredBool("fishCheckList"+u["Name"], false).then((indexResult){
        caught = indexResult;
        FishData fishDatum = FishData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Shadow"],u["Total Catches to Unlock"],u["Rarity"],u["Rain/Snow Catch Up"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Size"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
        if(search == '*'){
          fishData.add(fishDatum);
        } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
          fishData.add(fishDatum);
        } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
          fishData.add(fishDatum);
        }
      });
    }
    return fishData;
  }

  String search = "*";

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
      body: GestureDetector(
        //exit keyboard when tapping anywhere else
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color(0xFF193D69)),
            ),
            
            FutureBuilder(
              future: getFishData(search),
              builder: (context,snapshot){
                Widget fishListSliver;
                if(snapshot.hasData){
                  fishListSliver = SliverPadding(
                    padding: EdgeInsets.only(top:0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return fishContainer(percentScale, index, snapshot.data[index].caught, snapshot.data[index].name,snapshot.data[index].iconImage,snapshot.data[index].sell,snapshot.data[index].whereHow,snapshot.data[index].shadow,snapshot.data[index].nhJan,snapshot.data[index].nhFeb,snapshot.data[index].nhMar,snapshot.data[index].nhApr,snapshot.data[index].nhMay,snapshot.data[index].nhJun,snapshot.data[index].nhJul,snapshot.data[index].nhAug,snapshot.data[index].nhSep,snapshot.data[index].nhOct,snapshot.data[index].nhNov,snapshot.data[index].nhDec,snapshot.data[index].shJan,snapshot.data[index].shFeb,snapshot.data[index].shMar,snapshot.data[index].shApr,snapshot.data[index].shMay,snapshot.data[index].shJun,snapshot.data[index].shJul,snapshot.data[index].shAug,snapshot.data[index].shSep,snapshot.data[index].shOct,snapshot.data[index].shNov,snapshot.data[index].shDec,snapshot.data[index].catchphrase);
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
                      expandedHeight: 219*percentScale,
                      backgroundColor: Color(0xFFA2D0F7),
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
                              color: colorTextWhite,
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
                    SliverPadding(
                      padding: EdgeInsets.only(top:10*percentScale),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Transform.scale(
                            scale: 0.7*percentScale,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey[100], width: 2.5*percentScale),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: colorWhite,
                                labelText: 'Search',
                                labelStyle: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: Colors.blueGrey[300],
                                  fontSize: 20*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              onChanged: (string){
                                setState(() {
                                  search = string;
                                });
                              },
                            ),
                          ),
                        ],),
                      ),
                    ),
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
        ),
      )
    );
  }
}


Widget fishContainer(double percentScale, int index, bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec,String catchphrase){
  return Center(
    child: new StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) { 
        return Visibility(
          visible: (){
            if(!showListOnlyActive)
              return true;
            else if(determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)=='NA')
              return false;
            else
              return true;
          }(),
          child: Column(
          children: <Widget>[
            SizedBox(
              height:4.5*percentScale,
            ),
            new Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(14*percentScale),
                  child: new Container(
                    child: new Material(
                      child: new InkWell(
                        highlightColor: Color(0xFFcfd8dc),
                        splashColor: Color(0xFFb3e5fc),
                        enableFeedback: true,
                        onLongPress: (){
                          setState(() {
                            caught = !caught;
                          });
                        },
                        onTap: (){
                          FocusScope.of(context).requestFocus(new FocusNode());
                          tappedFishItem(context, percentScale, caught, name, iconImage, sell, whereHow, shadow, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec, catchphrase);
                        },
                        child: new Container(
                          width: 334*percentScale,
                          height: 75*percentScale,
                        ),
                      ),
                      color: colorWhite,
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
                        transform: Matrix4.translationValues(12*percentScale,10*percentScale,0),
                        width: 55*percentScale,
                        height: 55*percentScale,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorFishAccent,
                        )
                      ),
                      Container(
                        transform: Matrix4.translationValues((12+5)*percentScale,(10+5)*percentScale,0),
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
                        transform: Matrix4.translationValues((80)*percentScale,(10)*percentScale,0),
                        child: new Text((capitalize(name)),
                          style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextBlack,
                          fontSize: 18*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues((80)*percentScale,(32)*percentScale,0),
                        child: new Text(determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec),
                          style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorFishTextDarkBlue,
                          fontSize: 14*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues((80)*percentScale,(49)*percentScale,0),
                        child: new Text(whereHow,
                          style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorFishTextDarkBlue,
                          fontSize: 14*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                      //Checkmark background
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 300),
                        top: caught ? 40*percentScale : 0,
                        bottom: caught ? 40*percentScale : 0,
                        child: new Container(
                          transform: Matrix4.translationValues((279)*percentScale,(8)*percentScale,0),
                          width: 40*percentScale,
                          height: 40*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorCheckRed
                          )
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        top: !caught ? 40*percentScale : 0,
                        bottom: !caught ? 40*percentScale : 0,
                        child: new Container(
                          transform: Matrix4.translationValues((279)*percentScale,(8)*percentScale,0),
                          width: 40*percentScale,
                          height: 40*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorCheckGreen
                          )
                        ),
                      ),
                      Container(
                         transform: Matrix4.translationValues((190)*percentScale,(22)*percentScale,0),
                         child: Image.asset(
                           'assets/shadow'+determineShadowImage(shadow, whereHow)+'.png',
                           height:60*percentScale,
                           width:70*percentScale,
                        ),
                      )
                    ],
                  ),
                ),
                
                Container(
                  transform: Matrix4.translationValues((272)*percentScale,(11.5)*percentScale,0),
                  width:55*percentScale,
                  height:55*percentScale,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300*percentScale),
                      child: new Transform.scale(
                        scale: 1.6*percentScale,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Color(0x00F9E4E4)),
                          child: new Checkbox(
                            activeColor: Color(0x04b2fab4),
                            checkColor: Color(0xFFFFFFFF),
                            value: caught,
                            onChanged: (bool value) {
                              setState(() {
                                caught = value;
                                saveBool("fishCheckList"+name, false, caught);
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
        ),
      );
    }),
  );
}


void tappedFishItem(BuildContext context, double percentScale, bool caught,String name,String iconImage,String sell,String whereHow,String shadow,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec, String catchphrase){
  showModalBottomSheet(
    context: context, 
    builder: (context){
      return Container(
        height: 360*percentScale,
          child: Container(
            child: fishPopUp(percentScale, caught, name, iconImage, sell, whereHow, shadow, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec, catchphrase),
        ),
      );
  });
}

String determineShadowImage(String shadowSize, String whereHow){
  if(shadowSize.contains('Fin')){
    return "LargeFin";
  }
  if(shadowSize.contains('Long')){
    return "Long";
  } else if (whereHow.contains('Ocean')||whereHow.contains('Pier')){
    return "Ocean-"+shadowSize;
  } else if (whereHow.contains('River')||whereHow.contains('Pond')){
    return "River-"+shadowSize;
  }
  return "Long";
}

String determineLocationImage(String whereHow){
  if(whereHow.contains('Ocean')||whereHow.contains('Pier')){
    return "oceanIcon";
  } else if (whereHow.contains('River')||whereHow.contains('Pond')){
    return "riverIcon";
  }
  return "riverIcon";
}

String determineTime(String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  if(northernHemisphere){
    if(currentDate.month==1){
      return nhJan;
    }else if (currentDate.month==2){
      return nhFeb;
    }else if (currentDate.month==3){
      return nhMar;
    }else if (currentDate.month==4){
      return nhApr;
    }else if (currentDate.month==5){
      return nhMay;
    }else if (currentDate.month==6){
      return nhJun;
    }else if (currentDate.month==7){
      return nhJul;
    }else if (currentDate.month==8){
      return nhAug;
    }else if (currentDate.month==9){
      return nhSep;
    }else if (currentDate.month==10){
      return nhOct;
    }else if (currentDate.month==11){
      return nhNov;
    }else{
      return nhDec;
    }
  }else{
    if(currentDate.month==1){
      return shJan;
    }else if (currentDate.month==2){
      return shFeb;
    }else if (currentDate.month==3){
      return shMar;
    }else if (currentDate.month==4){
      return shApr;
    }else if (currentDate.month==5){
      return shMay;
    }else if (currentDate.month==6){
      return shJun;
    }else if (currentDate.month==7){
      return shJul;
    }else if (currentDate.month==8){
      return shAug;
    }else if (currentDate.month==9){
      return shSep;
    }else if (currentDate.month==10){
      return shOct;
    }else if (currentDate.month==11){
      return shNov;
    }else{
      return shDec;
    }
  }
}