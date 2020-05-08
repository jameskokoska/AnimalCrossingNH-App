import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/services.dart';
import 'more.dart';
import 'bugs.dart';
import 'mainMenu.dart';
import 'fishList.dart';
import 'music.dart';

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
var currentDate = DateTime.now();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
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
      home: SplashScreen.navigate(
        name: 'assets/animatedSplashPlane.flr',
        startAnimation: 'Splash',
        next: (context) => Main(),
        until: () => Future.delayed(Duration(milliseconds: 1)),
        backgroundColor: Colors.blueGrey[800],
      ),
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
  Widget currentPageWidget;

  
  @override
  void initState(){
    homepage = Home();
    bugspage = BugsPage();
    morepage = MorePage();
    fishlist = FishList();
    musiclist = MusicList();

    super.initState();
    currentPageWidget = homepage;
    
    //Remove status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  

  void selectedNavBar(int index){
    setState(() {
      if(index == 0){
        currentPageWidget = homepage;
      } else if (index == 1){
        currentPageWidget = musiclist;
      } else if (index == 2){
        currentPageWidget = morepage;
      } else {
        currentPageWidget = fishlist;
      }
    });
    HapticFeedback.mediumImpact(); 
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
      body: new Stack(
        children: <Widget>[
          new AnimatedSwitcher(
            duration: const Duration(milliseconds:200),
            child: currentPageWidget,
          ),
          Container(
            transform: Matrix4.translationValues(0, 13*percentScale, 0),
            child: new Align(
              alignment: Alignment.bottomCenter,
              child:Container(
                decoration:
                BoxDecoration(
            		borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(
                      color: Color(0x10000000),
                      offset: Offset(0,-6),
                      blurRadius: 3,
                      spreadRadius: 0
                  ) ],
                ),
                child: CurvedNavigationBar(
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Colors.black.withOpacity(0),
                  buttonBackgroundColor: Theme.of(context).accentColor,
                  items: <Widget>[
                    Image.asset('assets/home.png',
                    height:20*percentScale,
                    width:20*percentScale,),
                    Icon(Icons.bug_report,size:20,color:Theme.of(context).accentColor),
                    Icon(Icons.blur_linear,size:20,color:Theme.of(context).accentColor),
                    Icon(Icons.more_horiz,size:20,color:Theme.of(context).accentColor),
                  ],
                  index: selectedIndex,
                  onTap: selectedNavBar,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds:400),
                ),
              )
            ),
          ),
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