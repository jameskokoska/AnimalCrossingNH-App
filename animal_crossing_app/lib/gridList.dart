import 'package:animal_crossing_app/floorWallListPopup.dart';
import 'package:animal_crossing_app/villagerPopup.dart';

import 'main.dart';
import 'databases.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'furniturePopup.dart';
import 'clothingPopup.dart';
import 'toolsPopup.dart';
import 'floorWallListPopup.dart';

bool popupCollectedGrid;

String getKey(var snapshotContainerData, String title){
  switch(title){
    case "Furniture" : return("furnitureCheckList"+snapshotContainerData.name+snapshotContainerData.variation+snapshotContainerData.pattern);
    break;

    case "Clothing" : return("clothingCheckList"+snapshotContainerData.name+snapshotContainerData.variation);
    break;

    case "Tools" : return("toolsCheckList"+snapshotContainerData.name+snapshotContainerData.variation);
    break;

    case "Floor & Wall" : return ("floorWallsCheckList"+snapshotContainerData.name);
    break;

    case "Villagers" : return ("villagerCheckList"+snapshotContainerData.name);
    break;

    default: return("");
    break;
  }
}

Widget getPopupFunction(String title, percentScale, colorTextBlack,snapshotContainerData){
  switch(title){
    case "Furniture" : return furniturePopUp(percentScale, colorTextBlack,snapshotContainerData);
    break;

    case "Clothing" : return clothingPopup(percentScale, colorTextBlack, snapshotContainerData);
    break;

    case "Tools" : return toolsPopUp(percentScale, colorTextBlack, snapshotContainerData);
    break;

    case "Floor & Wall" : return floorWallsPopUp(percentScale, colorTextBlack, snapshotContainerData);
    break;

    case "Villagers" : return villagerPopUp(percentScale, colorTextBlack,  snapshotContainerData);
    
    default: return(Container());
    break;
  }
}

List<Future<List>> getFutureFunctions(String title, String searchGrid){
  switch(title){
    case "Furniture" : return [getHousewaresData(searchGrid),getMiscellaneousData(searchGrid),getWallmountedData(searchGrid),getPhotosData(searchGrid),getPostersData(searchGrid)];
    break;

    case "Clothing" : return [getHeadwearData(searchGrid), getAccessoriesData(searchGrid),getTopsData(searchGrid),getBottomsData(searchGrid),getSocksData(searchGrid),getShoesData(searchGrid),getUmbrellasData(searchGrid),getBagsData(searchGrid)];
    break;

    case "Tools" : return [getToolsData(searchGrid)];
    break;

    case "Floor & Wall" : return [getRugsData(searchGrid), getFloorsData(searchGrid),getWallpapersData(searchGrid)];
    break;

    case "Villagers" : return [getVillagerData(searchGrid)];
    break;

    default: return([]);
    break;
  }
}

class GridList extends StatefulWidget {
  final String title;
  final futureFunctions;
  final List<Widget> sliverList;
  final Color titleColor;
  final Color mainColor;
  final Color accentColor;
  final bool checkmark;
  final Color checkmarkColor;
  final int popupHeight;

  GridList({
    this.title, 
    this.futureFunctions, 
    this.sliverList,
    this.titleColor,
    this.mainColor,
    this.accentColor,
    this.checkmark,
    this.checkmarkColor,
    this.popupHeight,
  });

  @override
  _GridListPageState createState() => _GridListPageState(
    title: title, 
    futureFunctions: futureFunctions,
    sliverList: sliverList,
    titleColor: titleColor,
    mainColor: mainColor,
    accentColor: accentColor,
    checkmark:checkmark,
    checkmarkColor: checkmarkColor,
    popupHeight: popupHeight,
  );
}

class _GridListPageState extends State<GridList>{
  _GridListPageState({
    this.title, 
    this.futureFunctions, 
    this.sliverList,
    this.titleColor,
    this.mainColor,
    this.accentColor,
    this.checkmark,
    this.checkmarkColor,
    this.popupHeight,
  });
  final String title;
  var futureFunctions;
  List<Widget> sliverList;
  final Color titleColor;
  final Color mainColor;
  final Color accentColor;
  final bool checkmark;
  final Color checkmarkColor;
  final int popupHeight;

