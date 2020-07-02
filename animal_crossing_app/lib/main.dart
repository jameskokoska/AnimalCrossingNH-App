import 'package:animal_crossing_app/gridList.dart';
import 'package:animal_crossing_app/museumCollection.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'more.dart';
import 'mainMenu.dart';
import 'fishList.dart';
import 'bugList.dart';
import 'music.dart';
import 'museumCollection.dart';
import 'settingList.dart';
import 'artList.dart';
import 'gridList.dart';


//----------Global Colours-----------
Color colorCircleContainerPopUp; //text
Color colorSettingsAppBar;
Color colorSearchbarBG;
Color colorSearchbarIcon;
Color colorShadow;
Color colorShadowPopUp;
Color colorLightDarkAccent;
Color colorTextBlack;
Color colorTextWhite;
Color colorWhite;
Color colorCheckRed;
Color colorCheckGreen;
Color colorFishAppBar;
Color colorFishAccent;
Color colorFishTextDarkBlue;
Color colorBugAppBar;
Color colorBugAccent;
Color colorBugTextDarkGreen;
Color colorFossilAppBar;
Color colorFossilAccent;
Color colorVillagerAppBar;
Color colorVillagerAccent;
Color colorVillagerCheck;
Color colorFurnitureAppBar;
Color colorFurnitureAccent;
Color colorClothingAppBar;
Color colorClothingAccent;
Color colorToolsAppBar;
Color colorToolsAccent;
Color colorFloorWallAppBar;
Color colorFloorWallAccent;
Color colorEmojipediaAppBar;

Color colorArtAppBar;
Color colorArtAccent;
Color colorArtTextDarkGreen;

//---------------------------
//----------Globals----------
bool northernHemisphere = true;
bool showCatchPhraseNow = false;    //always show the catchphrase
bool showListOnlyActive = true;     //only list fish you can catch
bool showListVariations = true;     //Show variations of furniture, clothing etc all colours in item lists
bool skipSplash = false;

var currentDate = DateTime.now();

//----------Database Functions---------------
getStoredBool(String key, bool defaultState) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = prefs.getBool(key) ?? defaultState;
  //print('read $key $storedBool');
  return storedBool;
}

saveBool(String key, bool defaultState, bool toStoreValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = toStoreValue ?? defaultState;
  //print('Stored $key $storedBool');
  await prefs.setBool(key, storedBool);
}

clearData() async{
  SharedPreferences prefs;
  prefs.clear();
  //print("clear");
}

//------------------------------------------------

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACNH Pocket Guide',
      theme: ThemeData (
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData (
        primaryColor: Color(0xFF313131),
        accentColor: Colors.red[50],
        brightness: Brightness.dark,
      ),
      home: (){
        if(skipSplash == true){
          return Main();
        } else {
          return SplashScreen.navigate(
            name: 'assets/animatedSplashPlane.flr',
            startAnimation: 'Splash',
            next: (context) => Main(),
            until: () => Future.delayed(Duration(milliseconds: 1)),
            backgroundColor: Colors.blueGrey[800]
          );
        }
      }(),
    );
  }
}


class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<Main> {
  int selectedIndex = 0;

