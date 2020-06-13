import 'main.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'furniturePopup.dart';
import 'databases.dart';

List<String> furnitureRequest = [];

class FurnitureList extends StatefulWidget {
  FurnitureList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FurnitureListPageState createState() => _FurnitureListPageState();
}

String searchFurniture = '';
var futureFurniture;


class _FurnitureListPageState extends State<FurnitureList>{
  final debouncerFurniture = Debouncer(milliseconds: 300);

  @override
  void initState(){
    super.initState();
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
    futureFurniture = Future.wait([getHousewaresData(searchFurniture),getMiscellaneousData(searchFurniture),getWallmountedData(searchFurniture),getPhotosData(searchFurniture),getPostersData(searchFurniture)]);
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
    
    double top = 0;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: colorLightDarkAccent,
            ),
            FutureBuilder(
              future: futureFurniture,
              builder: (context,snapshot){
                Widget housewaresListSliver;
                Widget miscellaneousListSliver;
                Widget wallmountedListSliver;
                Widget photosListSliver;
                Widget postersListSliver;
                if(snapshot.hasData){
                  housewaresListSliver = SliverPadding(
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].image,snapshot.data[0][index].source, snapshot.data[0][index].buy, snapshot.data[0][index].milesPrice, snapshot.data[0][index].sell, snapshot.data[0][index].color1, snapshot.data[0][index].color2,  snapshot.data[0][index].hhaConcept1, snapshot.data[0][index].hhaConcept2, snapshot.data[0][index].hhaSeries, snapshot.data[0][index].tag, snapshot.data[0][index].variation, snapshot.data[0][index].pattern, snapshot.data[0][index].kitCost);
                        },
                        childCount: snapshot.data[0].length,
                      ),
                    ),
                  );
                  miscellaneousListSliver = SliverPadding(
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[1][index].name, snapshot.data[1][index].image,snapshot.data[1][index].source, snapshot.data[1][index].buy, snapshot.data[1][index].milesPrice, snapshot.data[1][index].sell, snapshot.data[1][index].color1, snapshot.data[1][index].color2,  snapshot.data[1][index].hhaConcept1, snapshot.data[1][index].hhaConcept2, snapshot.data[1][index].hhaSeries, snapshot.data[1][index].tag, snapshot.data[1][index].variation, snapshot.data[1][index].pattern, snapshot.data[1][index].kitCost);
                        },
                        childCount: snapshot.data[1].length,
                      ),
                    ),
                  );
                  wallmountedListSliver = SliverPadding(
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[2][index].name, snapshot.data[2][index].image,snapshot.data[2][index].source, snapshot.data[2][index].buy, snapshot.data[2][index].milesPrice, snapshot.data[2][index].sell, snapshot.data[2][index].color1, snapshot.data[2][index].color2,  snapshot.data[2][index].hhaConcept1, snapshot.data[2][index].hhaConcept2, snapshot.data[2][index].hhaSeries, snapshot.data[2][index].tag, snapshot.data[2][index].variation, snapshot.data[2][index].pattern, snapshot.data[2][index].kitCost);
                        },
                        childCount: snapshot.data[2].length,
                      ),
                    ),
                  );
                  photosListSliver = SliverPadding(
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[3][index].name, snapshot.data[3][index].image,snapshot.data[3][index].source, snapshot.data[3][index].buy, snapshot.data[3][index].milesPrice, snapshot.data[3][index].sell, snapshot.data[3][index].color1, snapshot.data[3][index].color2,  snapshot.data[3][index].hhaConcept1, snapshot.data[3][index].hhaConcept2, snapshot.data[3][index].hhaSeries, snapshot.data[3][index].tag, snapshot.data[3][index].variation, snapshot.data[3][index].pattern, snapshot.data[3][index].kitCost);
                        },
                        childCount: snapshot.data[3].length,
                      ),
                    ),
                  );
                  postersListSliver = SliverPadding(
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[4][index].name, snapshot.data[4][index].image,snapshot.data[4][index].source, snapshot.data[4][index].buy, snapshot.data[4][index].milesPrice, snapshot.data[4][index].sell, snapshot.data[4][index].color1, snapshot.data[4][index].color2,  snapshot.data[4][index].hhaConcept1, snapshot.data[4][index].hhaConcept2, snapshot.data[4][index].hhaSeries, snapshot.data[4][index].tag, snapshot.data[4][index].variation, snapshot.data[4][index].pattern, snapshot.data[4][index].kitCost);
                        },
                        childCount: snapshot.data[4].length,
                      ),
                    ),
                  );
                } else {
                  housewaresListSliver = SliverToBoxAdapter(
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
                  miscellaneousListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  wallmountedListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  photosListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  postersListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  
                }
                return CustomScrollView(
                  // controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: colorFurnitureAppBar,
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
                              child: Text("Furniture",
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
                                              searchFurniture='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchFurniture==''){
                                                  return 'Search';
                                                } else {
                                                  return searchFurniture;
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
                                                color:colorSearchbarIcon,
                                              ),
                                            ),
                                            onChanged: (string){
                                              debouncerFurniture.run((){
                                                setState(() {
                                                  searchFurniture = string;
                                                  futureFurniture = Future.wait([getHousewaresData(searchFurniture),getMiscellaneousData(searchFurniture),getWallmountedData(searchFurniture),getPhotosData(searchFurniture),getPostersData(searchFurniture)]);
                                                });
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
                    housewaresListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    miscellaneousListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    wallmountedListSliver,
                    photosListSliver,
                    postersListSliver,
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

Widget furnitureContainer(double percentScale, Color colorTextBlack, String name, String image, String source, String buy, String milesPrice, String sell, String color1, String color2, String hhaConcept1, String hhaConcept2, String hhaSeries, String tag, String variation, String pattern, String kitCost){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return FutureBuilder(
        future:getStoredBool("furnitureCheckList"+name+variation+pattern, false),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return Stack(
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
                          color: colorShadow,
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
                            currentCollectedFurniture = !snapshot.data;
                            saveBool("furnitureCheckList"+name+variation+pattern, false, !snapshot.data);
                          });
                        },
                        onTap: (){
                          currentCollectedFurniture = snapshot.data;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Future<void> future = showModalBottomSheet(
                            //by setting this to true, we can avoid the half screen limit
                            isScrollControlled:true,
                            context: context, 
                            builder: (context){
                              return Container(
                                height: 500*percentScale,
                                  child: Container(
                                    child: furniturePopUp(percentScale, colorTextBlack, name, image, source, currentCollectedFurniture, buy, milesPrice, sell,color1,color2,hhaConcept1,hhaConcept2,hhaSeries,tag,variation, pattern, kitCost)
                                ),
                              );
                          });
                          future.then((void value)=> setState(() {
                            saveBool("furnitureCheckList"+name+variation+pattern, false, currentCollectedFurniture);
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
                            child: OptimizedCacheImage(
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
                    opacity: snapshot.data ? 1 : 0,
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
                          value: snapshot.data,
                          onChanged: (bool value) {
                            setState(() {
                              currentCollectedFurniture = value;
                              saveBool("furnitureCheckList"+name+variation+pattern, false, value);
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
          } else {
            return Container();
          }
        }
      );
    }
  );
}

