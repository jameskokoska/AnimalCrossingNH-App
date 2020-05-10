import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'more.dart';
import 'bugs.dart';
import 'mainMenu.dart';
import 'fishList.dart';
import 'music.dart';
import 'settingList.dart';

//---------------------------
Color colorLightDarkAccent = Color(0xFFF5F5F5);
Color colorTextBlack = Color(0xff373737);
Color colorTextWhite = Color(0xFFFFFFFF);
Color colorWhite = Color(0xFFFFFFFF);
Color colorCheckRed = Color(0xFFF8DFE3);
Color colorCheckGreen = Color(0xFFA0DDA1);
Color colorFishAccent = Color(0xFFE3F2FD);
Color colorFishTextDarkBlue = Color(0xff3F51B5);
//---------------------------

bool northernHemisphere = true;
bool showCatchPhraseNow = false;    //always show the catchphrase
bool showListOnlyActive = true;     //only list fish you can catch
bool skipSplash = false;

var currentDate = DateTime.now();


getLastSettings(String key, bool defaultState) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = prefs.getBool(key) ?? defaultState;
  print('read $key $storedBool');
  return storedBool;
}

saveSettings(String key, bool defaultState, bool toStoreValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedBool = toStoreValue ?? defaultState;
  print('Stored $storedBool');
  await prefs.setBool(key, storedBool);
}

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
  BugsPage bugspage;
  MorePage morepage;
  FishList fishlist;
  MusicList musiclist;
  SettingList settingList;
  Widget currentPageWidget;

  
  @override
  void initState(){
    homepage = Home();
    bugspage = BugsPage();
    morepage = MorePage();
    fishlist = FishList();
    musiclist = MusicList();
    settingList = SettingList();

    //Retrieve data for settings from sharedpreferences storage
    super.initState();
    getLastSettings('northernHemisphere', true).then((indexResult){
      northernHemisphere = indexResult;
    });
    getLastSettings('showCatchPhraseNow', false).then((indexResult){
      showCatchPhraseNow = indexResult;
    });
    getLastSettings('showListOnlyActive', true).then((indexResult){
      showListOnlyActive = indexResult;
    });
    getLastSettings('skipSplash', false).then((indexResult){
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
        currentPageWidget = morepage;
      } else {
        currentPageWidget = fishlist;
      }
    });
    selectedIndex = index;
    print(currentPageWidget);
  }

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(30*percentScale),
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
          Container(
            //not centerd properly oops
            transform: Matrix4.translationValues(30*percentScale, -11*percentScale, 0),
            child: new Align(
              alignment: Alignment.bottomCenter,
              child: BubbleBottomBar(
                opacity: .2,
                currentIndex: selectedIndex,
                onTap: selectedNavBar,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30*percentScale)),
                elevation: 0,
                fabLocation: BubbleBottomBarFabLocation.end,
                hasNotch: false,
                hasInk: true,
                inkColor: Colors.blueGrey[50],
                backgroundColor: Colors.transparent,
                items: <BubbleBottomBarItem>[
                    BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Home')),
                    BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.bug_report,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.bug_report,size:20,color:Theme.of(context).accentColor), title: Text('Music')),
                    BubbleBottomBarItem(backgroundColor: Colors.yellow, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Fish')),
                    BubbleBottomBarItem(backgroundColor: Colors.blue, icon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), activeIcon: Icon(Icons.home,size:20,color:Theme.of(context).accentColor), title: Text('Bugs'))
                ],
              ),
            )
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