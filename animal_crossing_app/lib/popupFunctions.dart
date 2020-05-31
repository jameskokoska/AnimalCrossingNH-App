import 'main.dart';
import 'package:flutter/material.dart';

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

Widget infoContainer(double percentScale, String imageIcon, String displayString){
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
        Container(
          child: new Text(displayString,
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              color: Color(0xff3a3a3a),
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

Widget infoContainerHHA(double percentScale, String imageIcon, String displayString1, String displayString2, String displayString3){
  int totalStrings = 3;
  if(displayString1 == "None"){
    totalStrings = totalStrings - 1;
    
  }
  if(displayString2 == "None"){
    totalStrings = totalStrings - 1;
  }
  if(displayString3 == "None"){
    totalStrings = totalStrings - 1;
  }
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
                  color: Color(0xff3a3a3a),
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
                      color: Color(0xff3a3a3a),
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
                      color: Color(0xff3a3a3a),
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
                      color: Color(0xff3a3a3a),
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
                      color: Color(0xff3a3a3a),
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
                      color: Color(0xff3a3a3a),
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


