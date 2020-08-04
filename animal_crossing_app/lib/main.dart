import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'mainMenu.dart';
import 'music.dart';
import 'pageCollections.dart';
import 'settingList.dart';
import 'creditsList.dart';
import 'gridList.dart';
import 'emojipedia.dart';
import 'constructionList.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';


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
Color colorCreditsAppBar;
Color colorWarningBackground;
Color colorSeaAppBar;
Color colorSeaAccent;
Color colorConstructionAppBar;
Color colorSelectedAccent;

Color colorArtAppBar;
Color colorArtAccent;

String darkExtension = "";
//---------------------------
//----------Globals----------
bool firstLoad = false;
bool northernHemisphere = true;
bool showCatchPhraseNow = false;    //always show the catchphrase
bool showListOnlyActive = true;     //only list fish you can catch
bool showListVariations = true;     //Show variations of furniture, clothing etc all colours in item lists
bool skipSplash = false;
bool lastCaughtWarning = false;
bool showButton = true;

int totalCollectedFossils = 0;
int totalCollectedBugs = 0;
int totalCollectedFish = 0;
int totalCollectedSea = 0;
int totalCollectedMusic = 0;

var currentDate = DateTime.now();


resetGlobals(){
  totalCollectedFossils = 0;
  totalCollectedBugs = 0;
  totalCollectedFish = 0;
  totalCollectedSea = 0;
  totalCollectedMusic = 0;
}

//----------Database Functions---------------
getStoredBool(String key, bool defaultState) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = prefs.getBool(key) ?? defaultState;
  //print('read $key $storedBool');
  return storedBool;
}

getStoredInt(String key, int defaultState) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int storedInt = prefs.getInt(key) ?? defaultState;
  //print('read $key $storedBool');
  return storedInt;
}

saveBool(String key, bool defaultState, bool toStoreValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = toStoreValue ?? defaultState;
  //print('Stored $key $storedBool');
  await prefs.setBool(key, storedBool);
}

