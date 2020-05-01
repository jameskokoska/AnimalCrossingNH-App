import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'fish.dart';
import 'bugs.dart';

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

  HomePage homepage;
  BugsPage bugspage;
  FishPage fishpage;
  MorePage morepage;
  Widget currentPageWidget;

  
  @override
  void initState(){
    homepage = HomePage();
    bugspage = BugsPage();
    fishpage = FishPage();
    morepage = MorePage();

    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex.toString()),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        buttonBackgroundColor: Theme.of(context).accentColor,
        items: <Widget>[
          Icon(Icons.home,size:20,color:Theme.of(context).primaryColor),
          Icon(Icons.bug_report,size:20,color:Theme.of(context).primaryColor),
          Icon(Icons.blur_linear,size:20,color:Theme.of(context).primaryColor),
          Icon(Icons.more_horiz,size:20,color:Theme.of(context).primaryColor),
        ],
        index: selectedIndex,
        onTap: selectedNavBar,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds:400),
      ),
      body: currentPageWidget,
    );
  }
}

class HomePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
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

