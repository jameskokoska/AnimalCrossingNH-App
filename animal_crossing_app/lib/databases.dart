import 'main.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'popupFunctions.dart';

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

  HousewaresData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId);
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

  MiscellaneousData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId);
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

  WallmountedData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId);
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
  String patternCustomize = "NA";
  final String kitCost;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  String milesPrice = "NA";
  final String source;
  final String version;
  String hhaConcept1 = "NA";
  String hhaConcept2 = "NA";
  String hhaSeries = "NA";
  String hhaSet = "NA";
  String interact = "NA";
  String tag = "NA";
  String outdoor = "NA";
  String speakerType = "NA";
  String lightingType = "NA";
  final String catalog;
  final String filename;
  final String variantId;
  final String internalId;
  final String uniqueEntryId;

  PhotosData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId);
}

class PostersData{
  final String name;
  final String image;
  String variation = "NA";
  String bodyTitle = "NA";
  String pattern = "NA";
  String patternTitle = "NA";
  String diy = "NA";
  String bodyCustomize = "NA"; //"Customize"
  String patternCustomize = "NA";
  String kitCost = "NA";
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  String milesPrice = "NA";
  final String source;
  final String sourceNotes;
  final String version;
  String hhaConcept1 = "NA";
  String hhaConcept2 = "NA";
  String hhaSeries = "NA";
  String hhaSet = "NA";
  String interact = "NA";
  String tag = "NA";
  String outdoor = "NA";
  String speakerType = "NA";
  String lightingType = "NA";
  final String catalog;
  final String filename;
  String variantId = "NA";
  final String internalId;
  final String uniqueEntryId;

  PostersData(this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.sourceNotes, this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId);
}


class HeadwearData{
  final String name;
  final String image;
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