saveInt(String key, int defaultState, int toStoreValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int storedInt = toStoreValue ?? defaultState;
  //print('Stored $key $storedBool');
  await prefs.setInt(key, storedInt);
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
        accentColor: Color(0xFFF0F0F0),
        brightness: Brightness.light,
        fontFamily: 'ArialRoundedBold',
      ),
      darkTheme: ThemeData (
        primaryColor: Color(0xFF313131),
        accentColor: Color(0xFF414141),
        brightness: Brightness.dark,
        fontFamily: 'ArialRoundedBold',
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
  Widget currentPageWidget;

  Widget villagerListSliver;
  bool finish;
  
  @override
  void initState(){
    finish = false;
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
    getStoredBool('lastCaughtWarning', false).then((indexResult){
      lastCaughtWarning = indexResult;
    });
    getStoredBool('hideButton', true).then((indexResult){
      showButton = indexResult;
    });
    getStoredBool('hideButton', true).then((indexResult){
      showButton = indexResult;
    });
    getStoredBool('firstLoad', false).then((indexResult){
      firstLoad = indexResult;
    });

    // getStoredInt('totalCollectedFossils', 0).then((indexResult){
    //   totalCollectedFossils = indexResult;
    // });
    // getStoredInt('totalCollectedBugs', 0).then((indexResult){
    //   totalCollectedBugs = indexResult;
    // });
    // getStoredInt('totalCollectedFish', 0).then((indexResult){
    //   totalCollectedFish = indexResult;
    // });
    //  getStoredInt('totalCollectedSea', 0).then((indexResult){
    //   totalCollectedSea = indexResult;
    // });
    // getStoredInt('totalCollectedMusic', 0).then((indexResult){
    //   totalCollectedMusic = indexResult;
    // });
    
    currentPageWidget = Home();
    
    //Remove status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
  
  
  void selectedNavBar(int index, BuildContext context){
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    setState(() {
      if(index!=selectedIndex)
        HapticFeedback.mediumImpact(); 
      if(index == 0){
        currentPageWidget = Home();
      } else if (index == 1){
        currentPageWidget = MuseumPage();
      } else if (index == 2){
        currentPageWidget = ItemsPage();
      } else if (index == 3){
        currentPageWidget = MusicList();
      } else if (index == 4){
        currentPageWidget = EmojiList();
      } else if (index == 5){
        currentPageWidget = CraftingToolsPage();
      } else if (index == 6){
        currentPageWidget = GridList(
          title: "Villagers",
          sliverList: <Widget>[villagerListSliver],
          titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
          mainColor: colorVillagerAppBar,
          accentColor: colorVillagerAccent,
          checkmark: false,
          checkmarkColor: colorVillagerCheck,
          popupHeight: 500,
          smallContainer: true
        );
      } else if (index == 7){
        currentPageWidget = ConstructionList();
      } else if (index == 8){
        currentPageWidget = MiscPage();
      } else if (index == 20){
        currentPageWidget = SettingList();
      } else if (index == 21){
        currentPageWidget = CreditsList();
      } else {
        currentPageWidget = Home();
      }
    });
    selectedIndex = index;
    //print(currentPageWidget);
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    if(!darkMode){
      darkExtension = "";
      colorSelectedAccent = Color(0xE5D0DBE0);
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
      colorArtAccent = Color(0xFFFFF0F5);
      colorCreditsAppBar = Color(0xFFFFF176);
      colorWarningBackground = Color(0xFFffccbc);
      colorSeaAppBar = Color(0xFFA2D0F7);
      colorSeaAccent = Color(0xFFE3F2FD);
      colorConstructionAppBar = Color(0xFFffa726);
    } else if(darkMode){
      darkExtension = "Dark";
      colorSelectedAccent = Color(0xDA7C8D96);
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
      colorArtAppBar = Color(0xFF630000);
      colorArtAccent = Color(0xFF5A4043);
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
      colorCreditsAppBar = Color(0xFF807623);
      colorWarningBackground = Color(0xFF4d2a2c);
      colorSeaAppBar = Color(0xFF536991);
      colorSeaAccent = Color(0xFF434C53);
      colorConstructionAppBar = Color(0xFF8F6200);
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 12,
                    left: 15,
                    child: new Text("ACNH Pocket",
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: colorTextBlack,
                        fontSize: 30*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: colorBugAccent,
              ),
            ),
            SizedBox(height:10*percentScale),
            drawerItem(context, selectedNavBar, selectedIndex, 0, "Home", Colors.orange, "house.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 1, "Creatures + Museum", colorFishAppBar, "bugs.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 2, "Items", colorFurnitureAppBar, "leaf.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 3, "Songs", Colors.blue, "music.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 4, "Emoticons", colorEmojipediaAppBar, "emote.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 5, "Crafting + Tools", colorToolsAccent, "crafting.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 6, "Villagers", colorVillagerAppBar, "cat.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 7, "Construction", colorConstructionAppBar, "construction.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 8, "Misc. Timetables", colorFurnitureAppBar, "season.png"),
            drawerBreak(),
            drawerItem(context, selectedNavBar, selectedIndex, 20, "Settings", colorSettingsAppBar, "gear.png"),
            drawerItem(context, selectedNavBar, selectedIndex, 21, "About", colorCreditsAppBar, "magnifyingGlass.png"),
            SizedBox(height: 10)
          ],
        ),
      ),
      
      resizeToAvoidBottomPadding: false,
      body: (){
        return FutureBuilder(
          future:getStoredBool("firstLoad", false),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              if(finish==false&&snapshot.data==false){
                return SKOnboardingScreen(
                  bgColor: colorWhite,
                  themeColor: colorFishTextDarkBlue,
                  pages: [
                    SkOnboardingModel(
                      title: 'Welcome to ACNH Pocket',
                      description:
                          'This has been in development for a very long time. Hope you enjoy!',
                      titleColor: colorTextBlack,
                      descripColor: Color(0xFFA7A7A7),
                      imagePath: 'assets/palmIcon.png'
                    ),
                    SkOnboardingModel(
                      title: 'Track creatures and events',
                      description:
                          'With a user friendly and modern user interface and design.',
                      titleColor: colorTextBlack,
                      descripColor: Color(0xFFA7A7A7),
                      imagePath: 'assets/airIcon.png'
                    ),
                    SkOnboardingModel(
                      title: 'Enjoy!',
                      description:
                          'Please report any bugs. We will add more content soon!',
                      titleColor: colorTextBlack,
                      descripColor: Color(0xFFA7A7A7),
                      imagePath: 'assets/emote.png'
                    ),
                  ],
                  skipClicked: (value) {
                    setState(() {
                      finish=true;
                      Future.delayed(Duration.zero, () => chooseHemisphere(context));
                    });
                  },
                  getStartedClicked: (value) {
                    setState(() {
                      finish=true;
                      Future.delayed(Duration.zero, () => chooseHemisphere(context));
                    });
                  },
                );
              } else {
                return Stack(
                  children: <Widget>[
                    new AnimatedSwitcher(
                      duration: const Duration(milliseconds:200),
                      child: currentPageWidget,
                    ),
                  ],
                );
              }
            } else {
              return Container();
            }
          }
        );
      }(),
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

