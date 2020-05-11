import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:async';
import 'dart:convert';


class VillagerList extends StatefulWidget {
  VillagerList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VillagerListPageState createState() => _VillagerListPageState();
}

String searchVillager = '';

class VillagerData{
  final String name;
  final String image;
  final String species;
  final String gender;
  final String personality;
  final String birthday;
  final String catchphrase;
  final String style1;
  final String style2;
  final String color1;
  final String color2;
  final String filename;
  final String uniqueEntryID;
  final bool favorite;

  VillagerData(this.name,this.image,this.species,this.gender,this.personality,this.birthday,this.catchphrase,this.style1,this.style2,
  this.color1,this.color2,this.filename,this.uniqueEntryID,this.favorite);
}

class _VillagerListPageState extends State<VillagerList>{

  Future<List<VillagerData>> getVillagerData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/villagers.json");

    final jsonData = json.decode(data);
    bool favorite = false;
    List<VillagerData> villagerData = [];
    for(var u in jsonData){
      getStoredBool("villagerCheckList"+u["Name"], false).then((indexResult){
        favorite = indexResult;
        VillagerData villagerDatum = VillagerData(u["Name"],u["Image"],u["Species"],u["Gender"],u["Personality"],u["Birthday"],u["Catchphrase"],u["Style 1"],u["Style 2"],u["Color 1"],u["Color 2"],u["Filename"],u["Unique Entry ID"],favorite);
        if(search == ''){
          villagerData.add(villagerDatum);
        } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
          villagerData.add(villagerDatum);
        }
      });
    }
    return villagerData;
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
              color: darkModeColor(darkMode, colorLightDarkAccent, Color( 0xffFFFFFF)),
            ),
            FutureBuilder(
              future: getVillagerData(searchVillager),
              builder: (context,snapshot){
                Widget villagerListSliver;
                if(snapshot.hasData){
                  villagerListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(20*percentScale, 0, 20*percentScale, 0),
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
                          return villagerContainer(percentScale, snapshot.data[index].name, snapshot.data[index].image,snapshot.data[index].favorite);
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  villagerListSliver = SliverToBoxAdapter(
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
                      backgroundColor: Color(0xFF66CFD6),
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 0,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,10*percentScale-(top/6.8)*percentScale,0),
                              child: Text("Villagers",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: colorTextBlack,
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
                                          print(top);
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
                                              searchVillager='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchVillager==''){
                                                  return 'Search';
                                                } else {
                                                  return searchVillager;
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
                                                searchVillager = string;
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
                    villagerListSliver,
                    
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

Widget villagerContainer(double percentScale, String name, String imageLink, bool collected){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Container(
        width: 98*percentScale,
        height: 117*percentScale,
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
              color: Color(0x0C000000),
              offset: Offset(0,3),
              blurRadius: 5,
              spreadRadius: 0
          ) ],
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: new Container(
                transform: Matrix4.translationValues(0,13*percentScale,0),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        width: 67*percentScale,
                        height: 67*percentScale,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4*percentScale),
                          image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      imageUrl: imageLink,
                      //placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                      height:67*percentScale,
                      width:67*percentScale,
                      fadeInDuration: Duration(milliseconds:800),
                    ),
                    SizedBox(
                      height: 8*percentScale,
                    ),
                    Text(name,
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: colorTextBlack,
                        fontSize: 13*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                duration: ((){
                  if(collected == true)
                    return Duration(milliseconds:1200);
                  else
                    return Duration(milliseconds:80);
                }()),
                opacity: collected ? 0 : 1,
                child: Container(
                  width:120*percentScale,
                  height:120*percentScale,
                  transform: Matrix4.translationValues(0,-8*percentScale,0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300*percentScale),
                    child: new Transform.scale(
                      scale: 3*percentScale,
                      child: Theme(
                        data: ThemeData(unselectedWidgetColor: Color(0x00000000)),
                        child: new Checkbox(
                          activeColor: Color(0x04FFFFFF),
                          checkColor: (){
                            if(collected==false){
                              return Color(0x00444444);
                            } else {
                              return Color(0xFF444444);
                            }
                          }(),
                          value: collected,
                          onChanged: (bool value) {
                            setState(() {
                              collected = value;
                              saveBool("villagerCheckList"+name, false, collected);
                              HapticFeedback.mediumImpact();
                            });
                          },
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AnimatedOpacity(
                duration: Duration(milliseconds:200),
                opacity: collected ? 1 : 0,
                child: Container(
                  transform: Matrix4.translationValues(6*percentScale,-6*percentScale,0),
                  height: 25*percentScale,
                  width: 25*percentScale,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorVillagerAccent,
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
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                )
              ),
            ),
          ],
        )
      );
   
    }
  );
}

