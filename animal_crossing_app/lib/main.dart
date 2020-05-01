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
    currentPageWidget = homepage;
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

    print(deviceWidth);
    return Scaffold(
        body: 
          Center(
            child: Column(
              children: <Widget>[
                new Container(
        width: 267,
        height: 35,
        decoration: new BoxDecoration(
          color: Color(0xa6ffffff),
		borderRadius: BorderRadius.circular(30),
		boxShadow: [BoxShadow(
        color: Color(0x29000000),
        offset: Offset(0,3),
        blurRadius: 6,
        spreadRadius: 0

    ) ],

        )
      ),

      new Container(
        width: 230*percentScale,
        height: 30*percentScale,
        decoration: new BoxDecoration(
          color: Color(0xa6ffffff),
		borderRadius: BorderRadius.circular(30),
		boxShadow: [BoxShadow(
        color: Color(0x29000000),
        offset: Offset(0,3),
        blurRadius: 6,
        spreadRadius: 0

    ) ],

        )
      ),

                new Container(
                  width: 230,
                  height: 30,
                  child: Center(
                    child: Text(
                      "Nate's Birthday",
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: Color(0xff4e4e4e),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    )
                  ),
                  decoration: new BoxDecoration(
                    color: Color(0xa6ffffff),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                    ) ],
                  )
                ),
                new Container(
                  width: 360,
                  height: 127,
                  decoration: new BoxDecoration(
                    color: Color(0xffb8e299),
                  )
                ),
                new Stack(
                  children: <Widget>[
                    new Container(
                      width: deviceWidth,
                      height: 290,
                      decoration: new BoxDecoration(
                        color: Color(0xffdbd6f4),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0,3),
                          blurRadius: 10,
                          spreadRadius: 0
                        ) ],
                      )
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        new Container(
                          width: 334,
                          height: 29,
                          decoration: new BoxDecoration(
                            color: Color(0xffe9e7f2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                            ) ],
                          )
                        ),
                        SizedBox(height: 50),
                        new Container(
                          width: 334,
                          height: 29,
                          decoration: new BoxDecoration(
                            color: Color(0xffe9e7f2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                            ) ],
                          )
                        ),
                        SizedBox(height: 50),
                        new Container(
                          width: 334,
                          height: 29,
                          decoration: new BoxDecoration(
                            color: Color(0xffe9e7f2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                            ) ],
                          )
                        )
                      ],
                    ),
                    
                    
                  ],
                ),                
              ],
            )
          )
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

