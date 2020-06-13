import 'main.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'toolsPopup.dart';
import 'databases.dart';


class ToolsList extends StatefulWidget {
  ToolsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ToolsListPageState createState() => _ToolsListPageState();
}

String searchTools = '';
var futureTools;



class _ToolsListPageState extends State<ToolsList>{
  @override
  void initState(){
    super.initState();
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
    futureTools = getToolsData(searchTools);
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
              future: futureTools,
              builder: (context,snapshot){
                Widget toolsListSliver;
                if(snapshot.hasData){
                  toolsListSliver = SliverPadding(
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
                          return toolsContainer(percentScale, index, snapshot.data[index].name, snapshot.data[index].image,snapshot.data[index].variation,snapshot.data[index].bodyTitle,snapshot.data[index].diy,snapshot.data[index].customize,snapshot.data[index].kitCost,snapshot.data[index].uses,snapshot.data[index].stackSize,snapshot.data[index].buy,snapshot.data[index].sell,snapshot.data[index].color1,snapshot.data[index].color2,snapshot.data[index].size,snapshot.data[index].set,snapshot.data[index].milesPrice,snapshot.data[index].source,snapshot.data[index].version,snapshot.data[index].filename,snapshot.data[index].variantID,snapshot.data[index].internalID,snapshot.data[index].uniqueEntryID);
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  toolsListSliver = SliverToBoxAdapter(
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
                      backgroundColor: colorToolsAppBar,
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
                              child: Text("Tools",
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
                                              searchTools='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchTools==''){
                                                  return 'Search';
                                                } else {
                                                  return searchTools;
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
                                              setState(() {
                                                searchTools = string;
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
                    toolsListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:100*percentScale,
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

Widget toolsContainer(double percentScale, int index, String name,String imageLink,String variation, String bodyTile, String diy, String customize, String kitCost, String uses, String stackSize, String buy, String sell, String color1, String color2, String size, String set, String milesPrice, String source, String version, String filename, String variantID, String internalID, String uniqueEntryID){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return FutureBuilder(
        future: getStoredBool("toolsCheckList"+name+variation, false),
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
                            currentCollectedTool = !snapshot.data;
                            saveBool("toolsCheckList"+name+variation, false, !snapshot.data);
                          });
                        },
                        onTap: (){
                          currentCollectedTool = snapshot.data;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Future<void> future = showModalBottomSheet(
                            //by setting this to true, we can avoid the half screen limit
                            isScrollControlled:true,
                            context: context,
                            builder: (context){
                              return Container(
                                height: 400*percentScale,
                                  child: Container(
                                    child: toolsPopUp(percentScale, currentCollectedTool, name, imageLink, variation, bodyTile, diy, customize, kitCost, uses, stackSize, buy, sell, color1, color2, size, set, milesPrice, source, version, filename, variantID, internalID, uniqueEntryID)
                                ),
                              );
                          });
                          future.then((void value)=> setState(() {
                            saveBool("toolsCheckList"+name+variation, false, currentCollectedTool);
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
                                currentCollectedTool = value;
                                saveBool("toolsCheckList"+name+variation, false, value);
                                //HapticFeedback.mediumImpact();
                              });
                            },
                          ),
                        ),
                      )
                  ),
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
                              imageUrl: imageLink,
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

