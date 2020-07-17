import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';


class SettingList extends StatefulWidget {
  SettingList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingListPageState createState() => _SettingListPageState();
}


class _SettingListPageState extends State<SettingList>{
  Future<void> resetData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: colorLightDarkAccent,
            ),

            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 219*percentScale,
                  backgroundColor: colorSettingsAppBar,
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
                          color: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
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
                      settingContainer(percentScale, 'List only active creatures', 'showListOnlyActive', showListOnlyActive, 'clockIcon'),
                      settingContainer(percentScale, 'Show variations in lists', 'showListVariations', showListVariations, 'dice'),
                      settingContainer(percentScale, 'Creatures leaving warning', 'lastCaughtWarning', lastCaughtWarning, 'alarmClock'),
                      settingContainer(percentScale, 'Show floating menu button', 'showButton', showButton, 'buttonIcon'),
                    ],),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:135*percentScale,
                  )
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: CupertinoAlertDialog(
                                title:  Text(
                                  'Would you like to delete all data?',
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                content: Text(
                                  'This action cannot be undone',
                                  style: TextStyle(
                                    fontFamily: 'ArialRounded',
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontFamily: 'ArialRounded'
                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'ArialRoundedBold'
                                      ),
                                    ),
                                    onPressed: (){
                                      HapticFeedback.mediumImpact();
                                      resetData();
                                      resetGlobals();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120, right:120),
                        child: Container(
                          height: 40*percentScale,
                          decoration: BoxDecoration(
                            color: Color(0xffff7070),
                            border: Border.all(width: 1.00, color: Color(0xffdc0000),), borderRadius: BorderRadius.circular(50.00), 
                          ), 
                          child: Center(
                            child: Text(
                              'Delete Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ArialRoundedBold'
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:20*percentScale,
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
                        highlightColor: colorSettingsAppBar,
                        splashColor: colorSettingsAppBar,
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
                        }else if(settingKey == 'showListVariations') {
                          showListVariations = state;
                          currentValue = state;
                        }else if(settingKey == 'skipSplash') {
                          skipSplash = state;
                          currentValue = state;
                        }else if(settingKey == 'lastCaughtWarning') {
                          lastCaughtWarning = state;
                          currentValue = state;
                        } else if(settingKey == 'showButton') {
                          showButton = state;
                          currentValue = state;
                        }
                        HapticFeedback.mediumImpact();
                      });
                      saveBool(settingKey, true, state);
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