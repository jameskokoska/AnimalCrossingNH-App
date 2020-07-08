import 'main.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'databases.dart';
import 'package:cached_network_image/cached_network_image.dart';



class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}


Widget eventContainer(bool darkMode, double percentScale, String enable, String name, String time, String dayNum, String dayStr, String imagePath){
  bool onlineImage = false;
  if(imagePath.contains("http")){
    onlineImage = true;
  }
  bool enableBool;
  if(enable=="true"){
    enableBool = true;
  } else {
    enableBool = false;
  }
  return Column(
    children: <Widget>[
      Visibility(
        visible: enableBool,
        child: Stack(
          children: <Widget>[
            Center(
              child: new Container(
                width: 334*percentScale,
                height: 71*percentScale,
                decoration: new BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(8)
                )
              )
            ),
            new Container(
              transform: Matrix4.translationValues(28*percentScale,15*percentScale,0),
              child: (){
                if(onlineImage == true){
                  return Transform.scale(
                    scale:1.3,
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        width: 41*percentScale,
                        height: 41*percentScale,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4*percentScale),
                          image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      imageUrl: imagePath,
                      //placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 70*percentScale,height:70*percentScale),
                      height:41*percentScale,
                      width:41*percentScale,
                      fadeInDuration: Duration(milliseconds:800),
                    ),
                  );
                } else {
                  return new Image.asset(
                    'assets/'+imagePath,
                    height:41*percentScale,
                    width:41*percentScale,
                  );
                }
              }()
            ),
            new Container(
              transform: Matrix4.translationValues(293*percentScale,15*percentScale,0),
              child: 
                Stack(
                children: <Widget>[
                  new Image.asset(
                    'assets/calendarIcon.png',
                    height:41*percentScale,
                    width:41*percentScale,
                  ),
                  Container(
                    transform: Matrix4.translationValues(-(318/2)*percentScale,14*percentScale,0),
                    child: Center(
                      child: new Text(
                        dayNum,
                        style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: Color(0xff373737),
                        fontSize: 19*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-(318/2)*percentScale,1*percentScale,0),
                    child: Center(
                      child: new Text(
                        dayStr,
                        style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: Color(0xff373737),
                        fontSize: 10*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                  )
                ], 
              )
            ),
            new Container(
              transform: Matrix4.translationValues(0,15*percentScale,0),
              child: new Center(
                child: new Text(
                  name,
                  style: TextStyle(
                  fontFamily: 'ArialRoundedBold',
                  color: darkModeColor(darkMode, Color(0xff373737), Color( 0xffF4EBD6)),
                  fontSize: 18*percentScale,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  )
                )
              ),
            ),
            new Container(
              transform: Matrix4.translationValues(0,43*percentScale,0),
              child: new Center(
                child: new Text(
                  time,
                  style: TextStyle(
                  fontFamily: 'ArialRoundedBold',
                  color: darkModeColor(darkMode, Color(0xff373737), Color(0xffF4EBD6)),
                  fontSize: 13*percentScale,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  )
                )
              ),
            ),
          ],
        ),
      ),
      Visibility(
        visible: enableBool,
        child: SizedBox(
          height: 7*percentScale,
        ),
      ),
    ],
  );
}