  HeadwearData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class AccessoriesData{
  final String name;
  final String image;
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


  AccessoriesData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class TopsData{
  final String name;
  final String image;
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


  TopsData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}


class BottomsData{
  final String name;
  final String image;
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


  BottomsData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class SocksData{
  final String name;
  final String image;
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


  SocksData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class ShoesData{
  final String name;
  final String image;
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


  ShoesData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class UmbrellasData{
  final String name;
  final String image;
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


  UmbrellasData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.version,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class BagsData{
  final String name;
  final String image;
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


  BagsData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

class EmojiData{
  final String name;
  final String imageLink;
  final String source;

  EmojiData(this.name, this.imageLink, this.source);
}


class FishData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String shadow;
  final String totalCatchesToUnlock;
  final String rainSnow;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String color1;
  final String color2;
  final String size;
  final String lightingType;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final String catchphrase;
  final String museum;
  final bool caught;

  FishData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.shadow,this.totalCatchesToUnlock,this.rainSnow,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.color1,this.color2,this.size,this.lightingType,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);
  
}


class BugData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String weather;
  final String totalCatchesToUnlock;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String color1;
  final String color2;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final String catchphrase;
  final String museum;
  final bool caught;

  BugData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.weather,this.totalCatchesToUnlock,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.color1,this.color2,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);
  
}


class RugsData{
  final String name;
  final String image;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String tag;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;


  RugsData(this.name, this.image,this.diy,this.buy,this.sell,this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.sourceNotes,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.tag,this.catalog,this.filename,this.internalId,this.uniqueEntryId);
}

class FloorsData{
  final String name;
  final String image;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String tag;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;


  FloorsData(this.name, this.image,this.diy,this.buy,this.sell,this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.sourceNotes,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.tag,this.catalog,this.filename,this.internalId,this.uniqueEntryId);
}

class WallpapersData{
  final String name;
  final String image;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String milesPrice;
  final String source;
  final String sourceNotes;
  final String version;
  final String hhaConcept1;
  final String hhaConcept2;
  final String hhaSeries;
  final String tag;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;


  WallpapersData(this.name, this.image,this.diy,this.buy,this.sell,this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.sourceNotes,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.tag,this.catalog,this.filename,this.internalId,this.uniqueEntryId);
}


class ToolsData{
  final String name;
  final String image;
  final String variation;
  final String bodyTitle;
  final String diy;
  final String customize;
  final String kitCost;
  final String uses;
  final String stackSize;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String set;
  final String milesPrice;
  final String source;
  final String version;
  final String filename;
  final String variantID;
  final String internalID;
  final String uniqueEntryID;


  ToolsData(this.name,this.image,this.variation,this.bodyTitle,this.diy,this.customize,this.kitCost,this.uses,this.stackSize,this.buy,this.sell,
  this.color1,this.color2,this.size,this.set,this.milesPrice,this.source,this.version,this.filename,this.variantID,this.internalID,this.uniqueEntryID);
}


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
  final String favoriteSaying;
  final String hobby;

  VillagerData(this.name,this.image,this.species,this.gender,this.personality,this.birthday,this.catchphrase,this.style1,this.style2,
  this.color1,this.color2,this.filename,this.uniqueEntryID, this.favoriteSaying, this.hobby);
}

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
  final String buyerTip;
  final String identification;

  ArtData(this.name,this.image,this.genuine,this.category,this.buy,this.sell,this.color1,this.color2,this.size,this.realArtworkTitle,this.artist,this.museumDescription,this.source,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.hhaSet,this.interact,this.tag,this.speakerType,this.lightingType,this.catalog,this.filename,this.internalID,this.uniqueEntryID,this.buyerTip,this.identification);

}

Future<List<HousewaresData>> getHousewaresData(String search) async{
  String data = await rootBundle.loadString("assets/housewares.json");

  final jsonData = json.decode(data);
  List<HousewaresData> housewaresData = [];
  String previousName="";
  for(var u in jsonData){
      HousewaresData housewaresDatum = HousewaresData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"]);
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
  } 
  return housewaresData;
}

Future<List<MiscellaneousData>> getMiscellaneousData(String search) async{
  String data = await rootBundle.loadString("assets/miscellaneous.json");

  final jsonData = json.decode(data);
  
  List<MiscellaneousData> miscellaneousData = [];
  String previousName="";
  for(var u in jsonData){
    MiscellaneousData miscellaneousDatum = MiscellaneousData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"]);
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
  }
  return miscellaneousData;
}

Future<List<WallmountedData>> getWallmountedData(String search) async{
  String data = await rootBundle.loadString("assets/wall-mounted.json");

  final jsonData = json.decode(data);
  List<WallmountedData> wallmountedData = [];
  String previousName="";
  for(var u in jsonData){
    WallmountedData wallmountedDatum = WallmountedData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Body Customize"],u["Pattern Customize"],u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Outdoor"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"]);
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
  }
  return wallmountedData;
}

Future<List<PhotosData>> getPhotosData(String search) async{
  String data = await rootBundle.loadString("assets/photos.json");

  final jsonData = json.decode(data);
  List<PhotosData> photosData = [];
  String previousName="";
  for(var u in jsonData){
    PhotosData photosDatum = PhotosData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["Pattern"],u["Pattern Title"],u["DIY"],u["Customize"],"NA",u["Kit Cost"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],"NA",u["Source"],u["Version"],"NA","NA","NA","NA","NA","NA","NA","NA","NA",u["Catalog"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName||showListVariations==true){
      if(search == ''){
        photosData.add(photosDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        photosData.add(photosDatum);
      } 
    }
    previousName = u["Name"];
  }
  return photosData;
}

Future<List<PostersData>> getPostersData(String search) async{
  String data = await rootBundle.loadString("assets/posters.json");

  final jsonData = json.decode(data);
  List<PostersData> postersData = [];
  String previousName="";
  for(var u in jsonData){
    PostersData postersDatum = PostersData(u["Name"],u["Image"],"NA","NA","NA","NA","NA","NA","NA","NA",u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],"NA",u["Source"],u["Source Notes"],u["Version"],"NA","NA","NA","NA","NA","NA","NA","NA","NA",u["Catalog"],u["Filename"],"NA",u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName||showListVariations==true){
      if(search == ''){
        postersData.add(postersDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        postersData.add(postersDatum);
      } 
    }
    previousName = u["Name"];
  }
  return postersData;
}

Future<List<HeadwearData>> getHeadwearData(String search) async{
  String data = await rootBundle.loadString("assets/headwear.json");

  final jsonData = json.decode(data);
  List<HeadwearData> headwearData = [];
  String previousName="";
  for(var u in jsonData){
    HeadwearData headwearDatum = HeadwearData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
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
  }
  return headwearData;
}

Future<List<AccessoriesData>> getAccessoriesData(String search) async{
  String data = await rootBundle.loadString("assets/accessories.json");

  final jsonData = json.decode(data);
  List<AccessoriesData> accessoriesData = [];
  String previousName="";
  for(var u in jsonData){
    AccessoriesData accessoriesDatum = AccessoriesData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        accessoriesData.add(accessoriesDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        accessoriesData.add(accessoriesDatum);
      }
    }
    previousName = u["Name"];
  }
  return accessoriesData;
}

Future<List<TopsData>> getTopsData(String search) async{
  String data = await rootBundle.loadString("assets/tops.json");

  final jsonData = json.decode(data);
  List<TopsData> topsData = [];
  String previousName="";
  for(var u in jsonData){
    TopsData topsDatum = TopsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        topsData.add(topsDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        topsData.add(topsDatum);
      }
    }
    previousName = u["Name"];
  }
  return topsData;
}

