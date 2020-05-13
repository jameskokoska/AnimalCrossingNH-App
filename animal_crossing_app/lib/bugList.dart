import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'bugPopup.dart';
import 'popupFunctions.dart';

import 'dart:async';
import 'dart:convert';

class BugList extends StatefulWidget {
  BugList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BugListPageState createState() => _BugListPageState();
}

String searchBug = '';

class BugData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String weather;
  final String totalCatchesToUnlock;
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
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final String catchphrase;
  final String museum;
  final bool caught;

  BugData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.weather,this.totalCatchesToUnlock,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.color1,this.color2,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);
  
}


class _BugListPageState extends State<BugList>{

  Future<List<BugData>> getBugData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/bug.json");

    final jsonData = json.decode(data);
    bool caught = false;
    List<BugData> bugData = [];
    for(var u in jsonData){
      getStoredBool("bugCheckList"+u["Name"], false).then((indexResult){
        caught = indexResult;
        BugData bugDatum = BugData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Weather"],u["Total Catches to Unlock"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
        if(search == ''){
          bugData.add(bugDatum);
        } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
          bugData.add(bugDatum);
        } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
          bugData.add(bugDatum);
        }
      });
    }
    return bugData;
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
              future: getBugData(searchBug),
              builder: (context,snapshot){
                Widget bugListSliver;
                if(snapshot.hasData){
                  bugListSliver = SliverPadding(
                    padding: EdgeInsets.only(top:0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return bugContainer(percentScale, index, snapshot.data[index].caught, snapshot.data[index].name,snapshot.data[index].iconImage,snapshot.data[index].sell,snapshot.data[index].whereHow,snapshot.data[index].weather,snapshot.data[index].nhJan,snapshot.data[index].nhFeb,snapshot.data[index].nhMar,snapshot.data[index].nhApr,snapshot.data[index].nhMay,snapshot.data[index].nhJun,snapshot.data[index].nhJul,snapshot.data[index].nhAug,snapshot.data[index].nhSep,snapshot.data[index].nhOct,snapshot.data[index].nhNov,snapshot.data[index].nhDec,snapshot.data[index].shJan,snapshot.data[index].shFeb,snapshot.data[index].shMar,snapshot.data[index].shApr,snapshot.data[index].shMay,snapshot.data[index].shJun,snapshot.data[index].shJul,snapshot.data[index].shAug,snapshot.data[index].shSep,snapshot.data[index].shOct,snapshot.data[index].shNov,snapshot.data[index].shDec,snapshot.data[index].catchphrase);
                        }, 
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  bugListSliver = SliverToBoxAdapter(
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

                double top = 0;

                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: Color(0xFFa5d6a7),
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 10,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          print(top);
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,10*percentScale-(top/6.8)*percentScale,0),
                              child: Text("Bugs",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: colorTextWhite,
                                  fontSize: 30*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                              ),
                            ),
                            titlePadding: EdgeInsets.only(left: 30*percentScale, bottom: 20),
                            background: Stack(
                              children: <Widget>[
                                //Image.asset('assets/bugTitle.png'),
                                  Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom:20,right:10),
                                    child: Container(
                                      height: 35*percentScale,
                                      width: 300*percentScale,
                                      child: Opacity(
                                        opacity: (){
                                          print(top);
                                          if(top<280&&top>190){
                                            return 1-((280-top)/90);
                                          } else {
                                            return 0.0;
                                          }
                                        }(),
                                        child: CupertinoTextField(
                                          onTap: (){
                                            searchBug='';
                                          },
                                          maxLength: 15,
                                          placeholder: (){
                                            if (searchBug==''){
                                              return 'Search';
                                            } else {
                                              return searchBug;
                                            }
                                          }(),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: Color(0x75F0F1F5),
                                          ),
                                          prefix: Padding(
                                            padding:
                                                const EdgeInsets.only(right:13, left:7),
                                            child: Icon(
                                              Icons.search,
                                              color: Color(0xADFFFFFF),
                                            ),
                                          ),
                                          onChanged: (string){
                                            setState(() {
                                              searchBug = string;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                      
                    ),
                    //Add the sliverlist parsed in future function above
                    bugListSliver,
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


Widget bugContainer(double percentScale, int index, bool caught,String name,String iconImage,String sell,String whereHow,String weather,String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec,String catchphrase){
  return Center(
    child: new StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) { 
        return Visibility(
          visible: (){
            if(!showListOnlyActive)
              return true;
            else if(determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)=='NA'&&searchBug=="")
              return false;
            else
              return true;
          }(),
          child: Container(
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
                              saveBool("bugCheckList"+name, false, caught);
                            });
                          },
                          onTap: (){
                            currentCaughtBug = caught;
                            FocusScope.of(context).requestFocus(new FocusNode());
                            Future<void> future = showModalBottomSheet(
                              //by setting this to true, we can avoid the half screen limit
                              isScrollControlled:true,
                              context: context, 
                              builder: (context){
                                return Container(
                                  height: 400*percentScale,
                                    child: Container(
                                      child: bugPopUp(percentScale, currentCaughtBug, name, iconImage, sell, whereHow, weather, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec, catchphrase),
                                  ),
                                );
                            });
                            future.then((void value)=> setState(() {
                              getStoredBool("bugCheckList"+name, false).then((indexResult){
                                  caught = indexResult;
                              });
                            }));
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
                  
                  IgnorePointer(
                    child: Stack(
                      children: <Widget>[
                        new Container(
                          transform: Matrix4.translationValues(12*percentScale,10*percentScale,0),
                          width: 55*percentScale,
                          height: 55*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorBugAccent,
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
                            errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 45*percentScale,height:45*percentScale),
                            height:45*percentScale,
                            width:45*percentScale,
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
                            color: colorBugTextDarkGreen,
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
                            color: colorBugTextDarkGreen,
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
                      ],
                    ),
                  ),
                  
                  Container(
                    transform: Matrix4.translationValues((272)*percentScale,(8.5)*percentScale,0),
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
                                  saveBool("bugCheckList"+name, false, caught);
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
          ),
      );
    }),
  );
}