import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'floorWallListPopup.dart';
import 'databases.dart';



class FloorWallsList extends StatefulWidget {
  FloorWallsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FloorWallsListPageState createState() => _FloorWallsListPageState();
}

String searchfloorWalls = '';




class _FloorWallsListPageState extends State<FloorWallsList>{
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
    
    double top = 0;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color( 0xffFFFFFF)),
            ),
            FutureBuilder(
              future: Future.wait([getRugsData(searchfloorWalls), getFloorsData(searchfloorWalls),getWallpapersData(searchfloorWalls)]),
              builder: (context,snapshot){
                Widget rugsListSliver;
                Widget floorsListSliver;
                Widget wallpapersListSliver;
                if(snapshot.hasData){
                  rugsListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    sliver: new SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 17,
                        childAspectRatio: 0.78,
                      ),
                      delegate: 
                      SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return floorWallsContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].image,snapshot.data[0][index].source,snapshot.data[0][index].collected, snapshot.data[0][index].buy, snapshot.data[0][index].milesPrice, snapshot.data[0][index].sell, snapshot.data[0][index].color1, snapshot.data[0][index].color2,  snapshot.data[0][index].hhaConcept1, snapshot.data[0][index].hhaConcept2, snapshot.data[0][index].hhaSeries, snapshot.data[0][index].tag);
                        },
                        childCount: snapshot.data[0].length,
                      ),
                    ),
                  );
                  floorsListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    sliver: new SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 17,
                        childAspectRatio: 0.78,
                      ),
                      delegate: 
                      SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return floorWallsContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].image,snapshot.data[0][index].source,snapshot.data[0][index].collected, snapshot.data[0][index].buy, snapshot.data[0][index].milesPrice, snapshot.data[0][index].sell, snapshot.data[0][index].color1, snapshot.data[0][index].color2,  snapshot.data[0][index].hhaConcept1, snapshot.data[0][index].hhaConcept2, snapshot.data[0][index].hhaSeries, snapshot.data[0][index].tag);                        },
                        childCount: snapshot.data[1].length,
                      ),
                    ),
                  );
                  wallpapersListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    sliver: new SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 17,
                        childAspectRatio: 0.78,
                      ),
                      delegate: 
                      SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return floorWallsContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].image,snapshot.data[0][index].source,snapshot.data[0][index].collected, snapshot.data[0][index].buy, snapshot.data[0][index].milesPrice, snapshot.data[0][index].sell, snapshot.data[0][index].color1, snapshot.data[0][index].color2,  snapshot.data[0][index].hhaConcept1, snapshot.data[0][index].hhaConcept2, snapshot.data[0][index].hhaSeries, snapshot.data[0][index].tag);                        },
                        childCount: snapshot.data[2].length,
                      ),
                    ),
                  );
                } else {
                  rugsListSliver = SliverToBoxAdapter(
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
                  floorsListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  wallpapersListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                }
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: Color(0xFF1565c0),
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
                              child: Text("Floor & Wall",
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
                                  Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:20,right:10),
                                      child: Opacity(
                                        opacity: (){
                                          if(top<280&&top>190){
                                            return 1-((280-top)/90);
                                          } else {
                                            return 0.0;
                                          }
                                        }(),
                                        child: Container(
                                          height: 35*percentScale,
                                          width: 300*percentScale,
                                          child: CupertinoTextField(
                                            onTap: (){
                                              searchfloorWalls='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchfloorWalls==''){
                                                  return 'Search';
                                                } else {
                                                  return searchfloorWalls;
                                                }
                                            }(),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Color(0x75D4D4D4),
                                            ),
                                            prefix: Padding(
                                              padding:
                                                  const EdgeInsets.only(right:13, left:7),
                                              child: Icon(
                                                Icons.search,
                                                color: Color(0xAD6B6B6B),
                                              ),
                                            ),
                                            onChanged: (string){
                                              setState(() {
                                                searchfloorWalls = string;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                      )
                    ),
                    rugsListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    floorsListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    wallpapersListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
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

Widget floorWallsContainer(double percentScale, Color colorTextBlack, String name, String image, String source, bool collected, String buy, String milesPrice, String sell, String color1, String color2, String hhaConcept1, String hhaConcept2, String hhaSeries, String tag){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return new Stack(
        children: <Widget>[
          //Shadow
          IgnorePointer(
            child: Container(
              width: 300*percentScale,
              height: 300*percentScale,
              decoration: new BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                    color: Color(0x0C000000),
                    offset: Offset(0,3),
                    blurRadius: 5,
                    spreadRadius: 0
                ) ],
              ),
            ),
          ),
          //Tap region inkwell
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
                      collected = !collected;
                      saveBool("floorWallsCheckList"+name, false, collected);
                    });
                  },
                  onTap: (){
                    currentCollectedFloorWalls = collected;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Future<void> future = showModalBottomSheet(
                      //by setting this to true, we can avoid the half screen limit
                      isScrollControlled:true,
                      context: context, 
                      builder: (context){
                        return Container(
                          height: 450*percentScale,
                            child: Container(
                              child: floorWallsPopUp(percentScale, colorTextBlack, name, image, source, currentCollectedFloorWalls, buy, milesPrice, sell,color1,color2,hhaConcept1,hhaConcept2,hhaSeries,tag),
                          ),
                        );
                    });
                    future.then((void value)=> setState(() {
                      getStoredBool("floorWallsCheckList"+name, false).then((indexResult){
                          collected = indexResult;
                      });
                    }));
                  },
                  child: new Container(
                    width: 350*percentScale,
                    height: 350*percentScale,
                  ),
                ),
                color: colorWhite,
              ),
            )
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(0,4*percentScale,0),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          width: 70*percentScale,
                          height: 70*percentScale,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4*percentScale),
                            image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        imageUrl: image,
                        //placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 70*percentScale,height:70*percentScale),
                        height:70*percentScale,
                        width:70*percentScale,
                        fadeInDuration: Duration(milliseconds:800),
                      ),
                    ),
                    
                    Container(
                      height:40*percentScale,
                      padding: const EdgeInsets.all(6.0),
                      child: Center(
                        child: Text(name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: colorTextBlack,
                            fontSize: 12*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
          
          Align(
            alignment: Alignment.topRight,
            child: AnimatedOpacity(
              duration: Duration(milliseconds:400),
              opacity: collected ? 1 : 0,
              child: Container(
                transform: Matrix4.translationValues(6*percentScale,-6*percentScale,0),
                height: 25*percentScale,
                width: 25*percentScale,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorCheckGreen,
                  boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0
                  ) ],
                ),
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Color(0x00000000)),
                  child: new Checkbox(
                    activeColor: Color(0x00000000),
                    checkColor: Color(0xFF444444),
                    value: collected,
                    onChanged: (bool value) {
                      setState(() {
                        collected = value;
                        saveBool("floorWallsCheckList"+name, false, collected);
                        //HapticFeedback.mediumImpact();
                      });
                    },
                  ),
                ),
              )
            ),
          ),
        ]
      );
    }
  );
}