Widget storeContainer(String enable, double percentScale, bool darkMode, String storeName, bool nook) {
  String storeState;
  String storeTitle;
  String storeHours;
  bool enableBool;
  bool nookSunday = false;
  Color bubble;
  String date = DateFormat.jm().format(new DateTime.now()).toString();
  String timeStr = date.substring(0,date.length-3);
  String meridian = date.substring(date.length-2,date.length);
  String day = DateFormat.E().format(new DateTime.now()).toString();
  String timeHr;
  String timeMin;
  int timeHour;
  int timeMinute;

  if(timeStr[1] == ":") {
    timeHr = timeStr.substring(0,1);
    timeMin = timeStr.substring(2,);
  }else {
    timeHr = timeStr.substring(0,2);
    timeMin = timeStr.substring(3,);
  }
  timeHour = int.parse(timeHr);
  timeMinute = int.parse(timeMin);

  if(nook) {
    storeHours = "8 AM - 10 PM";
    if((timeHour == 12 && meridian == "PM") || (timeHour >= 8 && timeHour != 12 && meridian == "AM") || (timeHour < 10 && meridian == "PM")) {
      storeState = "Open";
      bubble = Color(0xffB9FBC8);
      if(timeHour == 9 && meridian == "PM") {
        storeState = "Open (Closing Soon)";
        bubble = Color(0xfffdcd2e);
      }
    }else {
      storeState = "Closed";
      bubble = Color(0xffFFC9CE);
    }
    storeTitle = "Nook's Cranny";
  }else {
    storeHours = "9 AM - 9 PM";
    if((timeHour == 12 && meridian == "PM") || (timeHour >= 9 && timeHour != 12 && meridian == "AM") || (timeHour < 9 && meridian == "PM")) {
      storeState = "Open";
      bubble = Color(0xffB9FBC8);
      if(timeHour == 8 && meridian == "PM") {
        storeState = "Open";
        bubble = Color(0xfffdcd2e);
      }
    }else {
      storeState = "Closed";
      bubble = Color(0xffFFC9CE);
    }
    storeTitle = "Able Sisters";
  }

  if(nook) {
    if(day == "Sun") {
      nookSunday = true;
    }
  }

  if(enable=="true"){
    enableBool = true;
  } else {
    enableBool = false;
  }

  return Column(
    children: <Widget>[
      Visibility(
        visible: enableBool,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 344*percentScale,
                height: 101*percentScale,
                //margin: const EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                    color: darkModeColor(!darkMode, colorWhite, bubble),
                    borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues((388/20)*percentScale, -29*percentScale, 0),
              child: new Image.asset(
                'assets/' + storeName + '.png',
                height: 150*percentScale,
                width: 80*percentScale,
              ),
            ),
            new Container(
              transform: Matrix4.translationValues((788/20)*percentScale,34*percentScale,0),
              child: Center(
                child: new Text(
                  storeState + ": " + storeTitle + "\n" + storeHours,
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    color: Color(0xff373737),
                    fontSize: 20*percentScale,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: nookSunday,
              child: Stack(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues((788/20)*percentScale, 34*percentScale,0),
                    child: Center(
                      child: new Text(
                        "\n\nTurnips cannot be sold on Sundays",
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: Color(0xff373737),
                          fontSize: 12*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


class _HomePageState extends State<Home>{
  bool morning = false;
  String currentTime;
  String afternoonString;
  String date;
  String weekday;

  var futureEvents;
  
  @override
  void initState() {
    //seconds = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 60), (Timer t) => getTime());
    super.initState();
    getTime();
    futureEvents = getEventsData();
  }

  void getTime() {
    if (!mounted) return;
    setState(() {
      String time = DateFormat.jm().format(new DateTime.now()).toString();
      currentTime = time.substring(0,time.length-3);
      afternoonString = time.substring(time.length-2,time.length);
      date = DateFormat.MMMMd().format(new DateTime.now()).toString();
      weekday = DateFormat.E().format(new DateTime.now()).toString();
    });
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

    
    int totalFossils = 73;
    int totalBugs = 80;
    int totalFish = 80;
    int totalMusic = 96;
    double fossilsPercent = totalCollectedFossils/totalFossils;
    double bugsPercent = totalCollectedBugs/totalBugs;
    double fishPercent = totalCollectedFish/totalFish;
    double musicPercent = totalCollectedMusic/totalMusic;


    


    return Scaffold(
        body: Stack(
          children: <Widget>[
            new Container(
              height: deviceHeight,
              width: deviceWidth,
              color: darkModeColor(darkMode, Color( 0xff70c1ee), Color( 0xff1A1A1A)),
            ),
            
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(0, 69*percentScale, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(currentTime,
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: Colors.white,
                                  fontSize: 56*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 7,
                                      color: Color(0x2F000000),
                                    ),
                                  ]
                                )
                              ),
                              SizedBox(
                                width: 6*percentScale,
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8*percentScale, 0),
                                child: Text(afternoonString,
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color: Colors.white,
                                    fontSize: 32*percentScale,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0, 3),
                                        blurRadius: 7,
                                        color: Color(0x2F000000),
                                      ),
                                    ]
                                  )
                                ),
                              ),
                            ]
                          ),
                          //Line separation
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Container(
                              height: 4*percentScale,
                              decoration: new BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [BoxShadow(
                                    color: Color(0x2F000000),
                                    offset: Offset(0,3),
                                    blurRadius: 7,
                                    spreadRadius: 0
                                    ) 
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(date,
                                        style: TextStyle(
                                          fontFamily: 'ArialRoundedBold',
                                          color: Color(0x00FFFFFF),
                                          fontSize: 28*percentScale,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          
                                        )
                                      ),
                                      SizedBox(
                                        width:16,
                                      ),
                                      Container(
                                        decoration: new BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 4,
                                            bottom: 4,
                                          ),
                                          child: Center(
                                            child: Text(weekday + ".",
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: Colors.transparent,
                                                fontSize: 23*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:13,
                          ),
                          //Actual date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(date,
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: Colors.white,
                                  fontSize: 28*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 7,
                                      color: Color(0x2F000000),
                                    ),
                                  ]
                                )
                              ),
                              SizedBox(
                                width:16,
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [BoxShadow(
                                    color: Color(0x23000000),
                                    offset: Offset(0,3),
                                    blurRadius: 7,
                                    spreadRadius: 0
                                    ) 
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: 5,
                                    bottom: 6,
                                  ),
                                  child: Center(
                                    child: Text(weekday + ".",
                                      style: TextStyle(
                                        fontFamily: 'ArialRoundedBold',
                                        color: Colors.black,
                                        fontSize: 21*percentScale,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                  Center(
                    child: ColumnSuper(
                      innerDistance: -60,
                      children: <Widget>[
                        SizedBox(height: 182*percentScale),
                        //Top Section
                        new Stack(
                        children: <Widget>[
                            new Container(
                              width: deviceWidth,
                              height: 127*percentScale,
                              decoration: new BoxDecoration(
                                color: darkModeColor(darkMode,Color(0xffb8e299),Color(0xff4D6839)),
                              )
                            ),
                            // new Center(
                            //   child: new Container(
                            //     width: 230*percentScale,
                            //     height: 30*percentScale,
                            //     child: Center(
                            //       child: Text(
                            //         "Nate's Birthday",
                            //         style: TextStyle(
                            //           fontFamily: 'ArialRoundedBold',
                            //           color: Color(0xff4e4e4e),
                            //           fontSize: 15*percentScale,
                            //           fontWeight: FontWeight.w400,
                            //           fontStyle: FontStyle.normal,
                            //         )
                            //       )
                            //     ),
                            //     decoration: new BoxDecoration(
                            //       color: Color(0xa6ffffff),
                            //       borderRadius: BorderRadius.circular(30*percentScale),
                            //       boxShadow: [BoxShadow(
                            //         color: Color(0x29000000),
                            //         offset: Offset(0,3),
                            //         blurRadius: 6,
                            //         spreadRadius: 0
                            //       ) ],
                            //     )
                            //   ),
                            // ),
                          ], 
                        ),

                        //Progress Section
                        new Stack(
                          children: <Widget>[
                            //Background
                            new Container(
                              width: deviceWidth,
                              height: 344*percentScale,
                              decoration: new BoxDecoration(
                                color: darkModeColor(darkMode,colorLightDarkAccent,Color(0xff0D0D0D)),
                                borderRadius: BorderRadius.circular(30*percentScale),
                                boxShadow: [BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0,3),
                                  blurRadius: 10,
                                  spreadRadius: 0
                                ) ],
                              )
                            ),
                            //Text bubble
                            new Container(
                              transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                              width: 105*percentScale,
                              height: 35*percentScale,
                              decoration: new BoxDecoration(
                                color: darkModeColor(darkMode,Color(0xff9d99fc),Color(0xff2D2D2D)),
                                borderRadius: BorderRadius.circular(30*percentScale),
                                boxShadow: [BoxShadow(
                                    color:  darkModeColor(darkMode,Color(0x28000000),Color(0x409D99FC)),
                                    offset: Offset(0,3),
                                    blurRadius: 6,
                                    spreadRadius: 0
                                ) ],
                              ),
                              child: Center(
                                child: Text("Collection",
                                  style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: darkModeColor(darkMode,Color(0xFF000000),Color(0xff9D99FC)),
                                  fontSize: 16*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  )
                                ),
                              ),
                            ),
                            //Progress bars
                            Center(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 59*percentScale),
                                  //Fossil Progress bar
                                  new GestureDetector(
                                    onTap: (){
                                      //print("fossil progress bar tapped");
                                    },
                                    child: new Stack(
                                      //Progress BG
                                      children: <Widget>[
                                        new Center(
                                          child: new Stack(
                                            children: <Widget>[
                                              new Container(
                                                width: 334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,colorWhite,Color(0xff494365)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                              //Progress bar actual progress
                                              new Container(
                                                width: fossilsPercent*334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,Color( 0xfff5d1ae),Color(0xff9E744B)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Bone icon
                                        new Container(
                                          transform: Matrix4.translationValues(21*percentScale,3.5*percentScale,0),
                                          child: new Image.asset(
                                            'assets/bones.png',
                                            height:22*percentScale,
                                            width:22*percentScale,
                                          )
                                        ),
                                        //Progress text
                                        new Container(
                                          transform: Matrix4.translationValues(0,5*percentScale,0),
                                          child: new Center(
                                            child: new Text(totalCollectedFossils.toString() + " / " + totalFossils.toString(),
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                            )
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 19*percentScale),
                                  //Bugs Progress bar
                                  new GestureDetector(
                                    onTap: (){
                                      //print("bugs progress bar tapped");
                                    },
                                    child: new Stack(
                                    //Progress BG
                                      children: <Widget>[
                                        new Center(
                                          child: new Stack(
                                            children: <Widget>[
                                              new Container(
                                                width: 334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,colorWhite,Color(0xff494365)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                              //Progress bar actual progress
                                              new Container(
                                                width: bugsPercent*334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,Color( 0xffb8e299),Color(0xff68914A)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Bug icon
                                        new Container(
                                          transform: Matrix4.translationValues(21*percentScale,3.5*percentScale,0),
                                          child: new Image.asset(
                                            'assets/bugs.png',
                                            height:22*percentScale,
                                            width:22*percentScale,
                                          )
                                        ),
                                        //Progress text
                                        new Container(
                                          transform: Matrix4.translationValues(0,5*percentScale,0),
                                          child: new Center(
                                            child: new Text(totalCollectedBugs.toString() + " / " + totalBugs.toString(),
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                            )
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  SizedBox(height: 19*percentScale),
                                  //Fish Progress Bar
                                  new GestureDetector(
                                    onTap: (){
                                      //print("fish progress bar tapped");
                                    },
                                    child: new Stack(
                                      //Progress BG
                                      children: <Widget>[
                                        new Center(
                                          child: new Stack(
                                            children: <Widget>[
                                              new Container(
                                                width: 334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,colorWhite,Color(0xff494365)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                              //Progress bar actual progress
                                              new Container(
                                                width: fishPercent*334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,Color( 0xff9edcf4),Color(0xff71A3AD)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Fish icon
                                        new Container(
                                          transform: Matrix4.translationValues(21*percentScale,3.5*percentScale,0),
                                          child: new Image.asset(
                                            'assets/fish.png',
                                            height:22*percentScale,
                                            width:22*percentScale,
                                          )
                                        ),
                                        //Progress text
                                        new Container(
                                          transform: Matrix4.translationValues(0,5*percentScale,0),
                                          child: new Center(
                                            child: new Text(totalCollectedFish.toString() + " / " + totalFish.toString(),
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color:colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                            )
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 19*percentScale),
                                  //Music progress bar
                                  new GestureDetector(
                                    onTap: (){
                                      //print("music progress bar tapped");
                                    },
                                    child: new Stack(
                                      //Progress BG
                                      children: <Widget>[
                                        new Center(
                                          child: new Stack(
                                            children: <Widget>[
                                              new Container(
                                                width: 334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,colorWhite,Color(0xff494365)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                              //Progress bar actual progress
                                              new Container(
                                                width: musicPercent*334*percentScale,
                                                height: 29*percentScale,
                                                decoration: new BoxDecoration(
                                                  color: darkModeColor(darkMode,Color( 0xfffdd835),Color(0xffcbc26d)),
                                                  borderRadius: BorderRadius.circular(10*percentScale),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Music icon
                                        new Container(
                                          transform: Matrix4.translationValues(21*percentScale,3.5*percentScale,0),
                                          child: new Image.asset(
                                            'assets/music.png',
                                            height:22*percentScale,
                                            width:22*percentScale,
                                          )
                                        ),
                                        //Progress text
                                        new Container(
                                          transform: Matrix4.translationValues(0,5*percentScale,0),
                                          child: new Center(
                                            child: new Text(totalCollectedMusic.toString() + " / " + totalMusic.toString(),
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color:colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                            )
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //Events Section 
                        FutureBuilder(
                          future: futureEvents,
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              final now = DateTime.now();
                              final today = DateTime(now.year, now.month, now.day);
                              final tomorrow = DateTime(now.year, now.month, now.day+1);
                              final tomorrow2 = DateTime(now.year, now.month, now.day+2);
                              final tomorrow3 = DateTime(now.year, now.month, now.day+3);
                              final tomorrow4 = DateTime(now.year, now.month, now.day+4);
                              final tomorrow5 = DateTime(now.year, now.month, now.day+5);
                              final tomorrow6 = DateTime(now.year, now.month, now.day+6);
                              final tomorrow7 = DateTime(now.year, now.month, now.day+7);
                              List<EventData> todayEvents = getEventsDay(today.month.toString(), today.day.toString(), today.year.toString(), today.weekday.toString(), snapshot);
                              List<EventData> tomorrowEvents = getEventsDay(tomorrow.month.toString(), tomorrow.day.toString(), tomorrow.year.toString(), tomorrow.weekday.toString(),snapshot);
                              List<EventData> tomorrow2Events = getEventsDay(tomorrow2.month.toString(), tomorrow2.day.toString(), tomorrow2.year.toString(), tomorrow2.weekday.toString(),snapshot);
                              List<EventData> tomorrow3Events = getEventsDay(tomorrow3.month.toString(), tomorrow3.day.toString(), tomorrow3.year.toString(), tomorrow3.weekday.toString(),snapshot);
                              List<EventData> tomorrow4Events = getEventsDay(tomorrow4.month.toString(), tomorrow4.day.toString(), tomorrow4.year.toString(), tomorrow4.weekday.toString(),snapshot);
                              List<EventData> tomorrow5Events = getEventsDay(tomorrow5.month.toString(), tomorrow5.day.toString(), tomorrow5.year.toString(), tomorrow5.weekday.toString(),snapshot);
                              List<EventData> tomorrow6Events = getEventsDay(tomorrow6.month.toString(), tomorrow6.day.toString(), tomorrow6.year.toString(), tomorrow6.weekday.toString(),snapshot);
                              List<EventData> tomorrow7Events = getEventsDay(tomorrow7.month.toString(), tomorrow7.day.toString(), tomorrow7.year.toString(), tomorrow7.weekday.toString(),snapshot);
                              
                              List<EventData> weekEvents = tomorrow2Events+tomorrow3Events+tomorrow4Events+tomorrow5Events+tomorrow6Events+tomorrow7Events;

                              int numEvents = todayEvents.length+tomorrowEvents.length+weekEvents.length;
                              //print(numEvents);
                              int numDays = 1;
                              if(todayEvents.length>0){
                                numDays++;
                              }
                              if(tomorrowEvents.length>0){
                                numDays++;
                              }
                              if(weekEvents.length>0){
                                numDays++;
                              }
                              
                              return new Container(
                                //Background
                                width: deviceWidth,
                                height: (35*percentScale+70*percentScale) + numEvents*(7+68)*percentScale + numDays*(25+7+16)*percentScale,
                                decoration: new BoxDecoration(
                                color: darkModeColor(darkMode,colorLightDarkAccent,Color(0xff202020)),
                                borderRadius: BorderRadius.circular(30*percentScale),
                                boxShadow: [BoxShadow(
                                  color: darkModeColor(darkMode,Color(0x40000000),Color(0x80FFE96B)),
                                  offset: Offset(0,3),
                                  blurRadius: 10,
                                  spreadRadius: 0
                                  ) ],
                                ),
                                child:Stack(
                                  children: <Widget>[                          
                                    //Text bubble
                                    new Container(
                                      transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                                      width: 80*percentScale,
                                      height: 35*percentScale,
                                      decoration: new BoxDecoration(
                                        color: darkModeColor(darkMode,Color(0xffffe86b),Color(0xff2D2D2D)),
                                        borderRadius: BorderRadius.circular(30*percentScale),
                                        boxShadow: [BoxShadow(
                                            color: darkModeColor(darkMode,Color(0x1A000000),Color(0x40FFE86B)),
                                            offset: Offset(0,3),
                                            blurRadius: 6,
                                            spreadRadius: 0
                                        ) ],
                                      ),
                                      child: Center(
                                        child: Text("Events",
                                          style: TextStyle(
                                          fontFamily: 'ArialRoundedBold',
                                          color: darkModeColor(darkMode,Color(0xff000000),Color(0xffFFE86B)),
                                          fontSize: 16*percentScale,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          )
                                        ),
                                      ),
                                    ),
                                    
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        //Today Events
                                        (){
                                          if(todayEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(-140*percentScale,35*percentScale,0),
                                              child: new Text(
                                                "Today",
                                                style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                )
                                              )
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        (){
                                          if(todayEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(0,45*percentScale,0),
                                              child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: List.generate(todayEvents.length, (index){
                                                  print(todayEvents);
                                                    return eventContainer(darkMode, percentScale, "true",todayEvents[index].name, todayEvents[index].time, todayEvents[index].dayStart, todayEvents[index].month, todayEvents[index].image);
                                                }),
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        //Tomorrow's events
                                        (){
                                          if(tomorrowEvents.length>0&&todayEvents.length>0){
                                            return new SizedBox(
                                              height: 25*percentScale,
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        (){
                                          if(tomorrowEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(-122*percentScale,35*percentScale,0),
                                              child: new Text(
                                                "Tomorrow",
                                                style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                )
                                              )
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        (){
                                          if(tomorrowEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(0,45*percentScale,0),
                                              child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: List.generate(tomorrowEvents.length, (index){
                                                  return eventContainer(darkMode, percentScale, "true",tomorrowEvents[index].name, tomorrowEvents[index].time, tomorrowEvents[index].dayStart, tomorrowEvents[index].month, tomorrowEvents[index].image);
                                                }),
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        //This Week
                                        (){
                                          if(weekEvents.length>0&&tomorrowEvents.length>0||weekEvents.length>0&&todayEvents.length>0){
                                            return new SizedBox(
                                              height: 25*percentScale,
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        (){
                                          if(weekEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(-120*percentScale,35*percentScale,0),
                                              child: new Text(
                                                "This Week",
                                                style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: colorTextBlack,
                                                fontSize: 16*percentScale,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                )
                                              )
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                        (){
                                          if(weekEvents.length>0){
                                            return new Container(
                                              transform: Matrix4.translationValues(0,45*percentScale,0),
                                              child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children:List.generate(weekEvents.length, (index){
                                                  return eventContainer(darkMode, percentScale, "true",weekEvents[index].name, weekEvents[index].time, weekEvents[index].dayStart, weekEvents[index].month, weekEvents[index].image);
                                                }),
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }(),
                                      ], 
                                    )
                                  ]
                                )
                              );
                            } else {
                              return Container();
                            }
                          }
                        ),

                        //Active Creatures Section
                        new Container(
                          child:Stack(
                            //Background
                            children: <Widget>[
                              new Container(
                                width: deviceWidth,
                                height: 648*percentScale,
                                decoration: new BoxDecoration(
                                  color: darkModeColor(darkMode,colorLightDarkAccent,Color(0xFF0D0D0D)),
                                  borderRadius: BorderRadius.circular(30*percentScale),
                                  boxShadow: [BoxShadow(
                                    color: darkModeColor(darkMode,Color(0x40000000),Color(0x80FF8181)),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 0
                                  ) ],
                                )
                              ),
                              //Text bubble
                              new Container(
                                transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                                width: 159*percentScale,
                                height: 35*percentScale,
                                decoration: new BoxDecoration(
                                  color: darkModeColor(darkMode,Color( 0xffff8181),Color(0xFF0D0D0D)),
                                  borderRadius: BorderRadius.circular(30*percentScale),
                                  boxShadow: [BoxShadow(
                                      color: darkModeColor(darkMode,Color( 0x28000000),Color(0x40FF8181)),
                                      offset: Offset(0,3),
                                      blurRadius: 6,
                                      spreadRadius: 0
                                  ) ],
                                ),
                                child: Center(
                                  child: Text("Active Creatures",
                                    style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color: darkModeColor(darkMode,Color(0xff000000),Color(0xFFFF8181)),
                                    fontSize: 16*percentScale,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ),

                        //Store Hours Section
                        new Container(
                          child:Stack(
                            //Background
                            children: <Widget>[
                              new Container(
                                width: deviceWidth,
                                height: 302*percentScale,
                                decoration: new BoxDecoration(
                                  color: darkModeColor(!darkMode,colorLightDarkAccent,Color(0xFFDEFEFF)),
                                  borderRadius: BorderRadius.circular(30*percentScale),
                                  boxShadow: [BoxShadow(
                                    color: darkModeColor(darkMode,Color( 0x40000000),Color(0xc095C8F5)),
                                    offset: Offset(0,3),
                                    blurRadius: 10,
                                    spreadRadius: 0
                                  ) ],
                                )
                              ),
                              //Text bubble
                              new Container(
                                transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                                width: 123*percentScale,
                                height: 35*percentScale,
                                decoration: new BoxDecoration(
                                  color: darkModeColor(darkMode,Color(0xff95c8f5),Color(0xFF2D2D2D)),
                                  borderRadius: BorderRadius.circular(30*percentScale),
                                  boxShadow: [BoxShadow(
                                      color: darkModeColor(darkMode,Color( 0x28000000),Color(0x4095C8F5)),
                                      offset: Offset(0,3),
                                      blurRadius: 6,
                                      spreadRadius: 0
                                  ) ],
                                ),
                                child: Center(
                                  child: Text("Store Hours",
                                    style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    color:  darkModeColor(darkMode,Color( 0xff000000),Color(0xFF95C8F5)),
                                    fontSize: 16*percentScale,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    )
                                  ),
                                ),
                              ),
                              new Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Container(
                                    transform: Matrix4.translationValues(percentScale,30*percentScale,0),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          storeContainer("true", percentScale, false, "nook", true),
                                          storeContainer("true", percentScale, false, "able", false),
                                        ],
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                        new SizedBox(height: (150+22)*percentScale),
                        new Center(
                          child: Text("This application is NOT endorsed or afiliated with Nintendo",
                            style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color:  darkModeColor(darkMode,Color( 0xFFB7E3FF),Color(0xaF757575)),
                            fontSize: 10*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                        SizedBox(height: (190+22)*percentScale),
                        new Container(
                          transform: Matrix4.translationValues(0,553*percentScale,0),
                          child: Text("Plz dont sue",
                            style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color:  darkModeColor(darkMode,Color( 0xFFB7E3FF),Color(0xaF757575)),
                            fontSize: 10*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              )
            ),
          ],
        ),
    );
  }
}

List<EventData> getEventsDay(String currentMonth, String currentDay, String currentYear, String dayOfWeek, var snapshot){
  List<EventData> totalEvents = [];
  DateTime eventDay;
  EventData eventDatum;
  if(dayOfWeek=="7"){
    eventDatum = EventData("Daisy Mae",getMonthName(currentMonth),currentDay,"NA","NA","NA","NA","5 AM - 12 PM","turnip.png");
    totalEvents.add(eventDatum);
  } else if (dayOfWeek=="6"){
    eventDatum = EventData("K.K. Slider",getMonthName(currentMonth),currentDay,"NA","NA","NA","NA","8 PM - 12 AM","music.png");
    totalEvents.add(eventDatum);
  }

  for(int i = 0; i < snapshot.data.length; i++){
    int compareMonth = int.parse(getMonthNumber(snapshot.data[i].month));
    if(northernHemisphere && snapshot.data[i].hemisphere=="Southern"){
      continue;
    } else if (!northernHemisphere && snapshot.data[i].hemisphere=="Northern"){
      continue;
    } else if(snapshot.data[i].dayStart=="NA"){
      eventDay = getSpecialOccurenceDate(currentYear, i, snapshot);
      if(eventDay.day.toString()==currentDay && currentMonth==compareMonth.toString()){
        print(currentDay);
        print(eventDay.day.toString());
        eventDatum = EventData(snapshot.data[i].name,snapshot.data[i].month,snapshot.data[i].dayStart,snapshot.data[i].dayEnd,snapshot.data[i].specialDay,snapshot.data[i].specialOccurence,snapshot.data[i].hemisphere,snapshot.data[i].time,snapshot.data[i].image);
        totalEvents.add(eventDatum);
      }
    } else if(currentDay==snapshot.data[i].dayStart && currentMonth==compareMonth.toString()){
      eventDatum = EventData(snapshot.data[i].name,snapshot.data[i].month,snapshot.data[i].dayStart,snapshot.data[i].dayEnd,snapshot.data[i].specialDay,snapshot.data[i].specialOccurence,snapshot.data[i].hemisphere,snapshot.data[i].time,snapshot.data[i].image);
      totalEvents.add(eventDatum);
    }
  }
  return totalEvents;
}

DateTime getSpecialOccurenceDate(String currentYear, int i, var snapshot){
  //print(snapshot.data[i].name);
  DateTime eventDate;
  var occurence = 0;
  for(int day = 0; day < getDaysNumberMonth(snapshot.data[i].month); day++){
    //print(day);
    if(day<10){
      eventDate = DateTime.parse(currentYear+"-"+getMonthNumber(snapshot.data[i].month)+"-0"+day.toString()+" "+"00:00:00");
    } else {
      eventDate = DateTime.parse(currentYear+"-"+getMonthNumber(snapshot.data[i].month)+"-"+day.toString()+" "+"00:00:00");
    }
    
    if(eventDate.weekday==getDayOfWeekObject(snapshot.data[i].specialDay)){
      occurence++;
    }
    var specialOccurence = int.parse(snapshot.data[i].specialOccurence);
    if(occurence==specialOccurence){
      //print(specialOccurence);
      //print(occurence);
      //print(eventDate);
      return eventDate;
    }
  }
  return eventDate;
}

int getDaysNumberMonth(String currentMonth){
  if(currentMonth=="Jan")
    return 31;
  else if(currentMonth=="Feb")
    return 28;
  else if(currentMonth=="Mar")
    return 31;
  else if(currentMonth=="Apr")
    return 30;
  else if(currentMonth=="May")
    return 31;
  else if(currentMonth=="June")
    return 30;
  else if(currentMonth=="July")
    return 31;
  else if(currentMonth=="Aug")
    return 31;
  else if(currentMonth=="Sept")
    return 30;
  else if(currentMonth=="Oct")
    return 31;
  else if(currentMonth=="Nov")
    return 30;
  else
    return 31;
}

String getMonthNumber(String currentMonth){
  if(currentMonth=="Jan")
    return "01";
  else if(currentMonth=="Feb")
    return "02";
  else if(currentMonth=="Mar")
    return "03";
  else if(currentMonth=="Apr")
    return "04";
  else if(currentMonth=="May")
    return "05";
  else if(currentMonth=="June")
    return "06";
  else if(currentMonth=="July")
    return "07";
  else if(currentMonth=="Aug")
    return "08";
  else if(currentMonth=="Sept")
    return "09";
  else if(currentMonth=="Oct")
    return "10";
  else if(currentMonth=="Nov")
    return "11";
  else
    return "12";
}

String getMonthName(String currentMonth){
  if(currentMonth=="1")
    return "Jan";
  else if(currentMonth=="2")
    return "Feb";
  else if(currentMonth=="3")
    return "Mar";
  else if(currentMonth=="4")
    return "Apr";
  else if(currentMonth=="5")
    return "May";
  else if(currentMonth=="6")
    return "June";
  else if(currentMonth=="7")
    return "July";
  else if(currentMonth=="8")
    return "Aug";
  else if(currentMonth=="9")
    return "Sept";
  else if(currentMonth=="10")
    return "Oct";
  else if(currentMonth=="11")
    return "Nov";
  else
    return "Dec";
}

int getDayOfWeekObject(String dayOfWeek){
  if(dayOfWeek=="Monday"){
    return DateTime.monday;
  } else if(dayOfWeek=="Tuesday"){
    return DateTime.tuesday;
  }else if(dayOfWeek=="Wednesday"){
    return DateTime.wednesday;
  }else if(dayOfWeek=="Thursday"){
    return DateTime.thursday;
  }else if(dayOfWeek=="Friday"){
    return DateTime.friday;
  }else if(dayOfWeek=="Saturday"){
    return DateTime.saturday;
  }else if(dayOfWeek=="Sunday"){
    return DateTime.sunday;
  }
}