  final debouncerGrid = Debouncer(milliseconds: 300);
  
  var futureGrid;
  String searchGrid = '';
  
  @override
  void initState(){
    super.initState();
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
    futureGrid = Future.wait(getFutureFunctions(title, searchGrid));
  }
  
  @override
  Widget build(BuildContext context){
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
              future: futureGrid,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  for(int i = 0; i < sliverList.length; i++){
                    sliverList[i]= SliverPadding(
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
                            return gridContainer(percentScale, popupHeight, colorTextBlack, accentColor, checkmarkColor, title, checkmark, snapshot.data[i][index]);
                          },
                          childCount: snapshot.data[i].length,
                        ),
                      ),
                    );
                  }
                } else {
                  for(int i = 0; i < sliverList.length; i++){
                    if(i==0){
                      sliverList[i]= SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height:100*percentScale,
                            ),
                            SpinKitThreeBounce(
                              color: mainColor,
                              size:80,
                            )
                          ],
                        )
                      );
                    } else {
                      sliverList[i]= SliverToBoxAdapter(
                        child: Container(
                        )
                      );
                    }
                  }
                }
                return CustomScrollView(
                  // controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: List.generate(1+sliverList.length*2, (index){
                    if(index==0){
                      return SliverAppBar(
                        expandedHeight: 219*percentScale,
                        backgroundColor: mainColor,
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
                                child: Text(title,
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color: titleColor,
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
                                                searchGrid='';
                                              },
                                              maxLength: 15,
                                              placeholder: (){
                                                if (searchGrid==''){
                                                    return 'Search';
                                                  } else {
                                                    return searchGrid;
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
                                                debouncerGrid.run((){
                                                  setState(() {
                                                    searchGrid = string;
                                                    futureGrid = Future.wait(getFutureFunctions(title, searchGrid));
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
                      );
                    } else if (index%2==1){
                      return SliverToBoxAdapter(
                        child:Container(
                          height:20*percentScale,
                          color: Colors.black,
                        )
                      );
                    } else {
                      return sliverList[(index/2-1).round()];
                    }
                  }),
                );
              }
            ),
          ],
        ),
      )
    );
  }
}


Widget gridContainer(double percentScale, int popupHeight, Color colorTextBlack, Color accentColor, Color checkmarkColor, String title, bool checkmark, var snapshotContainerData){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return FutureBuilder(
        future:getStoredBool(getKey(snapshotContainerData, title), false),
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
                        highlightColor: accentColor,
                        splashColor: accentColor,
                        enableFeedback: true,
                        onLongPress: (){
                          setState(() {
                            saveBool(getKey(snapshotContainerData, title), false, !snapshot.data);
                          });
                        },
                        onTap: (){
                          popupCollectedGrid = snapshot.data;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Future<void> future = showModalBottomSheet(
                            //by setting this to true, we can avoid the half screen limit
                            isScrollControlled:true,
                            context: context, 
                            builder: (context){
                              return Container(
                                height: popupHeight*percentScale,
                                  child: Container(
                                    child: getPopupFunction(title, percentScale, colorTextBlack,snapshotContainerData)
                                ),
                              );
                          });
                          future.then((void value)=> setState(() {
                            getStoredBool(getKey(snapshotContainerData, title), false);
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
                              imageUrl: snapshotContainerData.image,
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
                              child: Text(snapshotContainerData.name,
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
                (){
                  if(checkmark){
                    return Align(
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
                            color: checkmarkColor,
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
                                  saveBool(getKey(snapshotContainerData, title), false, value);
                                  //HapticFeedback.mediumImpact();
                                });
                              },
                            ),
                          ),
                        )
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.topRight,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds:200),
                        opacity: snapshot.data ? 1 : 0,
                        child: Container(
                          transform: Matrix4.translationValues(6*percentScale,-6*percentScale,0),
                          height: 25*percentScale,
                          width: 25*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: checkmarkColor,
                            boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                            ) ],
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red[400],
                            size: 15*percentScale,
                          ),
                        )
                      ),
                    );
                  }
                }()

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

