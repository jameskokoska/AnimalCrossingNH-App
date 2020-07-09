import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fishPopup.dart';
import 'popupFunctions.dart';
import 'databases.dart';

class FishList extends StatefulWidget {
  FishList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FishListPageState createState() => _FishListPageState();
}

String searchFish = '';


class _FishListPageState extends State<FishList>{

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
              color: colorLightDarkAccent,
            ),
            
            FutureBuilder(
              future: getFishData(searchFish),
              builder: (context,snapshot){
                Widget fishListSliver;
                if(snapshot.hasData){
                  fishListSliver = SliverPadding(
                    padding: EdgeInsets.only(top:0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return fishContainer(percentScale, snapshot.data[index].caught, snapshot.data[index]);
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

                double top = 0;

                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: colorFishAppBar,
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 10,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,10*percentScale-(top/6.8)*percentScale,0),
                              child: Text("Fish",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                                  fontSize: 30*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                              ),
                            ),
                            titlePadding: EdgeInsets.only(left: 30*percentScale, bottom: 20),
                            background: Stack(
                              children: <Widget>[
                                //Image.asset('assets/fishTitle.png'),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom:20,right:10),
                                    child: Container(
                                      height: 35*percentScale,
                                      width: 300*percentScale,
                                      child: Opacity(
                                        opacity: (){
                                          if(top<280&&top>190){
                                            return 1-((280-top)/90);
                                          } else {
                                            return 0.0;
                                          }
                                        }(),
                                        child: CupertinoTextField(
                                          onTap: (){
                                            searchFish='';
                                          },
                                          maxLength: 15,
                                          placeholder: (){
                                            if (searchFish==''){
                                              return 'Search';
                                            } else {
                                              return searchFish;
                                            }
                                          }(),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: colorSearchbarBG,
                                          ),
                                          prefix: Padding(
                                            padding:
                                                const EdgeInsets.only(right:13, left:7),
                                            child: Icon(
                                              Icons.search,
                                              color: colorSearchbarIcon,
                                            ),
                                          ),
                                          onChanged: (string){
                                            setState(() {
                                              searchFish = string;
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


Widget fishContainer(double percentScale, bool caught,snapshot){
  return Center(
    child: new StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) { 
        return Visibility(
          visible: (){
            if(!showListOnlyActive)
              return true;
            else if(determineTime(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec)=='NA'&&searchFish=="")
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
                        highlightColor: colorFishAccent,
                        splashColor: colorFishAccent,
                        enableFeedback: true,
                        onLongPress: (){
                          setState(() {
                            caught = !caught;
                            saveBool("fishCheckList"+snapshot.name, false, caught);
                            if (caught)
                              saveInt("totalCollectedFish", 0, totalCollectedFish++);
                            else
                              saveInt("totalCollectedFish", 0, totalCollectedFish--);
                          });
                        },
                        onTap: (){
                          currentCaughtFish = caught;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Future<void> future = showModalBottomSheet(
                            //by setting this to true, we can avoid the half screen limit
                            isScrollControlled:true,
                            context: context, 
                            builder: (context){
                              return Container(
                                height: 400*percentScale,
                                  child: Container(
                                    child: fishPopUp(percentScale, currentCaughtFish, snapshot),
                                ),
                              );
                          });
                          future.then((void value)=> setState(() {
                            getStoredBool("fishCheckList"+snapshot.name, false).then((indexResult){
                                caught = indexResult;
                            });
                          }));
                        },
                        child: new Container(
                          width: 334*percentScale,
                          height: 75*percentScale,
                        ),
                      ),
                      color: determineBackgroundColor(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec),
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
                          imageUrl: snapshot.iconImage,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 45*percentScale,height:45*percentScale),
                          height:45*percentScale,
                          width:45*percentScale,
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues((80)*percentScale,(10)*percentScale,0),
                        child: new Text((capitalize(snapshot.name)),
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
                        child: new Text(determineTime(snapshot.nhJan, snapshot.nhFeb, snapshot.nhMar, snapshot.nhApr, snapshot.nhMay, snapshot.nhJun, snapshot.nhJul, snapshot.nhAug, snapshot.nhSep, snapshot.nhOct, snapshot.nhNov, snapshot.nhDec, snapshot.shJan, snapshot.shFeb, snapshot.shMar, snapshot.shApr, snapshot.shMay, snapshot.shJun, snapshot.shJul, snapshot.shAug, snapshot.shSep, snapshot.shOct, snapshot.shNov, snapshot.shDec),
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
                        child: new Text(snapshot.whereHow,
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
                           'assets/shadow'+determineShadowImage(snapshot.shadow, snapshot.whereHow)+'.png',
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
                                saveBool("fishCheckList"+snapshot.name, false, caught);
                                if (caught)
                                  saveInt("totalCollectedFish", 0, totalCollectedFish++);
                                else
                                  saveInt("totalCollectedFish", 0, totalCollectedFish--);
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