  Home homepage;
  MorePage morepage;
  FishList fishlist;
  BugList buglist;
  MusicList musiclist;
  SettingList settingList;
  MuseumPage museumPage;
  ArtList artList;
  Widget currentPageWidget;

  
  @override
  void initState(){
    homepage = Home();
    morepage = MorePage();
    fishlist = FishList();
    buglist = BugList();
    musiclist = MusicList();
    settingList = SettingList();
    museumPage = MuseumPage();
    artList = ArtList();

    //Retrieve data for settings from sharedpreferences storage
    super.initState();
    getStoredBool('northernHemisphere', true).then((indexResult){
      northernHemisphere = indexResult;
    });
    getStoredBool('showCatchPhraseNow', false).then((indexResult){
      showCatchPhraseNow = indexResult;
    });
    getStoredBool('showListOnlyActive', true).then((indexResult){
      showListOnlyActive = indexResult;
    });
    getStoredBool('showListVariations', true).then((indexResult){
      showListVariations = indexResult;
    });
    getStoredBool('skipSplash', false).then((indexResult){
      skipSplash = indexResult;
    });
    
    currentPageWidget = homepage;
    
    //Remove status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
  
  void selectedNavBar(int index){
    setState(() {
      if(index!=selectedIndex)
        HapticFeedback.mediumImpact(); 
      if(index == 0){
        currentPageWidget = homepage;
      } else if (index == 1){
        currentPageWidget = settingList;
      } else if (index == 2){
        currentPageWidget = artList;
      } else {
        currentPageWidget = museumPage;
      }
    });
    selectedIndex = index;
    //print(currentPageWidget);
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    if(!darkMode){
      colorCircleContainerPopUp = Color(0xff90a4ae); //text
      colorSearchbarBG = Color(0x63DFDFDF);
      colorSearchbarIcon = Color(0x48000000);
      colorShadow = Color(0x0C000000);
      colorShadowPopUp = Color(0x29000000);
      colorLightDarkAccent = Color(0xFFF5F5F5);
      colorTextBlack = Color(0xff373737);
      colorTextWhite = Color(0xFFFFFFFF);
      colorWhite = Color(0xFFFFFFFF);
      colorCheckRed = Color(0xFFF8DFE3);
      colorCheckGreen = Color(0xFFA0DDA1);
      colorSettingsAppBar = Color(0xFFB0BEC5);
      colorFishAppBar = Color(0xFFA2D0F7);
      colorFishAccent = Color(0xFFE3F2FD);
      colorFishTextDarkBlue = Color(0xff3F51B5);
      colorBugAppBar = Color(0xFFa5d6a7);
      colorBugAccent = Color(0xFFe8f5e9);
      colorBugTextDarkGreen = Color(0xFF1b5e20);
      colorFossilAppBar = Color(0xFF947C5D);
      colorFossilAccent = Color(0xFFE9DAC5);
      colorVillagerAppBar = Color(0xFF66CFD6);
      colorVillagerAccent = Color(0xFFEEFDFC);
      colorVillagerCheck = Color(0xFFD6F5F2);
      colorFurnitureAppBar = Color(0xFF41D448);
      colorFurnitureAccent = Color(0xFFe8f5e9);
      colorClothingAppBar = Color(0xFF3A15C0);
      colorClothingAccent = Color(0xFFede7f6);
      colorToolsAppBar = Color(0xFFC01515);
      colorToolsAccent = Color(0xFFFDF1F2);
      colorFloorWallAppBar = Color(0xFF1565c0);
      colorFloorWallAccent = Color(0xFFe3f2fd);
      colorEmojipediaAppBar = Color(0xFFFFF176);
      colorArtAppBar = Color(0xFF730000);
      colorArtAccent = Color(0xFFe8f5e9);
      colorArtTextDarkGreen = Color(0xFF1b5e20);
    } else if(darkMode){
      colorCircleContainerPopUp = Color(0xff90a4ae); //text
      colorSearchbarBG = Color(0xC4A3A3A3);
      colorSearchbarIcon = Color(0xADFFFFFF);
      colorTextBlack = Color(0xFFFFFFFF);
      colorTextWhite = Color(0xff373737);
      colorWhite = Color(0xFF2B2B2B);
      colorLightDarkAccent = Color(0xFF1A1A1A);
      colorShadow = Color(0xFF313131);
      colorShadowPopUp = Color(0x29000000);
      colorCheckRed = Color(0xFF805D62);
      colorCheckGreen = Color(0xFF557E55);
      colorCircleContainerPopUp = Color(0xFF979797);
      colorSettingsAppBar = Color(0xFF3D4042);
      colorFishAppBar = Color(0xFF536991);
      colorFishAccent = Color(0xFF434C53);
      colorFishTextDarkBlue = Color(0xFF9AA2D4);
      colorBugAppBar = Color(0xFF295029);
      colorBugAccent = Color(0xFF6D756E);
      colorBugTextDarkGreen = Color(0xFF729E75);
      colorFossilAppBar = Color(0xFF4E463B);
      colorFossilAccent = Color(0xFF726A5F);
      colorArtAccent = Color(0xFFe8f5e9);
      colorArtTextDarkGreen = Color(0xFF1b5e20);
      colorVillagerAppBar = Color(0xFF4B6E70);
      colorVillagerAccent = Color(0xFF71807F);
      colorVillagerCheck = Color(0xFFE2B0B0);
      colorFurnitureAppBar = Color(0xFF255728);
      colorFurnitureAccent = Color(0xFF626D63);
      colorClothingAppBar = Color(0xFF2B224D);
      colorClothingAccent = Color(0xFF625D69);
      colorToolsAppBar = Color(0xFF6E3333);
      colorToolsAccent = Color(0xFF5A474A);
      colorFloorWallAppBar = Color(0xFF204064);
      colorFloorWallAccent = Color(0xFF505E68);
      colorEmojipediaAppBar = Color(0xFF807623);
    }

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
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          new AnimatedSwitcher(
            duration: const Duration(milliseconds:200),
            child: currentPageWidget,
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70*percentScale,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(topRight:Radius.circular(30*percentScale),topLeft:Radius.circular(30*percentScale)),
                color: darkModeColor(darkMode,Color(0xFFFFFFFF),Color(0xFF313131)),
                boxShadow: [BoxShadow(
                  color: Color(0x10000000),
                  offset: Offset(0,-3*percentScale),
                  blurRadius: 5*percentScale,
                  spreadRadius: 0
                ) ],
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70*percentScale,
              child: Center(
                child: new Align(
                  alignment: Alignment.center,
                  child: BubbleBottomBar(
                    opacity: .2,
                    currentIndex: selectedIndex,
                    onTap: selectedNavBar,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30*percentScale)),
                    elevation: 0,
                    hasNotch: false,
                    hasInk: true,
                    inkColor: Colors.blueGrey[50],
                    backgroundColor: Colors.transparent,
                    items: <BubbleBottomBarItem>[
                        BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Home')),
                        BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.bug_report,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.bug_report,size:20,color:Theme.of(context).accentColor), title: Text('Music')),
                        BubbleBottomBarItem(backgroundColor: Colors.yellow, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Fish')),
                        BubbleBottomBarItem(backgroundColor: Colors.blue, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Bugs')),
                    ],
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}


Color darkModeColor(bool darkMode, Color colorLight, Color colorDark){
  if(!darkMode)
    return colorLight;
  else
    return colorDark;
}

String capitalize(String string) {
  if (string == null){
    throw ArgumentError("string: $string");
  } 
  if (string.isEmpty){
    return string;
  }
  return string[0].toUpperCase() + string.substring(1);
}

class Debouncer{
  int milliseconds;
  VoidCallback action;
  Timer timer;

  Debouncer({this.milliseconds});
  run(VoidCallback action){
    if (null!= timer) {
      timer.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds),action);
  }
}