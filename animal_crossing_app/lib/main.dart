import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'more.dart';
import 'bugs.dart';
import 'mainMenu.dart';
import 'fishList.dart';
import 'music.dart';

bool northernHemisphere = true;
var currentDate = DateTime.now();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData (
        primaryColor: Color(0xFFFAFAFA),
        accentColor: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData (
        primaryColor: Color(0xFF313131),
        accentColor: Colors.red[50],
        brightness: Brightness.dark,
      ),
      home: Main(),
    );
  }
}


class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  final String title;

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
          new Align(
            alignment: Alignment.bottomCenter,
            child:CurvedNavigationBar(
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
            )
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