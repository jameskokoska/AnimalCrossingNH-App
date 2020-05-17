import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'artPopup.dart';
import 'popupFunctions.dart';

import 'dart:async';
import 'dart:convert';

class ArtList extends StatefulWidget {
  ArtList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ArtListPageState createState() => _ArtListPageState();
}

String searchArt = '';

class ArtData{
  final String name;
  final String image;
  final String genuine;
  final String category;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String realArtworkTitle;
  final String artist;
  final String museumDescription;
  final String source;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String hhaSet;
  final String interact;
  final String tag;
  final String speakerType;
  final String lightingType;
  final String catalog;
  final String filename;
  final String internalID;
  final String uniqueEntryID;
  final bool collected;

  ArtData(this.name,this.image,this.genuine,this.category,this.buy,this.sell,this.color1,this.color2,this.size,this.realArtworkTitle,this.artist,this.museumDescription,this.source,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.hhaSet,this.interact,this.tag,this.speakerType,this.lightingType,this.catalog,this.filename,this.internalID,this.uniqueEntryID,this.collected);

}


class _ArtListPageState extends State<ArtList>{

  Future<List<ArtData>> getArtData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/art.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<ArtData> artData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("artCheckList"+u["Name"]+u["Genuine"], false).then((indexResult){
        collected = indexResult;
        ArtData artDatum = ArtData(u["Name"],u["Image"],u["Genuine"],u["Category"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Real Artwork Title"],u["Artist"],u["Museum Description"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            if(u["Name"]!=previousName)
              artData.add(artDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            artData.add(artDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return artData;
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
                  future: getArtData(searchArt),
                  builder: (context,snapshot){
                    Widget artListSliver;
                    if(snapshot.hasData){
                      artListSliver = SliverPadding(
                        padding: EdgeInsets.only(top:0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return artContainer(percentScale, index, snapshot.data[index].collected, snapshot.data[index].name,snapshot.data[index].image,snapshot.data[index].genuine,snapshot.data[index].category,snapshot.data[index].buy,snapshot.data[index].sell,snapshot.data[index].color1,snapshot.data[index].color2,snapshot.data[index].size,snapshot.data[index].realArtworkTitle,snapshot.data[index].artist,snapshot.data[index].museumDescription,snapshot.data[index].source,snapshot.data[index].version,snapshot.data[index].hhaConcept1,snapshot.data[index].hhaConcept2,snapshot.data[index].hhaSeries,snapshot.data[index].hhaSet,snapshot.data[index].interact,snapshot.data[index].tag,snapshot.data[index].speakerType,snapshot.data[index].lightingType,snapshot.data[index].catalog,snapshot.data[index].filename,snapshot.data[index].internalID,snapshot.data[index].uniqueEntryID);
                            },
                            childCount: snapshot.data.length,
                          ),
                        ),
                      );
                    } else {
                      artListSliver = SliverToBoxAdapter(
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
                                    child: Text("Artwork",
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
                                      //Image.asset('assets/artTitle.png'),
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
                                                  searchArt='';
                                                },
                                                maxLength: 15,
                                                placeholder: (){
                                                  if (searchArt==''){
                                                    return 'Search';
                                                  } else {
                                                    return searchArt;
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
                                                    searchArt = string;
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
                        artListSliver,
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


Widget artContainer(double percentScale,int index,bool collected,String name,String image,String genuine,String category,String buy,String sell,String color1, String color2,String size,String realArtworkTitle,String artist,String museumDescription,String source,String version, String hhaConcept1,String hhaConcept2,String hhaSeries,String hhaSet,String interact,String tag,String speakerType,String lightingType,String catalog,String filename,String internalID,String uniqueEntryID){
  return Center(
    child: new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Visibility(
            visible: (){
              if(!showListOnlyActive)
                return true;
//              else if(determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)=='NA'&&searchArt=="")
//                return false;
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
                                  collected = !collected;
                                  saveBool("artCheckList"+name, false, collected);
                                });
                              },
                              onTap: (){
                                currentCollectedArt = collected;
                                FocusScope.of(context).requestFocus(new FocusNode());
                                Future<void> future = showModalBottomSheet(
                                  //by setting this to true, we can avoid the half screen limit
                                    isScrollControlled:true,
                                    context: context,
                                    builder: (context){
                                      return Container(
                                        height: 400*percentScale,
                                        child: Container(
                                          child: artPopUp(percentScale,collected,name,image,genuine,category,buy,sell,color1,color2,size,realArtworkTitle,artist,museumDescription,source,version,hhaConcept1,hhaConcept2,hhaSeries,hhaSet,interact,tag,speakerType,lightingType,catalog,filename,internalID,uniqueEntryID),
                                        ),
                                      );
                                    });
                                future.then((void value)=> setState(() {
                                  getStoredBool("artCheckList"+name, false).then((indexResult){
                                    collected = indexResult;
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
                                  color: colorArtAccent,
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
                                imageUrl: image,
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
//                            Container(
//                              transform: Matrix4.translationValues((80)*percentScale,(32)*percentScale,0),
//                              child: new Text(determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec,shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec),
//                                  style: TextStyle(
//                                    fontFamily: 'ArialRoundedBold',
//                                    color: colorArtTextDarkGreen,
//                                    fontSize: 14*percentScale,
//                                    fontWeight: FontWeight.w400,
//                                    fontStyle: FontStyle.normal,
//                                  )
//                              ),
//                            ),
                            Container(
                              transform: Matrix4.translationValues((80)*percentScale,(49)*percentScale,0),
                              child: new Text(artist,
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color: colorArtTextDarkGreen,
                                    fontSize: 14*percentScale,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),
                            ),
                            //Checkmark background
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              top: collected ? 40*percentScale : 0,
                              bottom: collected ? 40*percentScale : 0,
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
                              top: !collected ? 40*percentScale : 0,
                              bottom: !collected ? 40*percentScale : 0,
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
                                  value: collected,
                                  onChanged: (bool value) {
                                    setState(() {
                                      collected = value;
                                      saveBool("artCheckList"+name, false, collected);
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