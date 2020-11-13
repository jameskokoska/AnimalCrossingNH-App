import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'databases.dart';
import 'popupFunctions.dart';

class ConstructionList extends StatefulWidget {
  ConstructionList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConstructionListPageState createState() => _ConstructionListPageState();
}

String searchConstruction = '';

class _ConstructionListPageState extends State<ConstructionList>{
  @override
  void initState(){
    super.initState();
    searchConstruction = '';
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
      floatingActionButton: floatingActionButton(percentScale, context),
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
                  future: Future.wait([getFenceData(searchConstruction),getConstructionData(searchConstruction)]),
                  builder: (context,snapshot){
                    Widget fenceListSliver;
                    Widget constructionListSliver;
                    if(snapshot.hasData){
                      fenceListSliver = SliverPadding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        sliver: new SliverGrid(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 17,
                            childAspectRatio: 0.9,
                          ),
                          delegate:
                          SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return constructionContainer(percentScale, index, snapshot.data[0][index]);
                            },
                            childCount: snapshot.data[0].length,
                          ),
                        ),
                      );
                      constructionListSliver = SliverPadding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        sliver: new SliverGrid(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 17,
                            childAspectRatio: 0.9,
                          ),
                          delegate:
                          SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return constructionContainer(percentScale, index, snapshot.data[1][index]);
                            },
                            childCount: snapshot.data[1].length,
                          ),
                        ),
                      );
                    } else {
                      fenceListSliver = SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height:100*percentScale,
                            ),
                            SpinKitThreeBounce(
                              color: colorConstructionAppBar,
                              size:80,
                            )
                          ],
                        )
                      );
                      constructionListSliver = SliverToBoxAdapter(
                        child:Container()
                      );
                    }
                    return CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: <Widget>[
                        SliverAppBar(
                          expandedHeight: 219*percentScale,
                          backgroundColor: colorConstructionAppBar,
                          pinned: true,
                          //snap: true,
                          floating: true,
                          elevation: 10,
                          flexibleSpace: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints){
                              top = constraints.biggest.height;
                              return FlexibleSpaceBar(
                                title: Container(
                                  transform: Matrix4.translationValues(0,17*percentScale-(top/6.8)*percentScale,0),
                                  child: Text("Construction",
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
                                                  searchConstruction='';
                                                },
                                                maxLength: 15,
                                                placeholder: (){
                                                  if (searchConstruction==''){
                                                    return 'Search';
                                                  } else {
                                                    return searchConstruction;
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
                                                    searchConstruction = string;
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
                        fenceListSliver,
                        SliverToBoxAdapter(
                            child:Container(
                              height:15*percentScale,
                            )
                        ),
                        constructionListSliver,
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


Widget constructionContainer(double percentScale,int index,var snapshot){
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
      IgnorePointer(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      width: 100*percentScale,
                      height: 100*percentScale,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4*percentScale),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    imageUrl: snapshot.image,
                    //placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 70*percentScale,height:70*percentScale),
                    height:100*percentScale,
                    width:100*percentScale,
                    fadeInDuration: Duration(milliseconds:800),
                  ),
                ),
              ),
              Container(
                height:30*percentScale,
                child: Center(
                  child: Text(snapshot.name,
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
              (){
                String image;
                String cost;
                if(snapshot.buy!="NFS"){
                  image = "bellBag.png";
                  cost = snapshot.buy;
                } else {
                  image = "coin.png";
                  cost = snapshot.sell;
                }
                return IntrinsicWidth(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/' + image,
                        height: 12*percentScale,
                        width: 12*percentScale,
                      ),
                      SizedBox(width:4*percentScale),
                      Center(
                        child: Text(priceFormat.format(int.parse(cost)) +" bells",
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
                    ],
                  ),
                );
              }()
            ],
          ),
        ),
      ),
    ]
  );
}