Future<List<BottomsData>> getBottomsData(String search) async{
  String data = await rootBundle.loadString("assets/bottoms.json");

  final jsonData = json.decode(data);
  List<BottomsData> bottomsData = [];
  String previousName="";
  for(var u in jsonData){
    BottomsData bottomsDatum = BottomsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        bottomsData.add(bottomsDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        bottomsData.add(bottomsDatum);
      }
    }
    previousName = u["Name"];
  }
  return bottomsData;
}

Future<List<SocksData>> getSocksData(String search) async{
  String data = await rootBundle.loadString("assets/socks.json");

  final jsonData = json.decode(data);
  List<SocksData> socksData = [];
  String previousName="";
  for(var u in jsonData){
    SocksData socksDatum = SocksData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        socksData.add(socksDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        socksData.add(socksDatum);
      }
    }
    previousName = u["Name"];
  }
  return socksData;
}

Future<List<ShoesData>> getShoesData(String search) async{
  String data = await rootBundle.loadString("assets/shoes.json");

  final jsonData = json.decode(data);
  
  List<ShoesData> shoesData = [];
  String previousName="";
  for(var u in jsonData){
    ShoesData shoesDatum = ShoesData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        shoesData.add(shoesDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        shoesData.add(shoesDatum);
      }
    }
    previousName = u["Name"];
  }
  return shoesData;
}

Future<List<UmbrellasData>> getUmbrellasData(String search) async{
  String data = await rootBundle.loadString("assets/umbrellas.json");

  final jsonData = json.decode(data);
  List<UmbrellasData> umbrellasData = [];
  String previousName="";
  for(var u in jsonData){
    UmbrellasData umbrellasDatum = UmbrellasData(u["Name"],u["Closet Image"],u["Storage Image"],"",u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Version"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        umbrellasData.add(umbrellasDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        umbrellasData.add(umbrellasDatum);
      }
    }
    previousName = u["Name"];
  }
  return umbrellasData;
}

Future<List<BagsData>> getBagsData(String search) async{
  String data = await rootBundle.loadString("assets/bags.json");

  final jsonData = json.decode(data);
  List<BagsData> bagsData = [];
  String previousName="";
  for(var u in jsonData){
    BagsData bagsDatum = BagsData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Seasonal Availability"],u["Version"],u["Style"],u["Label Themes"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        bagsData.add(bagsDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        bagsData.add(bagsDatum);
      }
    }
    previousName = u["Name"];
  }
  return bagsData;
}
  
Future<List<EmojiData>> getEmojiData(String search) async{
  String data = await rootBundle.loadString("assets/reactions.json");

  final jsonData = json.decode(data);
  List<EmojiData> emojiData = [];
  for(var u in jsonData){
    EmojiData villagerDatum = EmojiData(u["Name"],u["Image"],u["Source"]);
    if(search == ''){
      emojiData.add(villagerDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      emojiData.add(villagerDatum);
    }
  }
  return emojiData;
}

Future<List<FishData>> getFishData(String search, [bool active=false]) async{
  String data = await rootBundle.loadString("assets/fish.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<FishData> fishData = [];
  for(var u in jsonData){
    await getStoredBool("fishCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      FishData fishDatum = FishData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Shadow"],u["Total Catches to Unlock"],u["Rain/Snow Catch Up"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Size"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catch phrase"],u["Museum"],caught);
      if(active == true && (determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])=="All day" || determineActiveNow(determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])) == true)) {
        fishData.add(fishDatum);
      } else if (active == true){
        
      }else if(search == ''){
        fishData.add(fishDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        fishData.add(fishDatum);
      } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
        fishData.add(fishDatum);
      }
    });
  }
  return fishData;
}



Future<List<BugData>> getBugData(String search, [bool active = false]) async{
  String data = await rootBundle.loadString("assets/insects.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<BugData> bugData = [];
  for(var u in jsonData){
    await getStoredBool("bugCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      BugData bugDatum = BugData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Weather"],u["Total Catches to Unlock"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catch phrase"],u["Museum"],caught);
       if(active == true && (determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])=="All day" || determineActiveNow(determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])) == true)) {
        bugData.add(bugDatum);
      } else if (active == true){
        
      } else if(search == ''){
        bugData.add(bugDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        bugData.add(bugDatum);
      } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
        bugData.add(bugDatum);
      }
    });
  }
  return bugData;
}

