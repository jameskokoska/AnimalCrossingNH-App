import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:convert';
import 'clothingPopup.dart';


class ClothingList extends StatefulWidget {
  ClothingList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClothingListPageState createState() => _ClothingListPageState();
}

String searchClothing = '';


class HeadwearData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  HeadwearData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class AccessoriesData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  AccessoriesData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class TopsData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  //final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  TopsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}


class BottomsData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  //final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  BottomsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class SocksData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  //final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  SocksData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class ShoesData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String seasonalAvailability;
  final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  ShoesData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class UmbrellasData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  //final String sourceNotes;
  //final String seasonalAvailability;
  //final String mannequinPiece;
  final String version;
  //final String style;
  //final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  UmbrellasData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.version,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}

class BagsData{
  final String name;
  final String closetImage;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  //final String sourceNotes;
  final String seasonalAvailability;
  //final String mannequinPiece;
  final String version;
  final String style;
  final String labelThemes;
  //final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;


  BagsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId,this.collected);
}



class _ClothingListPageState extends State<ClothingList>{
  
  // ScrollController scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
    // scrollController.addListener(() {
    //   if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
    //     loadMoreElements();
    //   }
    // });
  }

  // loadMoreElements(){
  //   print("end");
  // }
  

  Future<List<HeadwearData>> getHeadwearData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/headwear.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<HeadwearData> headwearData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        HeadwearData headwearDatum = HeadwearData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName||showListVariations==true){
          if(search == ''){
            headwearData.add(headwearDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            headwearData.add(headwearDatum);
          } else if (u["Style"].toLowerCase().contains(search.toLowerCase())){
            headwearData.add(headwearDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return headwearData;
  }

  Future<List<AccessoriesData>> getAccessoriesData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/accessories.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<AccessoriesData> accessoriesData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        AccessoriesData accessoriesDatum = AccessoriesData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            accessoriesData.add(accessoriesDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            accessoriesData.add(accessoriesDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return accessoriesData;
  }

  Future<List<TopsData>> getTopsData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/tops.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<TopsData> topsData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        TopsData topsDatum = TopsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            topsData.add(topsDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            topsData.add(topsDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return topsData;
  }

  Future<List<BottomsData>> getBottomsData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/bottoms.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<BottomsData> bottomsData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        BottomsData bottomsDatum = BottomsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            bottomsData.add(bottomsDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            bottomsData.add(bottomsDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return bottomsData;
  }

  Future<List<SocksData>> getSocksData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/socks.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<SocksData> socksData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        SocksData socksDatum = SocksData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            socksData.add(socksDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            socksData.add(socksDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return socksData;
  }

  Future<List<ShoesData>> getShoesData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/shoes.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<ShoesData> shoesData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        ShoesData shoesDatum = ShoesData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            shoesData.add(shoesDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            shoesData.add(shoesDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return shoesData;
  }

  Future<List<UmbrellasData>> getUmbrellasData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/umbrellas.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<UmbrellasData> umbrellasData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+"", false).then((indexResult){
        collected = indexResult;
        UmbrellasData umbrellasDatum = UmbrellasData(u["Name"],u["Closet Image"],u["Storage Image"],"",u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            umbrellasData.add(umbrellasDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            umbrellasData.add(umbrellasDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return umbrellasData;
  }

  Future<List<BagsData>> getBagsData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/bags.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<BagsData> bagsData = [];
    String previousName="";
    for(var u in jsonData){
      getStoredBool("clothingCheckList"+u["Name"]+u["Variation"], false).then((indexResult){
        collected = indexResult;
        BagsData bagsDatum = BagsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],collected);
        if(u["Name"]!=previousName){
          if(search == ''){
            bagsData.add(bagsDatum);
          } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
            bagsData.add(bagsDatum);
          }
        }
        previousName = u["Name"];
      });
    }
    return bagsData;
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
              future: Future.wait([getHeadwearData(searchClothing), getAccessoriesData(searchClothing),getTopsData(searchClothing),getBottomsData(searchClothing),getSocksData(searchClothing),getShoesData(searchClothing),getUmbrellasData(searchClothing),getBagsData(searchClothing)]),
              builder: (context,snapshot){
                Widget headwearListSliver;
                Widget accessoriesListSliver;
                Widget topsListSliver;
                Widget bottomsListSliver;
                Widget socksListSliver;
                Widget shoesListSliver;
                Widget umbrellasListSliver;
                Widget bagsListSliver;
                if(snapshot.hasData){
                  headwearListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[0][index].name, snapshot.data[0][index].closetImage,snapshot.data[0][index].source,snapshot.data[0][index].variation,snapshot.data[0][index].collected);
                        },
                        childCount: snapshot.data[0].length,
                      ),
                    ),
                  );
                  accessoriesListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[1][index].name, snapshot.data[1][index].closetImage,snapshot.data[1][index].source,snapshot.data[1][index].variation,snapshot.data[1][index].collected);
                        },
                        childCount: snapshot.data[1].length,
                      ),
                    ),
                  );
                  topsListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[2][index].name, snapshot.data[2][index].closetImage,snapshot.data[2][index].source,snapshot.data[2][index].variation,snapshot.data[2][index].collected);
                        },
                        childCount: snapshot.data[2].length,
                      ),
                    ),
                  );
                  bottomsListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[3][index].name, snapshot.data[3][index].closetImage,snapshot.data[3][index].source,snapshot.data[3][index].variation,snapshot.data[3][index].collected);
                        },
                        childCount: snapshot.data[3].length,
                      ),
                    ),
                  );
                  socksListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[4][index].name, snapshot.data[4][index].closetImage,snapshot.data[4][index].source,snapshot.data[4][index].variation,snapshot.data[4][index].collected);
                        },
                        childCount: snapshot.data[4].length,
                      ),
                    ),
                  );
                  shoesListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[5][index].name, snapshot.data[5][index].closetImage,snapshot.data[5][index].source,snapshot.data[5][index].variation,snapshot.data[5][index].collected);
                        },
                        childCount: snapshot.data[5].length,
                      ),
                    ),
                  );
                  umbrellasListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[6][index].name, snapshot.data[6][index].closetImage,snapshot.data[6][index].source,snapshot.data[6][index].variation,snapshot.data[6][index].collected);
                        },
                        childCount: snapshot.data[6].length,
                      ),
                    ),
                  );
                  bagsListSliver = SliverPadding(
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
                          return clothingContainer(percentScale, colorTextBlack, snapshot.data[7][index].name, snapshot.data[7][index].closetImage,snapshot.data[7][index].source,snapshot.data[7][index].variation,snapshot.data[7][index].collected);
                        },
                        childCount: snapshot.data[7].length,
                      ),
                    ),
                  );
                } else {
                  headwearListSliver = SliverToBoxAdapter(
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
                  accessoriesListSliver = SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  topsListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  bottomsListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  socksListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  shoesListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  topsListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  umbrellasListSliver= SliverToBoxAdapter(
                    child: Container(
                    )
                  );
                  bagsListSliver= SliverToBoxAdapter(
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
                      backgroundColor: Color(0xFF3A15C0),
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
                              child: Text("Clothing",
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
                                              searchClothing='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchClothing==''){
                                                  return 'Search';
                                                } else {
                                                  return searchClothing;
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
                                                searchClothing = string;
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
                    
                    headwearListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    accessoriesListSliver,
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                        color: Colors.black,
                      )
                    ),
                    topsListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                    bottomsListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                    socksListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                    shoesListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                    umbrellasListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                    bagsListSliver,
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

Widget clothingContainer(double percentScale, Color colorTextBlack, String name, String imageLink, String source, String variation, bool collected){
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
                      saveBool("clothingCheckList"+name+variation, false, collected);
                    });
                  },
                  onTap: (){
                    currentCollectedClothing = collected;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Future<void> future = showModalBottomSheet(
                      //by setting this to true, we can avoid the half screen limit
                      isScrollControlled:true,
                      context: context, 
                      builder: (context){
                        return Container(
                          height: 450*percentScale,
                            child: Container(
                              //child: villagerPopUp(percentScale,currentCollectedClothing,name, imageLink, species,  gender,  personality, birthday, catchphrase, style1, style2, color1, color2)
                          ),
                        );
                    });
                    future.then((void value)=> setState(() {
                      getStoredBool("clothingCheckList"+name+variation, false).then((indexResult){
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
                        saveBool("clothingCheckList"+name, false, collected);
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

