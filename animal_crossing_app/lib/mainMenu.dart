import 'main.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}


Widget eventContainer(bool darkMode, double percentScale, String enable, String name, String time, String dayNum, String dayStr, String imagePath){
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
                  color: darkModeColor(darkMode, Color(0xfff4ebd6), Color(0xff414141)),
                  borderRadius: BorderRadius.circular(8)
                )
              )
            ),
            new Container(
              transform: Matrix4.translationValues(28*percentScale,15*percentScale,0),
              child: new Image.asset(
                'assets/'+imagePath,
                height:41*percentScale,
                width:41*percentScale,
              )
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
                  color: darkModeColor(darkMode, Color(0xff373737), Color( 0xffF4EBD6)),
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
        child:SizedBox(
          height: 7*percentScale,
        ),
      ),
    ],
  );
}



class _HomePageState extends State<Home>{

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

    Color textColor;
    if(!darkMode)
      textColor = Color( 0xff000000);
    else
      textColor = Color( 0xffEAEAEA);

    double fossilsPercent = 10/50;
    double bugsPercent = 50/76;
    double fishPercent = 5/100;

    int numEvents = 6;
    int numDays = 3;
    
    List<String> todayFirstBirthday = ["First Birthday", "Sat", "24", "All Days"];
    List<String> todaySecondBirthday = [];


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
              child: Center(
                child: ColumnSuper(
                  innerDistance: -60,
                  children: <Widget>[
                    SizedBox(height: 292*percentScale),
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
                        new Center(
                          child: new Container(
                            width: 230*percentScale,
                            height: 30*percentScale,
                            child: Center(
                              child: Text(
                                "Nate's Birthday",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: Color(0xff4e4e4e),
                                  fontSize: 15*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                              )
                            ),
                            decoration: new BoxDecoration(
                              color: Color(0xa6ffffff),
                              borderRadius: BorderRadius.circular(30*percentScale),
                              boxShadow: [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                              ) ],
                            )
                          ),
                        ),
                      ], 
                    ),

                    //Progress Section
                    new Stack(
                      children: <Widget>[
                        //Background
                        new Container(
                          width: deviceWidth,
                          height: 274*percentScale,
                          decoration: new BoxDecoration(
                            color: darkModeColor(darkMode,Color(0xffdbd6f4),Color(0xff0D0D0D)),
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
                              SizedBox(height: 44*percentScale),
                              //Fossil Progress bar
                              new GestureDetector(
                                onTap: (){
                                  print("fossil progress bar tapped");
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
                                              color: darkModeColor(darkMode,Color( 0xffe9e7f2),Color(0xff494365)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x29000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
                                            )
                                          ),
                                          //Progress bar actual progress
                                          new Container(
                                            width: fossilsPercent*334*percentScale,
                                            height: 29*percentScale,
                                            decoration: new BoxDecoration(
                                              color: darkModeColor(darkMode,Color( 0xfff5d1ae),Color(0xff9E744B)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x00000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
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
                                        child: new Text("10 / 50",
                                          style: TextStyle(
                                            fontFamily: 'ArialRoundedBold',
                                            color: textColor,
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
                                  print("bugs progress bar tapped");
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
                                              color: darkModeColor(darkMode,Color( 0xffe9e7f2),Color(0xff494365)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x29000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
                                            )
                                          ),
                                          //Progress bar actual progress
                                          new Container(
                                            width: bugsPercent*334*percentScale,
                                            height: 29*percentScale,
                                            decoration: new BoxDecoration(
                                              color: darkModeColor(darkMode,Color( 0xffb8e299),Color(0xff68914A)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x00000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
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
                                        child: new Text("50 / 76",
                                          style: TextStyle(
                                            fontFamily: 'ArialRoundedBold',
                                            color: textColor,
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
                                  print("fish progress bar tapped");
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
                                              color: darkModeColor(darkMode,Color( 0xffe9e7f2),Color(0xff494365)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x29000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
                                            )
                                          ),
                                          //Progress bar actual progress
                                          new Container(
                                            width: fishPercent*334*percentScale,
                                            height: 29*percentScale,
                                            decoration: new BoxDecoration(
                                              color: darkModeColor(darkMode,Color( 0xff9edcf4),Color(0xff71A3AD)),
                                              borderRadius: BorderRadius.circular(10*percentScale),
                                              boxShadow: [BoxShadow(
                                                color: Color(0x00000000),
                                                offset: Offset(0,3),
                                                blurRadius: 6,
                                                spreadRadius: 0
                                              ) ],
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
                                        child: new Text("5 / 100",
                                          style: TextStyle(
                                            fontFamily: 'ArialRoundedBold',
                                            color: textColor,
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
                    new Container(
                      //Background
                      width: deviceWidth,
                      height: (35*percentScale+70*percentScale) + numEvents*(7+71)*percentScale + numDays*(25+7+16)*percentScale,
                      decoration: new BoxDecoration(
                      color: darkModeColor(darkMode,Color(0xfffffcea),Color(0xff202020)),
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
                          
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //Today Events
                              new Container(
                                transform: Matrix4.translationValues(-140*percentScale,35*percentScale,0),
                                child: new Text(
                                  "Today",
                                  style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: textColor,
                                  fontSize: 16*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  )
                                )
                              ),
                              new Container(
                                transform: Matrix4.translationValues(0,45*percentScale,0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //First Event
                                    eventContainer(darkMode, percentScale, "true","test", "all day", "25", "Sat.", "bones.png"),
                                    //Second event
                                    eventContainer(darkMode, percentScale, "true","test", "all day", "25", "Sat.", "bones.png"),
                                  ], 
                                ),
                              ),

                              //Tomorrow's events
                              new SizedBox(
                                height: 25*percentScale,
                              ),
                              new Container(
                                transform: Matrix4.translationValues(-122*percentScale,35*percentScale,0),
                                child: new Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: textColor,
                                  fontSize: 16*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  )
                                )
                              ),
                              new Container(
                                transform: Matrix4.translationValues(0,45*percentScale,0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //First Event
                                    eventContainer(darkMode, percentScale, "true","test2", "all day", "25", "Sat.", "bones.png"),
                                    //Second Event
                                    eventContainer(darkMode, percentScale, "true","test2", "all day", "25", "Sat.", "bones.png"),

                                  ], 
                                ),
                              ),

                              //This Week
                              new SizedBox(
                                height: 25*percentScale,
                              ),
                              new Container(
                                transform: Matrix4.translationValues(-120*percentScale,35*percentScale,0),
                                child: new Text(
                                  "This Week",
                                  style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: textColor,
                                  fontSize: 16*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  )
                                )
                              ),
                              new Container(
                                transform: Matrix4.translationValues(0,45*percentScale,0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //First Event
                                    eventContainer( darkMode, percentScale, "true","Bug Off", "10 AM - 6 PM", "21", "Sat.", "bones.png"),
                                    //Second Event
                                    eventContainer(darkMode, percentScale, "true","K.K. Slider", "6 PM - 12 AM", "23", "Sat.", "bones.png"),
                                    
                                  ], 
                                ),
                              ),
                            ], 
                          )
                        ]
                      ),
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
                              color: darkModeColor(darkMode,Color(0xffffdede),Color(0xFF0D0D0D)),
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
                              color: darkModeColor(darkMode,Color(0xffdefeff),Color(0xFF202020)),
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
                        ]
                      ),
                    ),
                  ],
                )
              )
            ),
          ],
        ),
    );
  }
}