import 'main.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

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


  HeadwearData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  AccessoriesData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.type,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  TopsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  BottomsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  SocksData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  ShoesData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,this.sourceNotes,this.seasonalAvailability,this.mannequinPiece,
  this.version,this.style,this.labelThemes,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  UmbrellasData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
  this.color1,this.color2,this.size,this.milesPrice,this.source,
  this.version,this.villagerEquippable,this.catalog,this.filename,this.internalId,
  this.uniqueEntryId);
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


  BagsData(this.name, this.closetImage,this.storageImage,this.variation,this.diy,this.buy,this.sell,
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

  VillagerData(this.name,this.image,this.species,this.gender,this.personality,this.birthday,this.catchphrase,this.style1,this.style2,
  this.color1,this.color2,this.filename,this.uniqueEntryID);
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

  ArtData(this.name,this.image,this.genuine,this.category,this.buy,this.sell,this.color1,this.color2,this.size,this.realArtworkTitle,this.artist,this.museumDescription,this.source,this.version,this.hhaConcept1,this.hhaConcept2,this.hhaSeries,this.hhaSet,this.interact,this.tag,this.speakerType,this.lightingType,this.catalog,this.filename,this.internalID,this.uniqueEntryID);

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
  String data = await rootBundle.loadString("assets/wallmounted.json");

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
  String data = await rootBundle.loadString("assets/emojis.json");

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

Future<List<FishData>> getFishData(String search) async{
  String data = await rootBundle.loadString("assets/fish.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<FishData> fishData = [];
  for(var u in jsonData){
    getStoredBool("fishCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      FishData fishDatum = FishData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Shadow"],u["Total Catches to Unlock"],u["Rain/Snow Catch Up"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Size"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
      if(search == ''){
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

Future<List<BugData>> getBugData(String search) async{
  String data = await rootBundle.loadString("assets/bug.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<BugData> bugData = [];
  for(var u in jsonData){
    getStoredBool("bugCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      BugData bugDatum = BugData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Weather"],u["Total Catches to Unlock"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
      if(search == ''){
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
  String data = await rootBundle.loadString("assets/flooring.json");

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
  bool favorite = false;
  List<VillagerData> villagerData = [];
  for(var u in jsonData){
    VillagerData villagerDatum = VillagerData(u["Name"],u["Image"],u["Species"],u["Gender"],u["Personality"],u["Birthday"],u["Catchphrase"],u["Style 1"],u["Style 2"],u["Color 1"],u["Color 2"],u["Filename"],u["Unique Entry ID"]);
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
    ArtData artDatum = ArtData(u["Name"],u["Image"],u["Genuine"],u["Category"],u["Buy"],u["Sell"],u["Color 1"],u["Color 2"],u["Size"],u["Real Artwork Title"],u["Artist"],u["Museum Description"],u["Source"],u["Version"],u["HHA Concept 1"],u["HHA Concept 2"],u["HHA Series"],u["HHA Set"],u["Interact"],u["Tag"],u["Speaker Type"],u["Lighting Type"],u["Catalog"],u["Filename"],u["Internal ID"],u["Unique Entry ID"]);
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
  String data = await rootBundle.loadString("assets/fossil.json");

  final jsonData = json.decode(data);
  bool collected = false;
  List<FossilData> fossilData = [];
  String previousName="";
  for(var u in jsonData){
    getStoredBool("fossilCheckList"+u["Name"], false).then((indexResult){
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