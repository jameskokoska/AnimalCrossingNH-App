import 'main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';


final priceFormat = new NumberFormat("#,##0");

String determineTime(String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  if(northernHemisphere){
    if(currentDate.month==1){
      return nhJan;
    }else if (currentDate.month==2){
      return nhFeb;
    }else if (currentDate.month==3){
      return nhMar;
    }else if (currentDate.month==4){
      return nhApr;
    }else if (currentDate.month==5){
      return nhMay;
    }else if (currentDate.month==6){
      return nhJun;
    }else if (currentDate.month==7){
      return nhJul;
    }else if (currentDate.month==8){
      return nhAug;
    }else if (currentDate.month==9){
      return nhSep;
    }else if (currentDate.month==10){
      return nhOct;
    }else if (currentDate.month==11){
      return nhNov;
    }else{
      return nhDec;
    }
  }else{
    if(currentDate.month==1){
      return shJan;
    }else if (currentDate.month==2){
      return shFeb;
    }else if (currentDate.month==3){
      return shMar;
    }else if (currentDate.month==4){
      return shApr;
    }else if (currentDate.month==5){
      return shMay;
    }else if (currentDate.month==6){
      return shJun;
    }else if (currentDate.month==7){
      return shJul;
    }else if (currentDate.month==8){
      return shAug;
    }else if (currentDate.month==9){
      return shSep;
    }else if (currentDate.month==10){
      return shOct;
    }else if (currentDate.month==11){
      return shNov;
    }else{
      return shDec;
    }
  }
}

Widget infoContainer(double percentScale, String imageIcon, String displayString, [bool imageLink = false]){
  if(displayString=="NA")
    return Container();
  return Container(
    height: 45*percentScale,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: (){
            if(imageLink==false){
              return new Image.asset(
                'assets/'+imageIcon,
                height: 25*percentScale,
                width: 25*percentScale,
              );
            }else{
              return CachedNetworkImage(
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fadeInDuration: Duration(milliseconds:800),
                imageUrl: imageIcon,
                imageBuilder: (context, imageProvider) => Container(
                  width: 38*percentScale,
                  height: 38*percentScale,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4*percentScale),
                    image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                  ),
                )
              );
            }
          }()
        ),
        SizedBox(
          width: 5*percentScale,
        ),
        Container(
          child: new Text(displayString,
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              color: colorTextBlack,
              fontSize: 19*percentScale,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )
          ),
        ),
      ]
    )
  );
}

Widget infoContainerDoubleLined(double percentScale, String imageIcon, String displayString){
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Container(
      height: 45*percentScale,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: new Image.asset(
              'assets/'+imageIcon,
              height: 25*percentScale,
              width: 25*percentScale,
            ),
          ),
          SizedBox(
            width: 8*percentScale,
          ),
          Flexible(
            child: new Text(displayString,
              style: TextStyle(
                fontFamily: 'ArialRoundedBold',
                color: colorTextBlack,
                fontSize: 19*percentScale,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )
            ),
          ),
        ]
      )
    ),
  );
}

