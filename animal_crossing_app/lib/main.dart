import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'fish.dart';
import 'bugs.dart';
import 'mainMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData (
        primaryColor: Colors.red,
        accentColor: Colors.red[50],
        backgroundColor: Colors.grey[50],
        fontFamily: '',
      ),
      darkTheme: ThemeData (
        primaryColor: Colors.green,
        accentColor: Colors.red[50],
        backgroundColor: Colors.grey[50],
        fontFamily: '',
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
  Fish fishpage;
  MorePage morepage;
  Widget currentPageWidget;

  
  @override
  void initState(){
    homepage = Home();
    bugspage = BugsPage();
    fishpage = Fish();
    morepage = MorePage();

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
        currentPageWidget = bugspage;
      } else if (index == 2){
        currentPageWidget = fishpage;
      } else {
        currentPageWidget = morepage;
      }
    });
    HapticFeedback.mediumImpact(); 
    print(currentPageWidget);
  }

  Widget build(BuildContext context) {

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
            duration: const Duration(milliseconds:150),
            child: currentPageWidget,
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child:CurvedNavigationBar(
              backgroundColor: Colors.black.withOpacity(0.1),
              buttonBackgroundColor: Theme.of(context).accentColor,
              items: <Widget>[
                Image.asset('assets/home.png',
                height:20*percentScale,
                width:20*percentScale,),
                Icon(Icons.bug_report,size:20,color:Theme.of(context).primaryColor),
                Icon(Icons.blur_linear,size:20,color:Theme.of(context).primaryColor),
                Icon(Icons.more_horiz,size:20,color:Theme.of(context).primaryColor),
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

class MorePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
    );
  }
}