Future<List<RugsData>> getRugsData(String search) async{
  String data = await rootBundle.loadString("assets/rugs.json");

  final jsonData = json.decode(data);
  List<RugsData> rugsData = [];
  for(var u in jsonData){
    RugsData rugsDatum = RugsData(u["Name"],u["Image"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["Tag"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(search == ''){
      rugsData.add(rugsDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      rugsData.add(rugsDatum);
    }
  }
  return rugsData;
}

Future<List<FloorsData>> getFloorsData(String search) async{
  String data = await rootBundle.loadString("assets/floors.json");

  final jsonData = json.decode(data);
  List<FloorsData> floorsData = [];
  for(var u in jsonData){
    FloorsData floorsDatum = FloorsData(u["Name"],u["Image"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["Tag"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(search == ''){
      floorsData.add(floorsDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      floorsData.add(floorsDatum);
    }
  }
  return floorsData;
}

Future<List<WallpapersData>> getWallpapersData(String search) async{
  String data = await rootBundle.loadString("assets/wallpaper.json");

  final jsonData = json.decode(data);
  List<WallpapersData> wallpapersData = [];
  for(var u in jsonData){
    WallpapersData wallpapersDatum = WallpapersData(u["Name"],u["Image"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],u["Source Notes"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["Tag"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(search == ''){
      wallpapersData.add(wallpapersDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      wallpapersData.add(wallpapersDatum);
    }
  }
  return wallpapersData;
}

Future<List<ToolsData>> getToolsData(String search) async{
  String data = await rootBundle.loadString("assets/tools.json");

  final jsonData = json.decode(data);
  
  List<ToolsData> toolsData = [];
  String previousName="";
  for(var u in jsonData){
    ToolsData toolsDatum = ToolsData(u["Name"],u["Image"],u["Variation"],u["Body Title"],u["DIY"],u["Customize"],u["Kit Cost"],u["Uses"],u["Stack Size"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Set"],u["Miles Price"],u["Source"],u["Version"],u["Filename"],u["Variant ID"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName||showListVariations==true){
      if(search == ''){
        toolsData.add(toolsDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        toolsData.add(toolsDatum);
      }
    }
    previousName = u["Name"];    
  }
  return toolsData;
}

Future<List<VillagerData>> getVillagerData(String search) async{
  String data = await rootBundle.loadString("assets/villagers.json");

  final jsonData = json.decode(data);
  List<VillagerData> villagerData = [];
  for(var u in jsonData){
    VillagerData villagerDatum = VillagerData(u["Name"],u["Icon Image"],u["Species"],u["Gender"],u["Personality"],u["Birthday"],u["Catchphrase"],u["Style 1"],u["Style 2"],u["Color 1"],u["Color 2"],u["Filename"],u["Unique Entry ID"], u["Favorite Saying"], u["Hobby"]);
    if(search == ''){
      villagerData.add(villagerDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      villagerData.add(villagerDatum);
    }
  }
  return villagerData;
}

Future<List<ArtData>> getArtData(String search) async{
  String data = await rootBundle.loadString("assets/art.json");

  final jsonData = json.decode(data);
  List<ArtData> artData = [];
  String previousName="";
  for(var u in jsonData){
    ArtData artDatum = ArtData(u["Name"],u["Image"],u["Genuine"],u["Category"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Real Artwork Title"],u["Artist"],u["Museum Description"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"],u["Buyer Tip"],u["Identification"]);
    if(u["Name"]!=previousName){
      if(search == ''){
        if(u["Name"]!=previousName)
          artData.add(artDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        artData.add(artDatum);
      }
    }
    previousName = u["Name"];
  }
  return artData;
}

class FossilData{
  final String name;
  final String image;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  final String source;
  final String museum;
  final String version;
  final String interact;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;
  final bool collected;

  FossilData(this.name, this.image, this.buy,this.sell,this.color1,this.color2,this.size,this.source,
  this.museum, this.version, this.interact, this.catalog,this.filename, this.internalId, this.uniqueEntryId, this.collected);
}

Future<List<FossilData>> getFossilData(String search) async{
  String data = await rootBundle.loadString("assets/fossils.json");

  final jsonData = json.decode(data);
  bool collected = false;
  List<FossilData> fossilData = [];
  String previousName="";
  for(var u in jsonData){
    await getStoredBool("fossilCheckList"+u["Name"], false).then((indexResult){
      collected = indexResult;
      FossilData fossilDatum = FossilData(u["Name"],u["Image"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Source"],u["Museum"],u["Version"],u["Interact"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"], collected);
      if(u["Name"]!=previousName){
        if(search == ''){
          if(u["Name"]!=previousName)
            fossilData.add(fossilDatum);
        } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
          fossilData.add(fossilDatum);
        }
      }
      previousName = u["Name"];
    });
  }
  return fossilData;
}

class CraftableData{
  final String craftableGroup;
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
  final String storageImage;//
  final String sourceNotes;//
  final String seasonalAvailability;//
  final String mannequinPiece;//
  final String style;//
  final String labelThemes;//
  final String type;//
  final String villagerEquippable;//
  final String customize;//tools
  final String uses;//tools
  final String stackSize;//tools
  final String set;//tools

  CraftableData({this.craftableGroup, this.name, this.image, this.variation, this.bodyTitle, this.pattern, this.patternTitle,this.diy,this.bodyCustomize,this.patternCustomize, this.kitCost, this.buy,
  this.sell, this.color1,this.color2,this.size,this.milesPrice, this.source,this.version, this.hhaConcept1, this.hhaConcept2, this. hhaSeries, this.hhaSet, this.interact, this.tag, this.outdoor,
  this.speakerType, this.lightingType, this.catalog, this.filename, this.variantId, this.internalId, this.uniqueEntryId, this.storageImage, this.sourceNotes, this.seasonalAvailability, this.mannequinPiece, 
  this.style, this.labelThemes, this.type, this.villagerEquippable,this.customize,this.uses,this.stackSize,this.set});
}

Future<List<CraftableData>> getCraftableData(String search) async{
  String dataHousewares = await rootBundle.loadString("assets/housewares.json");
  final jsonDataHousewares = json.decode(dataHousewares);

  String dataMiscellaneous = await rootBundle.loadString("assets/miscellaneous.json");
  final jsonDataMiscellaneous = json.decode(dataMiscellaneous);

  String dataWallmounted = await rootBundle.loadString("assets/wall-mounted.json");
  final jsonDataWallmounted = json.decode(dataWallmounted);

  String dataHeadwear = await rootBundle.loadString("assets/headwear.json");
  final jsonDataHeadwear = json.decode(dataHeadwear);

  String dataAccessories = await rootBundle.loadString("assets/accessories.json");
  final jsonDataAccessories = json.decode(dataAccessories);

  String dataTops = await rootBundle.loadString("assets/tops.json");
  final jsonDataTops = json.decode(dataTops);

  String dataBottoms = await rootBundle.loadString("assets/bottoms.json");
  final jsonDataBottoms = json.decode(dataBottoms);

  String dataSocks = await rootBundle.loadString("assets/socks.json");
  final jsonDataSocks = json.decode(dataSocks);

  String dataShoes = await rootBundle.loadString("assets/shoes.json");
  final jsonDataShoes = json.decode(dataShoes);

  String dataUmbrellas = await rootBundle.loadString("assets/umbrellas.json");
  final jsonDataUmbrellas = json.decode(dataUmbrellas);

  String dataBags = await rootBundle.loadString("assets/bags.json");
  final jsonDataBags = json.decode(dataBags);

  String dataRugs = await rootBundle.loadString("assets/rugs.json");
  final jsonDataRugs = json.decode(dataRugs);

  String dataFloors = await rootBundle.loadString("assets/floors.json");
  final jsonDataFloors = json.decode(dataFloors);

  String dataWallpapers = await rootBundle.loadString("assets/wallpaper.json");
  final jsonDataWallpapers = json.decode(dataWallpapers);

  String dataTools = await rootBundle.loadString("assets/tools.json");
  final jsonDataTools = json.decode(dataTools);

  String dataFence = await rootBundle.loadString("assets/fencing.json");
  final jsonDataFence = json.decode(dataFence);


  List<CraftableData> craftableData = [];

  String previousName="";
  for(var u in jsonDataHousewares){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Furniture",
      name: u["Name"],
      image:u["Image"],
      variation:u["Variation"],
      bodyTitle:u["Body Title"],
      pattern:u["Pattern"],
      patternTitle: u["Pattern Title"],
      diy: u["DIY"],
      bodyCustomize: u["Body Customize"],
      patternCustomize: u["Pattern Customize"],
      kitCost: u["Kit Cost"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1: u["Color 1"],
      color2: u["Color 2"],
      size: u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      version: u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      hhaSet: u["HHA Set"],
      interact: u["Interact"],
      tag: u["Tag"],
      outdoor: u["Outdoor"],
      speakerType: u["Speaker Type"],
      lightingType: u["Lighting Type"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      variantId: u["Variant ID"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataMiscellaneous){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Furniture",
      name: u["Name"],
      image:u["Image"],
      variation:u["Variation"],
      bodyTitle:u["Body Title"],
      pattern:u["Pattern"],
      patternTitle: u["Pattern Title"],
      diy: u["DIY"],
      bodyCustomize: u["Body Customize"],
      patternCustomize: u["Pattern Customize"],
      kitCost: u["Kit Cost"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1: u["Color 1"],
      color2: u["Color 2"],
      size: u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      version: u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      hhaSet: u["HHA Set"],
      interact: u["Interact"],
      tag: u["Tag"],
      outdoor: u["Outdoor"],
      speakerType: u["Speaker Type"],
      lightingType: u["Lighting Type"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      variantId: u["Variant ID"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]);
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataWallmounted){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Furniture",
      name: u["Name"],
      image:u["Image"],
      variation:u["Variation"],
      bodyTitle:u["Body Title"],
      pattern:u["Pattern"],
      patternTitle: u["Pattern Title"],
      diy: u["DIY"],
      bodyCustomize: u["Body Customize"],
      patternCustomize: u["Pattern Customize"],
      kitCost: u["Kit Cost"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1: u["Color 1"],
      color2: u["Color 2"],
      size: u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      version: u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      hhaSet: u["HHA Set"],
      interact: u["Interact"],
      tag: u["Tag"],
      outdoor: u["Outdoor"],
      speakerType: u["Speaker Type"],
      lightingType: u["Lighting Type"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      variantId: u["Variant ID"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataHeadwear){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataAccessories){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataTops){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      //sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataBottoms){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      //sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataSocks){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      //sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataShoes){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataUmbrellas){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      //sourceNotes: u["Source Notes"],
      //seasonalAvailability: u["Seasonal Availability"],
      //mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      //style: u["Style"],
      //labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataBags){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Clothing",
      name:u["Name"],
      image:u["Closet Image"],
      storageImage: u["Storage Image"],
      variation: u["Variation"],
      diy: u["DIY"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice: u["Miles Price"],
      source: u["Source"],
      //sourceNotes: u["Source Notes"],
      seasonalAvailability: u["Seasonal Availability"],
      //mannequinPiece: u["Mannequin Piece"],
      version: u["Version"],
      style: u["Style"],
      labelThemes: u["Label Themes"],
      //type: u["Type"],
      villagerEquippable: u["Villager Equippable"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataRugs){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Floor & Wall",
      name:u["Name"],
      image:u["Image"],
      diy:u["DIY"],
      buy:u["Buy"],
      sell:u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice:u["Miles Price"],
      source:u["Source"],
      sourceNotes:u["Source Notes"],
      version:u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      tag: u["Tag"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataFloors){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Floor & Wall",
      name:u["Name"],
      image:u["Image"],
      diy:u["DIY"],
      buy:u["Buy"],
      sell:u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice:u["Miles Price"],
      source:u["Source"],
      sourceNotes:u["Source Notes"],
      version:u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      tag: u["Tag"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataWallpapers){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Floor & Wall",
      name:u["Name"],
      image:u["Image"],
      diy:u["DIY"],
      buy:u["Buy"],
      sell:u["Sell"],
      color1:u["Color 1"],
      color2:u["Color 2"],
      size:u["Size"],
      milesPrice:u["Miles Price"],
      source:u["Source"],
      sourceNotes:u["Source Notes"],
      version:u["Version"],
      hhaConcept1: u["HHA Concept 1"],
      hhaConcept2: u["HHA Concept 2"],
      hhaSeries: u["HHA Series"],
      tag: u["Tag"],
      catalog: u["Catalog"],
      filename: u["Filename"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataTools){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Tools",
      name:u["Name"],
      image: u["Image"],
      variation:u["Variation"],
      bodyTitle:u["Body Title"],
      diy:u["DIY"],
      customize:u["Customize"],
      kitCost:u["Kit Cost"],
      uses:u["Uses"],
      stackSize: u["Stack Size"],
      buy: u["Buy"],
      sell: u["Sell"],
      color1: u["Color 1"],
      color2: u["Color 2"],
      size:u["Size"],
      set:u["Set"],
      milesPrice: u["Miles Price"],
      source:u["Source"],
      version:u["Version"],
      filename: u["Filename"],
      variantId: u["Variant ID"],
      internalId: u["Internal ID"],
      uniqueEntryId: u["Unique Entry ID"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  previousName="";
  for(var u in jsonDataFence){
    CraftableData craftableDatum = CraftableData(
      craftableGroup:"Fence",
      name:u["Name"],
      image:u["Image"],
      buy: u["Buy"],
      sell: u["Sell"],
      source: u["Source"]
    );
    if(u["Name"]!=previousName){
      if(search == '' && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase()) && u["Source"]!=null && u["Source"].toLowerCase().contains("crafting")){
        craftableData.add(craftableDatum);
      }
    }
    previousName = u["Name"];
  }

  return craftableData;
}

class RecipeData{
  final String name;
  final String number1;
  final String material1;
  final String number2;
  final String material2;
  final String number3;
  final String material3;
  final String number4;
  final String material4;
  final String number5;
  final String material5;
  final String number6;
  final String material6;
  final String sources;
  final String sourceNotes;
  final String category;
  final String uniqueEntryId;

  RecipeData(this.name, this.number1, this.material1,this.number2,this.material2,this.number3,this.material3,
  this.number4,this.material4,this.number5,this.material5,this.number6,this.material6,this.sources,this.sourceNotes,this.category,this.uniqueEntryId);
}

Future<RecipeData> getRecipeData(String search) async{
  String data = await rootBundle.loadString("assets/recipes.json");

  final jsonData = json.decode(data);
  for(var u in jsonData){
    //print(u["Name"]);
    RecipeData recipeDatum = RecipeData(u["Name"],u["#1"],u["Material 1"],u["#2"],u["Material 2"],u["#3"],u["Material 3"],u["#4"],u["Material 4"],u["#5"],u["Material 5"],u["#6"],u["Material 6"],u["Source"],u["Source Notes"],u["Category"],u["Unique Entry ID"]);
    if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      return recipeDatum;
    }
  }
  return null;
}

class OtherData{
  final String name;
  final String image;

  OtherData(this.name, this.image);
}

Future<OtherData> getOtherData(String search) async{
  String data = await rootBundle.loadString("assets/other.json");

  final jsonData = json.decode(data);
  for(var u in jsonData){
    OtherData otherDatum = OtherData(u["Name"],u["Inventory Image"]);
    if (u["Name"]!=null&&search!=null&&u["Name"].toLowerCase().contains(search.toLowerCase())){
      return otherDatum;
    }
  }
  return null;
}

class EventData{
  final String name;
  final String month;
  final String dayStart;
  final String dayEnd;
  final String specialDay;
  final String specialOccurence;
  final String hemisphere;
  final String time;
  final String image;

  EventData(this.name, this.month, this.dayStart,this.dayEnd,this.specialDay,this.specialOccurence, this.hemisphere,this.time, this.image);
}


Future<List<EventData>> getEventsData() async{
  String data = await rootBundle.loadString("assets/events.json");

  final jsonData = json.decode(data);
  List<EventData> eventData = [];
  bool favourite;
  for(var u in jsonData){
    if(u["Name"].contains("Birthday")){
      await getStoredBool("villagerCheckList"+u["Name"].substring(0, u["Name"].indexOf("'")), false).then((indexResult){
        favourite = indexResult;
        if(favourite){
          EventData eventDatum = EventData(u["Name"],u["Month"],u["Day Start"],u["Day End"],u["Special Day"],u["Special Occurrence"],u["Hemisphere"],u["Time"],u["Image"]);
          eventData.add(eventDatum);
        }
      });
    } else {
      EventData eventDatum = EventData(u["Name"],u["Month"],u["Day Start"],u["Day End"],u["Special Day"],u["Special Occurrence"],u["Hemisphere"],u["Time"],u["Image"]);
      eventData.add(eventDatum);
    }
    
  }
  return eventData;
}
class SeaData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String shadow;
  final String movementSpeed;
  final String totalCatchesToUnlock;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String size;
  final String surface;
  final String catchPhrase;
  final String hhaBasePoints;
  final String color1;
  final String color2;
  final String lightingType;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final bool caught;

  SeaData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.shadow,this.movementSpeed, this.totalCatchesToUnlock,
  this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
  this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
  this.size, this.surface, this.catchPhrase, this.hhaBasePoints, this.color1,this.color2,this.lightingType,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.caught);
  
}

Future<List<SeaData>> getSeaData(String search, [bool active = false]) async{
  String data = await rootBundle.loadString("assets/seacreatures.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<SeaData> seaData = [];
  for(var u in jsonData){
    await getStoredBool("seaCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      SeaData seaDatum = SeaData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Shadow"],u["Movement Speed"],u["Total Catches to Unlock"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Size"],u["Surface"],u["Catch phrase"],u["HHA Base Points"],u["Color 1"],u["Color 2"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],caught);
      if(active == true && (determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])=="All day" || determineActiveNow(determineTime(u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"])) == true)) {
        seaData.add(seaDatum);
      } else if (active == true){
        
      } else if(search == ''){
        seaData.add(seaDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        seaData.add(seaDatum);
      }
    });
  }
  return seaData;
}

class DressupData{
  final String name;
  final String image;
  final String storageImage;
  final String variation;
  final String diy;
  final String buy;
  final String sell;
  final String color1;
  final String color2;
  final String size;
  String milesPrice ="NA";
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


  DressupData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

Future<List<DressupData>> getDressupData(String search) async{
  String data = await rootBundle.loadString("assets/dress-up.json");

  final jsonData = json.decode(data);
  List<DressupData> dressupData = [];
  String previousName="";
  
  for(var u in jsonData){
    DressupData dressupDatum = DressupData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],"NA",u["Source"],u["Source Notes"],u["Seasonal Availability"],u["Mannequin Piece"],"NA",u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName||showListVariations==true){
      if(search == ''){
        dressupData.add(dressupDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        dressupData.add(dressupDatum);
      } else if (u["Style"].toLowerCase().contains(search.toLowerCase())){
        dressupData.add(dressupDatum);
      }
    }
    previousName = u["Name"];
  }
  return dressupData;
}

class WetsuitData{
  final String name;
  final String image;
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
  String sourceNotes = "NA";
  final String seasonalAvailability;
  final String mannequinPiece;
  String version = "NA";
  final String style;
  final String labelThemes;
  final String type;
  final String villagerEquippable;
  final String catalog;
  final String filename;
  final String internalId;
  final String uniqueEntryId;


  WetsuitData(this.name, this.image,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
}

Future<List<WetsuitData>> getWetsuitData(String search) async{
  String data = await rootBundle.loadString("assets/clothingother.json");

  final jsonData = json.decode(data);
  List<WetsuitData> wetsuitData = [];
  String previousName="";
  for(var u in jsonData){
    WetsuitData wetsuitDatum = WetsuitData(u["Name"],u["Closet Image"],u["Storage Image"],u["Variation"],u["DIY"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Miles Price"],u["Source"],"NA",u["Seasonal Availability"],u["Mannequin Piece"],"NA",u["Style"],u["Label Themes"],u["Type"],u["Villager Equippable"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
    if(u["Name"]!=previousName||showListVariations==true){
      if(search == ''){
        wetsuitData.add(wetsuitDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        wetsuitData.add(wetsuitDatum);
      } else if (u["Style"].toLowerCase().contains(search.toLowerCase())){
        wetsuitData.add(wetsuitDatum);
      }
    }
    previousName = u["Name"];
  }
  return wetsuitData;
}

bool determineActiveNow(String time){
  final now = DateTime.now();
  if(time=="All day")
    return true;
  else if (time=="NA")
    return false;
  else if(time.substring(time.length-2,time.length)=="PM"){
    if(now.hour<int.parse(time.substring(time.length-5,time.length-3))+12 && now.hour>=int.parse(time.substring(0,2)))
      return true;
  } else if(time.substring(time.length-2,time.length)=="AM"){
    if(now.hour<int.parse(time.substring(time.length-5,time.length-3)) || now.hour>=int.parse(time.substring(0,2))+12)
      return true;
  }
    return false;
}

class FenceData{
  final String name;
  final String image;
  final String sell;
  final String buy;

  FenceData(this.name,this.image,this.sell, this.buy);
}

Future<List<FenceData>> getFenceData(String search) async{
  String data = await rootBundle.loadString("assets/fencing.json");

  final jsonData = json.decode(data);
  List<FenceData> fenceData = [];
  for(var u in jsonData){
    FenceData fenceDatum = FenceData(u["Name"],u["Image"],u["Sell"],u["Buy"]);
    if(search == ''){
      fenceData.add(fenceDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      fenceData.add(fenceDatum);
    }
  }
  return fenceData;
}

class ConstructionData{
  final String name;
  final String image;
  final String buy;
  final String category;

  ConstructionData(this.name,this.image,this.buy,this.category);
}

Future<List<ConstructionData>> getConstructionData(String search) async{
  String data = await rootBundle.loadString("assets/construction.json");

  final jsonData = json.decode(data);
  List<ConstructionData> constructionData = [];
  for(var u in jsonData){
    ConstructionData constructionDatum = ConstructionData(u["Name"],u["Image"],u["Buy"],u["Vategory"]);
    if(search == ''){
      constructionData.add(constructionDatum);
    } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
      constructionData.add(constructionDatum);
    }
  }
  return constructionData;
}