Widget infoContainerHHA(double percentScale, String imageIcon, String displayString1, String displayString2, String displayString3){
  int totalStrings = 3;
  if(displayString1 == "None"||displayString1 == "NA"){
    totalStrings = totalStrings - 1;
  }
  if(displayString2 == "None"||displayString2 == "NA"){
    totalStrings = totalStrings - 1;
  }
  if(displayString3 == "None"||displayString3 == "NA"){
    totalStrings = totalStrings - 1;
  }
  if (totalStrings==0)
    return Container();

  return Container(
    height: 45*percentScale,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: new Image.asset(
            'assets/'+imageIcon,
            height: 25*percentScale,
            width: 25*percentScale,
          ),
        ),
        SizedBox(
          width: 5*percentScale,
        ),
        (){
          if(totalStrings==1){
            return Container(
              child: new Text(
                (){
                  if(displayString1=="None" && displayString2=="None")
                    return displayString3;
                  else if(displayString2=="None" && displayString3=="None")
                    return displayString1;
                  else if(displayString1=="None" && displayString3=="None")
                    return displayString2;
                  else 
                    return "";
                }(),
                style: TextStyle(
                  fontFamily: 'ArialRoundedBold',
                  color: colorTextBlack,
                  fontSize: 19*percentScale,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )
              ),
            );
          } else if (totalStrings == 2){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: new Text(
                    (){
                      if(displayString1=="None")
                        return displayString2;
                      else if(displayString2=="None")
                        return displayString1;
                      else if(displayString3=="None")
                        return displayString1;
                      else 
                        return "";
                    }(),
                    style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: colorTextBlack,
                      fontSize: 13*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
                Container(
                  child: new Text(
                    (){
                      if(displayString1=="None")
                        return displayString3;
                      else if(displayString2=="None")
                        return displayString3;
                      else if(displayString3=="None")
                        return displayString2;
                      else 
                        return "";
                    }(),
                    style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: colorTextBlack,
                      fontSize: 13*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
              ],
            );
          } else if (totalStrings == 3){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: new Text(displayString1,
                    style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: colorTextBlack,
                      fontSize: 10*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
                Container(
                  child: new Text(displayString2,
                    style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: colorTextBlack,
                      fontSize: 10*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
                Container(
                  child: new Text(displayString3,
                    style: TextStyle(
                      fontFamily: 'ArialRoundedBold',
                      color: colorTextBlack,
                      fontSize: 10*percentScale,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        }(),
      ]
    )
  );
}

Widget quoteContainer(double percentScale, Color stringColor, String quotedText){
  return Container(
    width: 220*percentScale,
    child: Text(quotedText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Baskerville',
        color: stringColor,
        fontSize: 14*percentScale,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      )
    ),
  );
}

Widget circleContainer(double percentScale, Color imageBG, Color stringColor, String text){
  return new Container(
    transform: Matrix4.translationValues(15*percentScale, -15*percentScale, 0),
    width: 80*percentScale,
    height: 80*percentScale,
    child: Stack(
      children: <Widget>[
        Center(
          child: Container(
            transform: Matrix4.translationValues(-13*percentScale,(31)*percentScale,0),
            height:30,
            width:70,
            child: Text(capitalize(text),
            textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ArialRoundedBold',
                  color: stringColor,
                  fontSize: 11*percentScale,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),
        ),
        new Container(
          width: 55*percentScale,
          height: 55*percentScale,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100*percentScale),
            color: imageBG,
          )
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100*percentScale),
          child: Container(
            width: 55*percentScale,
            height: 55*percentScale,
            child: Center(child: getIconName(text, percentScale))
          ),
        ),
      ],
    ),
  );
}

Widget getIconName(String source, double percentScale) {
  if(source.contains("Nook's Cranny") && source.contains("Crafting")) {
    return new Image.asset(
      'assets/' + 'nookCraft.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if(source.contains("Nook's Cranny")) {
    return new Image.asset(
      'assets/' + 'nook.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(source.contains("Crafting")) {
    return new Image.asset(
      'assets/' + 'crafting.png',
      height: 35 * percentScale,
      width: 35 * percentScale,
    );
  }
  else if(source.contains("Saharah")) {
    return new Image.asset(
      'assets/' + 'saharah.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(source.contains("Able")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(source.contains("Kick")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(source.contains("Jolly")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(source.contains("Bug Off")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if(source.contains("Fishing Tourney")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if(source.contains("May Day Tour")) {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if(source.contains('Ocean')||source.contains('Pier')){
    return new Image.asset(
      'assets/' + 'oceanIcon.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if (source.contains('River')){
    return new Image.asset(
      'assets/' + 'riverIcon.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if (source.contains('Pond')){
    return new Image.asset(
      'assets/' + 'pondIcon.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if (source.contains('Assessing fossils')){
    return new Image.asset(
      'assets/' + 'digIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else {
    return new Image.asset(
      'assets/' + 'leaf.png',
      height: 35*percentScale,
      width: 35*percentScale,
    );
  }
}

String buyPriceConverted(String buy, String milesPrice, String source){
  if (buy=='NFS'){
    if (milesPrice != "NA"){
      return milesPrice;
    } else if (source == "Crafting") {
      return "None";
    }
  } else {
    return priceFormat.format(int.parse(buy));
  }
  return "";
}

String buyPriceConvertedType(String buy, String milesPrice, String source){
  if (buy=='NFS'){
    if (milesPrice != "NA"){
      return ' miles';
    } 
  } else {
    return ' bells';
  }
  return "";
}

String buyPriceConvertedIcon(String buy, String milesPrice, String source){
  if (buy=='NFS'){
    if (milesPrice != "NA"){
      return "miles.png";
    }
  } else {
      return "bellBag.png";
  }
  return "leaf.png";
}

Widget paintingContainerLayout(String dimensions, String imageLinkReal, String imageLinkFake){
  List splitDimensions = dimensions.split("x");
  if (splitDimensions[1] < splitDimensions[2]){
    return new Row(
      children: <Widget>[
        Expanded(
          child: new Image(image: AssetImage(imageLinkReal)),
        ),
        Expanded(
          child: new Image(image: AssetImage(imageLinkFake)),
        ),
      ]
    );
  }
  else{
    return new Column(
        children: <Widget>[
          Expanded(
            child: new Image(image: AssetImage(imageLinkReal)),
          ),
          Expanded(
            child: new Image(image: AssetImage(imageLinkFake)),
          ),
        ]
    );
  }
}