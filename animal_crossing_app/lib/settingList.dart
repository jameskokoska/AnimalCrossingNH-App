import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

class SettingList extends StatefulWidget {
  SettingList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingListPageState createState() => _SettingListPageState();
}


class _SettingListPageState extends State<SettingList>{

  

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
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color(0xFF193D69)),
            ),

            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 219*percentScale,
                  backgroundColor: Color(0xFFB0BEC5),
                  pinned: true,
                  //snap: true,
                  floating: true,
                  elevation: 10,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      transform: Matrix4.translationValues(0,-13*percentScale,0),
                      child: Text("Settings",
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextWhite,
                          fontSize: 30*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                    titlePadding: EdgeInsetsDirectional.only(start: 25*percentScale),
                    //background: Image.asset('assets/fishTitle.png'),
                  ),
                ),

                //Add the sliverlist parsed in future function above
                SliverPadding(
                  padding: EdgeInsets.only(top:10*percentScale),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      settingContainer(percentScale, 'Northern hemisphere', 'northernHemisphere', northernHemisphere, 'earth'),
                      //settingContainer(percentScale, 'Splash Screen', 'skipSplash', skipSplash, 'phone'),
                      settingContainer(percentScale, 'Always show catchphrase', 'showCatchPhraseNow', showCatchPhraseNow, 'speechBubble'),
                      settingContainer(percentScale, 'List only active creatures', 'showListOnlyActive', showListOnlyActive, 'alarmClock'),
                    ],),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:375*percentScale,
                  )
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

Widget settingContainer(double percentScale, String settingTitle, String settingKey, bool currentValue, String imageAsset){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Column(
        children: <Widget>[
          SizedBox(
            height:7*percentScale
          ),
          Stack(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14*percentScale),
                  child: new Container(
                    child: new Material(
                      child: new InkWell(
                        highlightColor: Color(0xFFcfd8dc),
                        splashColor: Color(0xFFb3e5fc),
                        enableFeedback: true,
                        onTap: (){
                        },
                        child: new Container(
                          width: 334*percentScale,
                          height: 65*percentScale,
                        ),
                      ),
                      color: colorWhite,
                    ),
                  )
                ),
              ),
              Container(
                width: 335*percentScale,
                height:65*percentScale,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoSwitch(
                    value: currentValue,
                    onChanged: ((bool state){
                      setState(() {
                        if(settingKey == 'northernHemisphere'){
                          northernHemisphere = state;
                          currentValue = state;
                        }else if (settingKey == 'showCatchPhraseNow') {
                          showCatchPhraseNow = state;
                          currentValue = state;
                        }else if(settingKey == 'showListOnlyActive') {
                          showListOnlyActive= state;
                          currentValue = state;
                        }else if(settingKey == 'skipSplash') {
                          skipSplash = state;
                          currentValue = state;
                        }
                        HapticFeedback.mediumImpact();
                      });
                      saveSettings(settingKey, true, state);
                    }),
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  transform: Matrix4.translationValues(65*percentScale,0,0),
                  width: 330*percentScale,
                  height:65*percentScale,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(settingTitle,
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: colorTextBlack,
                        fontSize: 16*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  transform: Matrix4.translationValues(30*percentScale,0,0),
                  width: 330*percentScale,
                  height:65*percentScale,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Image.asset(
                      'assets/'+imageAsset+'.png',
                      height:24*percentScale,
                      width:24*percentScale,
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  );
}