import 'main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;


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

String determineLastCaughtWarning(String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  if(northernHemisphere){
    if(currentDate.month==12){
      return nhJan;
    }else if (currentDate.month==1){
      return nhFeb;
    }else if (currentDate.month==2){
      return nhMar;
    }else if (currentDate.month==3){
      return nhApr;
    }else if (currentDate.month==4){
      return nhMay;
    }else if (currentDate.month==5){
      return nhJun;
    }else if (currentDate.month==6){
      return nhJul;
    }else if (currentDate.month==7){
      return nhAug;
    }else if (currentDate.month==8){
      return nhSep;
    }else if (currentDate.month==9){
      return nhOct;
    }else if (currentDate.month==10){
      return nhNov;
    }else if (currentDate.month==11){
      return nhDec;
    }
  }else{
    if(currentDate.month==12){
      return shJan;
    }else if (currentDate.month==1){
      return shFeb;
    }else if (currentDate.month==2){
      return shMar;
    }else if (currentDate.month==3){
      return shApr;
    }else if (currentDate.month==4){
      return shMay;
    }else if (currentDate.month==5){
      return shJun;
    }else if (currentDate.month==6){
      return shJul;
    }else if (currentDate.month==7){
      return shAug;
    }else if (currentDate.month==8){
      return shSep;
    }else if (currentDate.month==9){
      return shOct;
    }else if (currentDate.month==10){
      return shNov;
    }else if (currentDate.month==11){
      return shDec;
    }
  } 
  return "";
}

Color determineBackgroundColor(String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec){
  if (lastCaughtWarning==true&&determineLastCaughtWarning(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)=='NA'&&determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)!='NA')
    return colorWarningBackground;
  else 
    return colorWhite;
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
              try{
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
              catch (error){
                return new Image.asset(
                  'assets/'+imageIcon,
                  height: 25*percentScale,
                  width: 25*percentScale,
                );
              }
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

Widget circleContainer(double percentScale, Color imageBG, Color stringColor, String text, [bool bug =false]){
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
            child: Center(child: getIconName(text, percentScale, bug))
          ),
        ),
      ],
    ),
  );
}