Widget drawerBreak(){
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Container(
      height:4,
      decoration: new BoxDecoration(
        color: colorLightDarkAccent,
        borderRadius: new BorderRadius.all(
          Radius.circular(20.0),
        )
      ),
    ),
  );
}

Widget drawerItem(var context, selectedNavBar(int index, BuildContext context), int currentSelectedIndex, int index, String name, Color accentColor, String imagePath){
  return Padding(
    padding: const EdgeInsets.only(left:20,right:20, top:3, bottom:3),
    child: Container(
      decoration: new BoxDecoration (
        borderRadius: BorderRadius.circular(15),
        color: (){
          if(currentSelectedIndex==index)
            return colorSelectedAccent;
          else
            return Color(0x00000000);
        }(),
        boxShadow: [BoxShadow(
          color: (){
            if(currentSelectedIndex==index)
              return accentColor;
            else
              return Color(0x00000000);
          }(),
          offset: Offset(0,0),
          blurRadius: 0,
          spreadRadius: -0.5
          ) 
        ],
      ),
      child: ListTile(
        leading: Stack(
          children: [
            Opacity(
              child: Image.asset(
                'assets/'+imagePath, color: Colors.black, height:25, width:25
              ), 
              opacity: (){
                if(currentSelectedIndex==index)
                  return 0.2;
                else
                  return 0.0;
              }(),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Image.asset('assets/'+imagePath, height:25, width:25)
              )
            )
          ]   
        ),
        title: Text(name),
        onTap: () {
          if(currentSelectedIndex!=index){
            selectedNavBar(index, context);
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.pop(context);
            });
          }
        },
      ),
    ),
  );
}

Widget floatingActionButton(percentScale, var context, [bool offset=false, bool alwaysShow=false]){
  bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
  if(showButton==true||alwaysShow==true){
    return Theme(
      data: ThemeData (
        primaryColor: darkModeColor(darkMode,Color(0xFFFFFFFF),Color(0xFF313131)),
        accentColor: darkModeColor(darkMode,Color(0xFFF0F0F0),Color(0xFF414141)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: (){
              if(offset)
                return 35.0*percentScale;
              else
                return 0.0;
            }(),
            right: 0,
            child: FloatingActionButton(
              child: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
                HapticFeedback.mediumImpact(); 
              },
            ),
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
  
}


chooseHemisphere(var context) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool("firstLoad");
    if (isFirstLoaded == null||isFirstLoaded==false) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
           return BackdropFilter(
             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
             child: CupertinoAlertDialog(
              title:  Text(
                'Which hemisphere?',
                style: TextStyle(
                  fontFamily: 'ArialRoundedBold',
                  fontWeight: FontWeight.w500,
                ),
              ),
              content: Text(
                'This can be changed in settings',
                style: TextStyle(
                  fontFamily: 'ArialRounded',
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    'Southern',
                    style: TextStyle(
                      fontFamily: 'ArialRounded'
                    ),
                  ),
                  onPressed: (){
                    HapticFeedback.mediumImpact();
                    Navigator.of(context).pop();
                    prefs.setBool("firstLoad", true);
                    northernHemisphere = false;
                    saveBool("northernHemisphere", true, false);
                  },
                ),
                 CupertinoDialogAction(
                  child: Text(
                    'Northern',
                    style: TextStyle(
                      fontFamily: 'ArialRounded'
                    ),
                  ),
                  onPressed: (){
                    HapticFeedback.mediumImpact();
                    Navigator.of(context).pop();
                    prefs.setBool("firstLoad", true);
                    northernHemisphere = true;
                    saveBool("northernHemisphere", true, true);
                  },
                ),
              ],
            ),
          );
        },
      );
    }
}