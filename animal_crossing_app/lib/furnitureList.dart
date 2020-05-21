import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:convert';
import 'furniturePopup.dart';


class FurnitureList extends StatefulWidget {
  FurnitureList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FurnitureListPageState createState() => _FurnitureListPageState();
}

String searchFurniture = '';

class HousewaresData{
  final String name;
  final String image;
  final String variation;
  final String bodyTitle;
  final String pattern;
  final String patternTitle;
  final String diy;
  final String bodyCustomize;
  final String patternCustomize;
  final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String hhaSet;
  final String interact;
  final String tag;
  final String outdoor;
  final String speakerType;
  final String lightingType;
  final String catalog;
  final String filename;
  final String variantId;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  HousewaresData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId,this.collected);
}

class MiscellaneousData{
  final String name;
  final String image;
  final String variation;
  final String bodyTitle;
  final String pattern;
  final String patternTitle;
  final String diy;
  final String bodyCustomize;
  final String patternCustomize;
  final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String hhaSet;
  final String interact;
  final String tag;
  final String outdoor;
  final String speakerType;
  final String lightingType;
  final String catalog;
  final String filename;
  final String variantId;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  MiscellaneousData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId, this.collected);
}

class WallmountedData{
  final String name;
  final String image;
  final String variation;
  final String bodyTitle;
  final String pattern;
  final String patternTitle;
  final String diy;
  final String bodyCustomize;
  final String patternCustomize;
  final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String hhaSet;
  final String interact;
  final String tag;
  final String outdoor;
  final String speakerType;
  final String lightingType;
  final String catalog;
  final String filename;
  final String variantId;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  WallmountedData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId, this.collected);
}

class PhotosData{
  final String name;
  final String image;
  final String variation;
  final String bodyTitle;
  final String pattern;
  final String patternTitle;
  final String diy;
  final String bodyCustomize; //"Customize"
  //final String patternCustomize;
  final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  //final String milesPrice;
  final String source;
  final String version;
  //final String hhaConcept1;
  //final String hhaConcept2;
  //final String hhaSeries;
  //final String hhaSet;
  //final String interact;
  //final String tag;
  //final String outdoor;
  //final String speakerType;
  //final String lightingType;
  final String catalog;
  final String filename;
  final String variantId;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  PhotosData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size, this.source,this.version,
  this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId, this.collected);
}

class PostersData{
  final String name;
  final String image;
  //final String variation;
  //final String bodyTitle;
  //final String pattern;
  //final String patternTitle;
  //final String diy;
  //final String bodyCustomize; //"Customize"
  //final String patternCustomize;
  //final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  //final String milesPrice;
  final String source;
  final String sourceNotes;
  final String version;
  //final String hhaConcept1;
  //final String hhaConcept2;
  //final String hhaSeries;
  //final String hhaSet;
  //final String interact;
  //final String tag;
  //final String outdoor;
  //final String speakerType;
  //final String lightingType;
  final String catalog;
  final String filename;
  //final String variantId;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  PostersData(this.name, this.image, this.buy,
  this.sell, this.color1,this.color2,this.size, this.source, this.sourceNotes,this.version,
  this.catalog, this.filename, this.internalId, this.uniqueEntryId, this.collected);
}

class _FurnitureListPageState extends State<FurnitureList>{

  @override
  void initState(){
    super.initState();
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
  }

  Future<List<HousewaresData>> getHousewaresData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/housewares.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<HousewaresData> housewaresData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("furnitureCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        HousewaresData housewaresDatum = HousewaresData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"], collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            housewaresData.add(housewaresDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            housewaresData.add(housewaresDatum);
          } else if (u["Tag"].toLowerCase().contains(search.toLowerCase())){
            housewaresData.add(housewaresDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return housewaresData;
  }

  Future<List<MiscellaneousData>> getMiscellaneousData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/miscellaneous.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<MiscellaneousData> miscellaneousData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("furnitureCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        MiscellaneousData miscellaneousDatum = MiscellaneousData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"], collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            miscellaneousData.add(miscellaneousDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            miscellaneousData.add(miscellaneousDatum);
          } else if (u["Tag"].toLowerCase().contains(search.toLowerCase())){
            miscellaneousData.add(miscellaneousDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return miscellaneousData;
  }

  Future<List<WallmountedData>> getWallmountedData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/wallmounted.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<WallmountedData> wallmountedData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("furnitureCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        WallmountedData wallmountedDatum = WallmountedData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"], collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            wallmountedData.add(wallmountedDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            wallmountedData.add(wallmountedDatum);
          } else if (u["Tag"].toLowerCase().contains(search.toLowerCase())){
            wallmountedData.add(wallmountedDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return wallmountedData;
  }
  
  Future<List<PhotosData>> getPhotosData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/photos.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<PhotosData> photosData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("furnitureCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        PhotosData photosDatum = PhotosData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Source"],u["Version"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"], collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            photosData.add(photosDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            photosData.add(photosDatum);
          } 
        }
        previousName = u["Name"];
      });
    }
    return photosData;
  }

  Future<List<PostersData>> getPostersData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/posters.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<PostersData> postersData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("furnitureCheckList"+u["Name"], false).then((indexResult){
        collected = indexResult;
        PostersData postersDatum = PostersData(u["Name"],u["Image"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Source"],u["Source Notes"],u["Version"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            postersData.add(postersDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            postersData.add(postersDatum);
          } 
        }
        previousName = u["Name"];
      });
    }
    return postersData;
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
              future: Future.wait([getHousewaresData(searchFurniture),getMiscellaneousData(searchFurniture),getWallmountedData(searchFurniture),getPhotosData(searchFurniture),getPostersData(searchFurniture)]),
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].image,snapshot.data[0][index].source,snapshot.data[0][index].variation,snapshot.data[0][index].collected);
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[1][index].name, snapshot.data[1][index].image,snapshot.data[1][index].source,snapshot.data[1][index].variation,snapshot.data[1][index].collected);
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[2][index].name, snapshot.data[2][index].image,snapshot.data[2][index].source,snapshot.data[2][index].variation,snapshot.data[2][index].collected);
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[3][index].name, snapshot.data[3][index].image,snapshot.data[3][index].source,snapshot.data[3][index].variation,snapshot.data[3][index].collected);
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
                          return furnitureContainer(percentScale, colorTextBlack, snapshot.data[4][index].name, snapshot.data[4][index].image,snapshot.data[4][index].source,"",snapshot.data[4][index].collected);
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
                      backgroundColor: Color(0xFF41D448),
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
                                                searchFurniture = string;
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

Widget furnitureContainer(double percentScale, Color colorTextBlack, String name, String imageLink, String source, String variation, bool collected){
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
                      saveBool("furnitureCheckList"+name+variation, false, collected);
                    });
                  },
                  onTap: (){
                    currentCollectedFurniture = collected;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Future<void> future = showModalBottomSheet(
                      //by setting this to true, we can avoid the half screen limit
                      isScrollControlled:true,
                      context: context, 
                      builder: (context){
                        return Container(
                          height: 450*percentScale,
                            child: Container(
                              //child: villagerPopUp(percentScale,currentCollectedFurniture,name, imageLink, species,  gender,  personality, birthday, catchphrase, style1, style2, color1, color2)
                          ),
                        );
                    });
                    future.then((void value)=> setState(() {
                      getStoredBool("furnitureCheckList"+name+variation, false).then((indexResult){
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
                        saveBool("furnitureCheckList"+name, false, collected);
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