Widget getIconName(String source, double percentScale, [bool bug=false]) {
  if(source.contains("Nook's Cranny") && source.contains("Crafting")) {
    return new Image.asset(
      'assets/' + 'nookCraft.png',
      height: 40*percentScale,
      width: 40*percentScale,
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
  else if(source.contains("Treasure Trawler")) {
    return new Image.asset(
      'assets/' + 'pirate.png',
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
  else if (bug==true&&source.contains('shoreline')){
    return new Image.asset(
      'assets/' + 'oceanIcon.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if (bug==true&&source.contains('turnip')){
    return new Image.asset(
      'assets/' + 'turnip.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&source.contains('fruit')){
    return new Image.asset(
      'assets/' + 'fruitTreeIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&source.contains('palm')){
    return new Image.asset(
      'assets/' + 'palmTreeIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&(source.contains('rock')||source.contains('underground'))){
    return new Image.asset(
      'assets/' + 'digIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&source.contains('stump')){
    return new Image.asset(
      'assets/' + 'stumpIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&source.contains('flower')){
    return new Image.asset(
      'assets/' + 'flower.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&source.contains('tree')){
    return new Image.asset(
      'assets/' + 'treeIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if (bug==true&&(source.contains('water')||source.contains('river')||source.contains('pond'))){
    return new Image.asset(
      'assets/' + 'pondIcon.png',
      height: 55*percentScale,
      width: 55*percentScale,
    );
  }
  else if (bug==true&&source.contains('stump')){
    return new Image.asset(
      'assets/' + 'stumpIcon.png',
      height: 40*percentScale,
      width: 40*percentScale,
    );
  }
  else if(bug==true){
    return new Image.asset(
      'assets/' + 'airIcon.png',
      height: 50*percentScale,
      width: 50*percentScale,
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

//Takes a string in the format "10 AM - 9 PM" for example
int determineActiveTimeStart(String time){
  if (time == "All day") {
    return 0;
  }
  else if (time == "NA") {
    return 0;
  } else {
    print(time.substring(2, 4));
    if (time.substring(2, 4) == "AM") {
      print(int.parse(time.substring(0, 2)));
      return int.parse(time.substring(0, 2));
    } else {
      print(int.parse(time.substring(0, 2)) + 12);
      return int.parse(time.substring(0, 2)) + 12;
    }
  }
}

int determineActiveTimeEnd(String time){
  if (time == "All day") {
    return 24;
  }
  else if (time == "NA") {
    return 0;
  } else {
    if (time.substring(9, 11) == "AM") {
      print(int.parse(time.substring(time.length - 5, time.length - 3)));
      return int.parse(time.substring(time.length - 5, time.length - 3));
    } else {
      print(int.parse(time.substring(time.length - 5, time.length - 3)) + 12);
      return int.parse(time.substring(time.length - 5, time.length - 3)) + 12;
    }
  }
}

double timeToAngle(int hour){
  double angle = hour * 15.0;
  return angle;
}

int activeDuration(int startTime, int endTime){
  int duration = 0;
  if (startTime < endTime){
    duration = endTime - startTime;
  }
  else if (startTime > endTime){
    duration = 24 - (startTime - endTime);
  }
  print(duration.abs());
  return duration.abs();
}

List<Widget> circularMonthText(double percentScale, String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec) {
  List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  List<int> textRotations = [0, 30, 60, 0, -60, -30, 0, 30, 60, 0, -60, -30];
  int currentRotation = 0;
  List<Widget> list = new List();
  for (int i = 0; i < months.length; i++) {
    list.add(
      new Center(
        child: Transform.rotate(
          angle: (currentRotation) * math.pi / 180,
          child: new Transform (
            child: Transform.rotate(
              angle: (-currentRotation + textRotations[i]) * math.pi / 180,
              child: monthText(percentScale, i, months)
            ),
            alignment: FractionalOffset.center,
            transform: new Matrix4.translationValues(0, -65, 0),
          ),
        ),
      ),
    );
    currentRotation += 30;
  }
  return list;
}

Widget monthText(double percentScale, int month, months) {
  if (month == currentDate.month) {
    return Text(months[month],
        style: TextStyle(
          fontFamily: 'ArialRoundedBold',
          fontSize: 12*percentScale,
          color: Colors.black,
        )
    );
  } else {
    return Text(months[month],
        style: TextStyle(
          fontFamily: 'ArialRoundedBold',
          fontSize: 12*percentScale,
          color: Colors.white,
        )
    );
  }
}

List<Widget> circularMonthActive(double percentScale, String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec) {
  determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec);
  int currentRotation = 0;
  List<Widget> list = new List();
  for (int i = 0; i < 12; i++) {
    list.add(
      new Center(
        child: Transform.rotate(
          angle: (currentRotation) * math.pi / 180,
          child: new Transform (
            child: Transform.rotate(
              angle: -(0) * math.pi / 180,
              child: new Image.asset(
                activeMonth(monthTime(i, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)),
                height: 35*percentScale,
                width: 35*percentScale,
              ),
            ),
            alignment: FractionalOffset.center,
            transform: new Matrix4.translationValues(0, -80, 0),
          ),
        ),
      ),
    );
    currentRotation += 30;
  }
  return list;
}

String monthTime(int currentMonth, String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec) {
  if(northernHemisphere){
    if(currentMonth==1){
      return nhJan;
    }else if (currentMonth+1==2){
      return nhFeb;
    }else if (currentMonth+1==3){
      return nhMar;
    }else if (currentMonth+1==4){
      return nhApr;
    }else if (currentMonth+1==5){
      return nhMay;
    }else if (currentMonth+1==6){
      return nhJun;
    }else if (currentMonth+1==7){
      return nhJul;
    }else if (currentMonth+1==8){
      return nhAug;
    }else if (currentMonth+1==9){
      return nhSep;
    }else if (currentMonth+1==10){
      return nhOct;
    }else if (currentMonth+1==11){
      return nhNov;
    }else{
      return nhDec;
    }
  }else{
    if(currentMonth+1==1){
      return shJan;
    }else if (currentMonth+1==2){
      return shFeb;
    }else if (currentMonth+1==3){
      return shMar;
    }else if (currentMonth+1==4){
      return shApr;
    }else if (currentMonth+1==5){
      return shMay;
    }else if (currentMonth+1==6){
      return shJun;
    }else if (currentMonth+1==7){
      return shJul;
    }else if (currentMonth+1==8){
      return shAug;
    }else if (currentMonth+1==9){
      return shSep;
    }else if (currentMonth+1==10){
      return shOct;
    }else if (currentMonth+1==11){
      return shNov;
    }else {
      return shDec;
    }
  }
}

String activeMonth(String time) {
  if (time == "NA"){
    return "assets/Inactive.png";
  } else {
    return "assets/Active.png";
  }
}

List<Widget> circularTimeActive(double percentScale, String nhJan,String nhFeb,String nhMar,String nhApr,String nhMay,String nhJun,String nhJul,String nhAug,String nhSep,String nhOct,String nhNov,String nhDec,String shJan,String shFeb,String shMar,String shApr,String shMay,String shJun,String shJul,String shAug,String shSep,String shOct,String shNov,String shDec) {
  List<String> timeList = determineTime(nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec).split("; ");
  List<Widget> activeList = new List();
  for (String time in timeList) {
    activeList.add(
      new Center(
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation((timeToAngle(determineActiveTimeStart(time)) + 180) / 360),
          child: new CircularPercentIndicator(
            radius: 160.0*percentScale,
            lineWidth: 15.0*percentScale,
            circularStrokeCap: CircularStrokeCap.butt,
            percent: timeToAngle(activeDuration(determineActiveTimeStart(time), determineActiveTimeEnd(time))) / 360,
            progressColor: Colors.green,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
  return activeList;
}

Widget creatureActiveTimes(double percentScale, String nhJan, String nhFeb, String nhMar, String nhApr, String nhMay, String nhJun, String nhJul, String nhAug, String nhSep, String nhOct, String nhNov, String nhDec, String shJan, String shFeb, String shMar, String shApr, String shMay, String shJun, String shJul, String shAug, String shSep, String shOct, String shNov, String shDec) {
  // ---------- Clock ----------
  return Container(
    height: 180*percentScale,
    width: 180*percentScale,
    child: Stack(
      children: <Widget>[
        // ---------- Availability Indicator Bar ----------
        Center(
          child: new Stack(
              children: circularTimeActive(percentScale, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec),
          ),
        ),
        // ---------- Clock Body ----------
        Center(
          child: new Image.asset(
            "assets/clock.png",
            height: 150*percentScale,
            width: 150*percentScale,
          ),
        ),
        // ---------- Time Indicator Dot ----------
        Center(
          child: Transform.rotate(
            angle: (timeToAngle(DateTime.now().hour) + 172.5) * math.pi / 180,
            child: new Transform (
              child: Container(
                child: new Image.asset(
                  "assets/indicator.png",
                  height: 10*percentScale,
                  width: 10*percentScale,
                ),
              ),
              alignment: FractionalOffset.center, // set transform origin
              transform: new Matrix4.translationValues(0, -72, 0), // rotate -10 deg
            ),
          ),
        ),
      ],
    ),
  );
}

Widget creatureActiveMonths(double percentScale, String nhJan, String nhFeb, String nhMar, String nhApr, String nhMay, String nhJun, String nhJul, String nhAug, String nhSep, String nhOct, String nhNov, String nhDec, String shJan, String shFeb, String shMar, String shApr, String shMay, String shJun, String shJul, String shAug, String shSep, String shOct, String shNov, String shDec) {
  // ---------- Seasons ----------
  return Container(
    height: 180*percentScale,
    width: 180*percentScale,
    child: Stack(
      children: <Widget>[
        // ---------- Base Image ----------
        Center(
          child: new Image.asset(
            'assets/months.png',
            height: 160*percentScale,
            width: 160*percentScale,
          ),
        ),
        // ---------- Month Text ----------
        Center(
          child: new Stack(
              children: circularMonthText(percentScale, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)),
        ),
        // ---------- Active Indicators ----------
        Center(
          child: new Stack(
              children: circularMonthActive(percentScale, nhJan, nhFeb, nhMar, nhApr, nhMay, nhJun, nhJul, nhAug, nhSep, nhOct, nhNov, nhDec, shJan, shFeb, shMar, shApr, shMay, shJun, shJul, shAug, shSep, shOct, shNov, shDec)),
        ),
      ],
    ),
  );
}