import 'main.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'databases.dart';


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
                  color: darkModeColor(darkMode, colorWhite, Color(0xffDEFEFF)),
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

//Widget activeCreature() {
  //if()
//}

class FishData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String shadow;
  final String totalCatchesToUnlock;
  final String rainSnow;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String color1;
  final String color2;
  final String size;
  final String lightingType;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final String catchphrase;
  final String museum;
  final bool caught;

  FishData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.shadow,this.totalCatchesToUnlock,this.rainSnow,
      this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
      this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
      this.color1,this.color2,this.size,this.lightingType,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);

}


class BugData{
  final String id;
  final String name;
  final String iconImage;
  final String critterpediaImage;
  final String furnitureImage;
  final String sell;
  final String whereHow;
  final String weather;
  final String totalCatchesToUnlock;
  final String nhJan;
  final String nhFeb;
  final String nhMar;
  final String nhApr;
  final String nhMay;
  final String nhJun;
  final String nhJul;
  final String nhAug;
  final String nhSep;
  final String nhOct;
  final String nhNov;
  final String nhDec;
  final String shJan;
  final String shFeb;
  final String shMar;
  final String shApr;
  final String shMay;
  final String shJun;
  final String shJul;
  final String shAug;
  final String shSep;
  final String shOct;
  final String shNov;
  final String shDec;
  final String color1;
  final String color2;
  final String iconFilename;
  final String critterpediaFilename;
  final String furnitureFilename;
  final String internalId;
  final String uniqueEntryId;
  final String catchphrase;
  final String museum;
  final bool caught;

  BugData(this.id, this.name,this.iconImage,this.critterpediaImage,this.furnitureImage,this.sell,this.whereHow,this.weather,this.totalCatchesToUnlock,
      this.nhJan,this.nhFeb,this.nhMar,this.nhApr,this.nhMay,this.nhJun,this.nhJul,this.nhAug,this.nhSep,this.nhOct,this.nhNov,this.nhDec,
      this.shJan,this.shFeb,this.shMar,this.shApr,this.shMay,this.shJun,this.shJul,this.shAug,this.shSep,this.shOct,this.shNov,this.shDec,
      this.color1,this.color2,this.iconFilename,this.critterpediaFilename,this.furnitureFilename,this.internalId,this.uniqueEntryId, this.catchphrase, this.museum, this.caught);

}
/*
Future<List<FishData>> getFishData(String search) async{
  String data = await rootBundle.loadString("assets/fish.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<FishData> fishData = [];
  for(var u in jsonData){
    getStoredBool("fishCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      FishData fishDatum = FishData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Shadow"],u["Total Catches to Unlock"],u["Rain/Snow Catch Up"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Size"],u["Lighting Type"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
      if(search == ''){
        fishData.add(fishDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        fishData.add(fishDatum);
      } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
        fishData.add(fishDatum);
      }
    });
  }
  return fishData;
}

Future<List<BugData>> getBugData(String search) async{
  String data = await rootBundle.loadString("assets/bug.json");

  final jsonData = json.decode(data);
  bool caught = false;
  List<BugData> bugData = [];
  for(var u in jsonData){
    getStoredBool("bugCheckList"+u["Name"], false).then((indexResult){
      caught = indexResult;
      BugData bugDatum = BugData(u["#"],u["Name"],u["Icon Image"],u["Critterpedia Image"],u["Furniture Image"],u["Sell"],u["Where/How"],u["Weather"],u["Total Catches to Unlock"],u["NH Jan"],u["NH Feb"],u["NH Mar"],u["NH Apr"],u["NH May"],u["NH Jun"],u["NH Jul"],u["NH Aug"],u["NH Sep"],u["NH Oct"],u["NH Nov"],u["NH Dec"],u["SH Jan"],u["SH Feb"],u["SH Mar"],u["SH Apr"],u["SH May"],u["SH Jun"],u["SH Jul"],u["SH Aug"],u["SH Sep"],u["SH Oct"],u["SH Nov"],u["SH Dec"],u["Color 1"],u["Color 2"],u["Icon Filename"],u["Critterpedia Filename"],u["Furniture Filename"],u["Internal ID"],u["Unique Entry ID"],u["Catchphrase"],u["Museum"],caught);
      if(search == ''){
        bugData.add(bugDatum);
      } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
        bugData.add(bugDatum);
      } else if (u["Where/How"].toLowerCase().contains(search.toLowerCase())){
        bugData.add(bugDatum);
      }
    });
  }
  return bugData;
}
*/
class _HomePageState extends State<Home>{
  bool morning = false;
  String currentTime;
  String afternoonString;
  String date;
  String weekday;

  
  @override
  void initState() {
    //seconds = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
    getTime();
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

    Color textColor;
    if(!darkMode)
      textColor = Color( 0xff000000);
    else
      textColor = Color( 0xffEAEAEA);

    double fossilsPercent = 10/50;
    double bugsPercent = 50/76;
    double fishPercent = 5/100;
    double musicPercent = 20/100;

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
                                    color: colorTextWhite,
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
                                  SizedBox(height: 19*percentScale),
                                  //Music progress bar
                                  new GestureDetector(
                                    onTap: (){
                                      print("music progress bar tapped");
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
                                            child: new Text("15 / 50",
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