import 'package:animal_crossing_app/creditsList.dart';
import 'package:animal_crossing_app/emojipedia.dart';
import 'package:animal_crossing_app/fishList.dart';
import 'package:animal_crossing_app/bugList.dart';
import 'package:animal_crossing_app/seaList.dart';
import 'package:animal_crossing_app/fossilList.dart';
import 'package:animal_crossing_app/music.dart';
import 'package:animal_crossing_app/artList.dart';
import 'gridList.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class MuseumPage extends StatefulWidget {
  MuseumPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MuseumPageState createState() => _MuseumPageState();
}

class _MuseumPageState extends State<MuseumPage>{


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


    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          floatingActionButton: floatingActionButton(percentScale, context, true),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  FishList(),
                  BugList(),
                  SeaList(),
                  FossilList(),
                  ArtList(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height:48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15*percentScale)),
                        color: colorWhite,                     
                        boxShadow: [
                          BoxShadow(color: colorShadow, spreadRadius: 2),
                        ],
                      ),
                    ),
                    TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15*percentScale),
                        color: colorSelectedAccent,
                      ),
                      labelColor: colorTextBlack,
                      tabs: <Widget>[
                        Tab(text:'Fish',),
                        Tab(text:'Bugs'),
                        Tab(text:'Sea'),
                        Tab(text:'Fossils'),
                        Tab(text:'Art'),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}


class ItemsPage extends StatefulWidget {
  ItemsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage>{
  Widget housewaresListSliver;
  Widget miscellaneousListSliver;
  Widget wallmountedListSliver;
  Widget photosListSliver;
  Widget postersListSliver;

  Widget headwearListSliver;
  Widget accessoriesListSliver;
  Widget topsListSliver;
  Widget bottomsListSliver;
  Widget socksListSliver;
  Widget shoesListSliver;
  Widget umbrellasListSliver;
  Widget bagsListSliver;
  Widget wetsuitListSliver;
  Widget dressupListSliver;

  Widget rugsListSliver;
  Widget floorsListSliver;
  Widget wallpapersListSliver;

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


    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: floatingActionButton(percentScale, context, true),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  GridList(
                    title: "Furniture",
                    sliverList: <Widget>[housewaresListSliver, miscellaneousListSliver, wallmountedListSliver, photosListSliver, postersListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorFurnitureAppBar,
                    accentColor: colorFurnitureAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 500,
                    smallContainer: false
                  ),
                  GridList(
                    title: "Clothing",
                    sliverList: <Widget>[headwearListSliver,accessoriesListSliver,topsListSliver,bottomsListSliver,socksListSliver,shoesListSliver,umbrellasListSliver,bagsListSliver,wetsuitListSliver,dressupListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorClothingAppBar,
                    accentColor: colorClothingAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 450,
                    smallContainer: false
                  ),
                  GridList(
                    title: "Floor & Wall",
                    sliverList: <Widget>[rugsListSliver,floorsListSliver,wallpapersListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorFloorWallAppBar,
                    accentColor: colorFloorWallAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 450,
                    smallContainer: false
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height:48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15*percentScale)),
                        color: colorWhite,                     
                        boxShadow: [
                          BoxShadow(color: colorShadow, spreadRadius: 2),
                        ],
                      ),
                    ),
                    TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15*percentScale),
                        color: colorSelectedAccent,
                      ),
                      labelColor: colorTextBlack,
                      tabs: <Widget>[
                        Tab(text:'Furniture',),
                        Tab(text:'Floor & Walls'),
                        Tab(text:'Clothing'),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}


class CraftingToolsPage extends StatefulWidget {
  CraftingToolsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CraftingToolsPageState createState() => _CraftingToolsPageState();
}

class _CraftingToolsPageState extends State<CraftingToolsPage>{
  Widget toolsListSliver;

  Widget craftablesListSliver;

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

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: floatingActionButton(percentScale, context, true),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  GridList(
                    title: "Recipes",
                    sliverList: <Widget>[craftablesListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorToolsAppBar,
                    accentColor: colorToolsAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 500,
                    smallContainer: false
                  ),
                  GridList(
                    title: "Tools",
                    sliverList: <Widget>[toolsListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorToolsAppBar,
                    accentColor: colorToolsAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 400,
                    smallContainer: false
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height:48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15*percentScale)),
                        color: colorWhite,                     
                        boxShadow: [
                          BoxShadow(color: colorShadow, spreadRadius: 2),
                        ],
                      ),
                    ),
                    TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15*percentScale),
                        color: colorSelectedAccent,
                      ),
                      labelColor: colorTextBlack,
                      tabs: <Widget>[
                        Tab(text:'Recipes',),
                        Tab(text:'Tools'),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}


class SeasonsPage extends StatefulWidget {
  SeasonsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SeasonsPageState createState() => _SeasonsPageState();
}

class _SeasonsPageState extends State<SeasonsPage>{
  List seasonsRowSH;
  List seasonsRowNH;
  List seasonsColumn;
  List seasonsDataSH;
  List seasonsDataNH;

  @override
  void initState(){
    seasonsRowSH = ["summer","summer","summer","fall","fall","fall","fall","fall","fall","fall","winter","winter","winter","winter","winter","spring","spring","spring","spring","spring","spring","spring","summer","summer"];
    seasonsRowNH = ["winter","winter","winter","spring","spring","spring","spring","spring","spring","spring","summer","summer","fall","fall","fall","fall","fall","fall","fall","winter","winter","winter","winter"];
    seasonsColumn = ["From", "To", "Days", "Shops", "Vegetation", "Rain/Snow", "Sky Effect", "Blossoms", "Petal/Leaf Fall", "Fog", "Special Clouds", "Seasonal Crafting 1", "Seasonal Crafting 2", "Seasonal Crafting 3"];
    seasonsDataSH = [
      ["Jan 1", "Jan 6", 6, "summer", "summer", "rain", "rainbow", "hydrangea", "—", "—", "—", "🐚 summer shells", "🎄 ornaments", "—"], 
      ["Jan 7", "Jan 20", 14, "summer", "summer", "rain", "rainbow", "hydrangea", "—", "—", "—", "🐚 summer shells", "—", "—"], 
      ["Jan 21", "Feb 29", 40, "summer", "summer", "rain", "rainbow", "hibiscus", "—", "—", "cumulonimbus", "🐚 summer shells", "—", "—"], 
      ["Mar 1", "Mar 15", 15, "fall", "fall 1", "rain", "rainbow", "hibiscus", "—", "—", "cumulonimbus", "🌲 acorns and pine cones", "—", "—"], 
      ["Mar 16", "Mar 20", 5, "fall", "fall 2", "rain", "rainbow", "hibiscus", "—", "—", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["Mar 21", "Apr 19", 30, "fall", "fall 2", "rain", "rainbow", "tea olive", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["Apr 20", "Apr 30", 11, "fall", "fall 3", "rain", "rainbow", "tea olive", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["May 1", "May 15", 15, "fall", "fall 3", "rain", "rainbow", "holly", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "—"], 
      ["May 16", "May 24", 9, "fall", "fall 3", "rain", "rainbow", "holly", "leaves (light effect)", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "🍁 maple leaves"], 
      ["May 25", "May 25", 1, "fall", "fall 3", "rain", "rainbow", "holly", "leaves (heavy effect)", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "🍁 maple leaves"], 
      ["May 26", "May 31", 6, "fall", "fall 3", "snow", "—", "holly", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "—"], 
      ["Jun 1", "Jun 10", 10, "winter", "fall 3", "snow", "—", "holly", "—", "river/sea fog; heavy fog", "billow clouds", "🌲 acorns and pine cones", "—", "—"], 
      ["Jun 11", "Jun 15", 5, "winter", "winter 1", "snow cover", "aurora", "holly", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Jun 16", "Aug 10", 56, "winter", "winter 1", "snow cover", "aurora", "camellia", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Aug 11", "Aug 24", 14, "winter", "winter 2", "snow cover", "aurora", "camellia", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Aug 25", "Aug 31", 7, "winter", "winter 2", "rain", "rainbow", "camellia", "—", "river/sea fog", "billow clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Sep 1", "Sep 19", 19, "spring", "winter 2", "rain", "rainbow", "camellia", "—", "river/sea fog", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Sep 20", "Sep 30", 11, "spring", "spring", "rain", "rainbow", "camellia", "—", "river/sea fog", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Oct 1", "Oct 6", 6, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (catchable only)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Oct 7", "Oct 9", 3, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (light effect)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Oct 10", "Oct 10", 1, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (heavy effect)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Oct 11", "Nov 30", 51, "spring", "spring", "rain", "rainbow", "azalea", "—", "—", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Dec 1", "Dec 14", 14, "summer", "summer", "rain", "rainbow", "hydrangea", "—", "—", "—", "🐚 summer shells", "—", "—"], 
      ["Dec 15", "Dec 31", 17, "summer", "summer", "rain", "rainbow", "hydrangea", "—", "—", "—", "🐚 summer shells", "🎄 ornaments", "—"]
    ];
    seasonsDataNH = [
      ["Jan 1", "Jan 6", 6, "winter", "winter 1", "snow cover", "aurora", "camellia", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "🎄 ornaments", "—"], 
      ["Jan 7", "Feb 10", 35, "winter", "winter 1", "snow cover", "aurora", "camellia", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Feb 11", "Feb 24", 14, "winter", "winter 2", "snow cover", "aurora", "camellia", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Feb 25", "Feb 29", 5, "winter", "winter 2", "rain", "rainbow", "camellia", "—", "river/sea fog", "billow clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Mar 1", "Mar 19", 19, "spring", "winter 2", "rain", "rainbow", "camellia", "—", "river/sea fog", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Mar 20", "Mar 31", 12, "spring", "spring", "rain", "rainbow", "camellia", "—", "river/sea fog", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Apr 1", "Apr 6", 6, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (catchable only)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Apr 7", "Apr 9", 3, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (light effect)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Apr 10", "Apr 10", 1, "spring", "spring", "rain", "rainbow", "cherry blossoms", "petals (heavy effect)", "—", "thin clouds", "🎋 young spring bamboo", "🌸 cherry-blossom petals", "—"], 
      ["Apr 11", "May 31", 51, "spring", "spring", "rain", "rainbow", "azalea", "—", "—", "thin clouds", "🎋 young spring bamboo", "—", "—"], 
      ["Jun 1", "Jul 20", 50, "summer", "summer", "rain", "rainbow", "hydrangea", "—", "—", "—", "🐚 summer shells", "—", "—"], 
      ["Jul 21", "Aug 31", 42, "summer", "summer", "rain", "rainbow", "hibiscus", "—", "—", "cumulonimbus", "🐚 summer shells", "—", "—"], 
      ["Sep 1", "Sep 15", 15, "fall", "fall 1", "rain", "rainbow", "hibiscus", "—", "—", "cumulonimbus", "🌲 acorns and pine cones", "—", "—"], 
      ["Sep 16", "Sep 20", 5, "fall", "fall 2", "rain", "rainbow", "hibiscus", "—", "—", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["Sep 21", "Oct 20", 30, "fall", "fall 2", "rain", "rainbow", "tea olive", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["Oct 21", "Oct 31", 11, "fall", "fall 3", "rain", "rainbow", "tea olive", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "—", "—"], 
      ["Nov 1", "Nov 15", 15, "fall", "fall 3", "rain", "rainbow", "holly", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "—"], 
      ["Nov 16", "Nov 24", 9, "fall", "fall 3", "rain", "rainbow", "holly", "leaves (light effect)", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "🍁 maple leaves"], 
      ["Nov 25", "Nov 25", 1, "fall", "fall 3", "rain", "rainbow", "holly", "leaves (heavy effect)", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "🍁 maple leaves"], 
      ["Nov 26", "Nov 30", 5, "fall", "fall 3", "snow", "—", "holly", "—", "river/sea fog; heavy fog", "cirrus; cirrocumulus", "🌲 acorns and pine cones", "🍄 mushrooms", "—"], 
      ["Dec 1", "Dec 10", 10, "winter", "fall 3", "snow", "—", "holly", "—", "river/sea fog; heavy fog", "billow clouds", "🌲 acorns and pine cones", "—", "—"], 
      ["Dec 11", "Dec 14", 4, "winter", "winter 1", "snow cover", "aurora", "holly", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "—", "—"], 
      ["Dec 15", "Dec 31", 17, "winter", "winter 1", "snow cover", "aurora", "holly", "—", "river/sea fog; heavy fog", "billow clouds", "❄️ snowflakes", "🎄 ornaments", "—"]
    ];
  }
  
  Widget buildCell(var data, [bool stickyBar=false, bool keyCell=false]) {
    return Container(
      width: 200,
      height: 130,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: determineSeasonColor(data, stickyBar, keyCell),
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0),
        )
      ),
      margin: EdgeInsets.all(5),
      child: Center(
        child: Text(
          capitalize(data),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'ArialRoundedBold',
            color: colorTextBlack,
            fontSize: 27,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        )
      ),
    );
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
      appBar: AppBar(
        title: Text(
          "Seasons Guide",
        ),
      ),
      bottomNavigationBar: SizedBox(height:48),
      body: StickyHeadersTable(
        columnsLength: seasonsColumn.length,
        rowsLength: (){
          if(northernHemisphere)
            return seasonsRowNH.length;
          else
            return seasonsRowSH.length;
        }(),
        columnsTitleBuilder: (i) => buildCell(seasonsColumn[i].toString(),true),
        rowsTitleBuilder: (i) => buildCell((){
          if(northernHemisphere)
            return seasonsRowNH[i].toString();
          else
            return seasonsRowSH[i].toString();
        }(),true),
        contentCellBuilder: (i, j) => buildCell((){
          if(northernHemisphere)
            return seasonsDataNH[j][i].toString();
          else
            return seasonsDataSH[j][i].toString();
        }()),
        legendCell: buildCell('Seasons',true,true),
        cellDimensions: CellDimensions(
          contentCellHeight: 70,
          contentCellWidth: 100,
          stickyLegendHeight: 70,
          stickyLegendWidth: 100,
        ),
      ),
    );
  }
}

determineSeasonColor(String seasonString, [bool stickyBar = false, bool keyCell = false]){
  if(seasonString.contains("fall"))
    return Color(0xFFffcc80).withOpacity(0.4);
  else if(seasonString.contains("winter"))
    return Color(0xFF81d4fa).withOpacity(0.4);
  else if(seasonString.contains("summer"))
    return Color(0xFFa5d6a7).withOpacity(0.4);
  else if(seasonString.contains("spring"))
    return Color(0xFFF5A6C0).withOpacity(0.4);
  else if(seasonString.contains("rainbow"))
    return Color(0xFFFfff59d).withOpacity(0.4);
  else if(seasonString.contains("aurora"))
    return Color(0xFFFe1bee7).withOpacity(0.4);
  else if(seasonString.contains("rain"))
    return Color(0xFFBCE3FF).withOpacity(0.4);
  else if(seasonString.contains("snow"))
    return Color(0xFFbbdefb).withOpacity(0.4);
  else if(seasonString.contains("petals"))
    return Color(0xFFf8bbd0).withOpacity(0.4);
  else if(seasonString.contains("cherry"))
    return Color(0xFFFf8bbd0).withOpacity(0.4);
  else if(stickyBar&&!keyCell)
    return colorSelectedAccent.withOpacity(0.5);
  else if(keyCell)
    return colorSelectedAccent;
  else
    return colorLightDarkAccent;
}

class TVPage extends StatefulWidget {
  TVPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TVPageState createState() => _TVPageState();
}

class _TVPageState extends State<TVPage>{
  List timeRow;
  List dayCol;
  List televisionData;

  @override
  void initState(){
    timeRow = ["00:00", "00:57", "01:00", "02:45", "03:00", "03:34", "04:00", "05:00", "05:55", "06:00", "06:15", "06:59", "07:00", "07:29", 
    "07:30", "07:45", "07:59", "08:00", "08:29", "08:30", "08:59", "09:00", "09:18", "09:19", "09:20", 
    "09:29", "09:30", "09:59", "10:00", "10:29", "10:30", "10:59", "11:00", "11:29", "11:30", "11:45", "11:59", "12:00", "12:29", 
    "12:30", "12:59", "13:00", "13:29", "13:30", "13:58", "13:59", "14:00", "14:29", "14:30", "14:59", "15:00", "15:29", "15:30", 
    "15:50", "15:51", "15:59", "16:00", "16:29", "16:30", "16:59", "17:00", "17:29", "17:30", "17:58", "17:59", "18:00", "18:29", 
    "18:30", "18:45", "18:59", "19:00", "19:30", "19:50", "19:51", "19:57", "19:59", "20:00", "20:29", "20:30", "20:57", "20:58", "20:59", 
    "21:00", "21:29", "21:30", "21:53", "21:54", "21:55", "21:59", "22:00", "22:44", "22:45", "22:59", "23:00", "23:29", "23:30", "23:55"];
    dayCol = ["Monday", "Tuesday ", "Wednesday ", "Thursday", "Friday", "Saturday", "Sunday"];
    televisionData = [
      ["variety show", "talk show", "documentary", "variety show", "variety show", "color bars", "music program"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "—", "shopping commercial"], 
      ["documentary", "movie", "documentary", "sports", "documentary", "static", "documentary"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "—", "color bars"], 
      ["color bars", "color bars", "color bars", "color bars", "color bars", "—", "—"], 
      ["—", "—", "—", "—", "—", "secret program", "—"], 
      ["—", "—", "—", "—", "—", "static", "—"], 
      ["static", "static", "static", "static", "static", "—", "static"], 
      ["color bars", "color bars", "color bars", "color bars", "color bars", "color bars", "color bars"], 
      ["snack commercial", "corporate commercial", "snack commercial", "snack commercial", "corporate commercial", "snack commercial", "corporate commercial"], 
      ["news", "news", "news", "news", "news", "news", "news"], 
      ["weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast"], 
      ["exercise", "exercise", "exercice", "exercise", "exercise", "exercise", "exercise"], 
      ["shopping commercial", "fruit commercial", "seasonal commercial", "shopping commercial", "fruit commercial", "seasonal commercial", "fruit commercial"], 
      ["news", "news", "news", "news", "news", "news", "kid's show"], 
      ["—", "—", "—", "—", "—", "—", "fruit commercial"], 
      ["—", "—", "—", "—", "—", "—", "kid's show"], 
      ["weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "—"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "seasonal commercial", "snack commercial"], 
      ["drama", "drama", "drama", "drama", "drama", "variety show", "cartoon"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "corporate commercial", "seasonal commercial"], 
      ["documentary", "documentary", "documentary", "documentary", "documentary", "variety show", "cartoon"], 
      ["—", "—", "—", "—", "—", "snack commercial", "snack commercial"], 
      ["—", "—", "—", "—", "—", "documentary", "quiz show"], 
      ["seasonal commercial", "seasonal commercial", "seasonal commercial", "seasonal commercial", "seasonal commercial", "—", "—"], 
      ["fruit commercial", "fruit commercial", "fruit commercial", "fruit commercial", "fruit commercial", "—", "—"], 
      ["documentary", "documentary", "documentary", "documentary", "documentary", "—", "—"], 
      ["—", "—", "—", "—", "—", "shopping commercial", "shopping commercial"], 
      ["—", "—", "—", "—", "—", "documentary", "quiz show"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "snack commercial"], 
      ["kid's show", "cartoon", "kid's show", "kid's show", "cartoon", "kid's show", "variety show"], 
      ["fruit commercial", "fruit commercial", "snack commercial", "snack commercial", "snack commercial", "fruit commercial", "snack commercial"], 
      ["kid's show", "cartoon", "kid's show", "kid's show", "cartoon", "kid's show", "variety show"], 
      ["corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial"], 
      ["cooking show", "cooking show", "cooking show", "cooking show", "cooking show", "news", "news"], 
      ["fruit commercial", "seasonal commercial", "fruit commercial", "seasonal commercial", "fruit commercial", "—", "—"], 
      ["news", "news", "news", "news", "news", "—", "—"], 
      ["weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast"], 
      ["seasonal commercial", "shopping commercial", "seasonal commercial", "shopping commercial", "seasonal commercial", "shopping commercial", "shopping commercial"], 
      ["variety show", "variety show", "variety show", "variety show", "variety show", "variety show", "talk show"], 
      ["fruit commercial", "fruit commercial", "fruit commercial", "fruit commercial", "fruit commercial", "fruit commercial", "snack commercial"], 
      ["variety show", "variety show", "variety show", "variety show", "variety show", "variety show", "talk show"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial"], 
      ["drama", "drama", "drama", "drama", "drama", "talk show", "sports"], 
      ["corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "—", "shopping commercial"], 
      ["talk show", "talk show", "talk show", "talk show", "drama", "—", "sports"], 
      ["fruit commercial", "—", "—", "—", "fruit commercial", "—", "—"], 
      ["snack commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "—"], 
      ["variety show", "documentary", "variety show", "variety show", "talk show", "documentary", "—"], 
      ["fruit commercial", "seasonal commercial", "fruit commercial", "fruit commercial", "snack commercial", "snack commercial", "—"], 
      ["variety show", "documentary", "variety show", "variety show", "talk show", "documentary", "—"], 
      ["shopping commercial", "shopping commercial", "seasonal commercial", "shopping commercial", "seasonal commercial", "seasonal commercial", "seasonal commercial"], 
      ["exercise", "exercise", "exercise", "exercise", "exercise", "sports", "quiz show"], 
      ["corporate commercial", "snack commercial", "fruit commercial", "snack commercial", "fruit commercial", "—", "snack commercial"], 
      ["exercise", "exercise", "exercise", "exercise", "exercise", "—", "quiz show"], 
      ["—", "—", "—", "—", "—", "snack commercial", "—"], 
      ["—", "—", "—", "—", "—", "sports", "—"], 
      ["seasonal commercial", "seasonal commercial", "seasonal commercial", "seasonal commercial", "seasonal commercial", "—", "seasonal commercial"], 
      ["cartoon", "kid's show", "cartoon", "kid's show", "kid's show", "—", "cooking show"], 
      ["snack commercial", "snack commercial", "snack commercial", "corporate commercial", "snack commercial", "—", "snack commercial"], 
      ["cartoon", "cooking show", "cartoon", "kid's show", "kid's show", "—", "cooking show"], 
      ["corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "seasonal commercial", "fruit commercial"], 
      ["variety show", "variety show", "variety show", "variety show", "variety show", "variety show", "variety show"], 
      ["seasonal commercial", "snack commercial", "fruit commercial", "snack commercial", "snack commercial", "snack commercial", "seasonal commercial"], 
      ["variety show", "variety show", "variety show", "variety show", "variety show", "variety show", "variety show"], 
      ["—", "—", "—", "—", "fruit commercial", "—", "—"], 
      ["fruit commercial", "fruit commercial", "seasonal commercial", "fruit commercial", "seasonal commercial", "corporate commercial", "corporate commercial"], 
      ["news", "news", "news", "news", "news", "news", "cartoon"], 
      ["—", "—", "—", "—", "—", "—", "fruit commercial"], 
      ["weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "—", "cartoon"], 
      ["—", "—", "—", "—", "—", "weather forecast", "—"], 
      ["corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial", "corporate commercial"], 
      ["variety show", "sports", "cooking show", "cartoon", "sports", "quiz show", "sports"], 
      ["seasonal commercial", "—", "seasonal commercial", "seasonal commercial", "—", "seasonal commercial", "—"], 
      ["variety show", "—", "cooking show", "cartoon", "—", "quiz show", "—"], 
      ["—", "corporate commercial", "—", "—", "—", "—", "seasonal commercial"], 
      ["—", "sports", "—", "—", "—", "—", "sports"], 
      ["—", "—", "—", "—", "shopping commercial", "—", "—"], 
      ["snack commercial", "—", "snack commercial", "snack commercial", "—", "snack commercial", "—"], 
      ["quiz show", "—", "music program", "documentary", "sports", "variety show", "—"], 
      ["fruit commercial", "—", "seasonal commercial", "seasonal commercial", "—", "—", "—"], 
      ["quiz show", "—", "music program", "documentary", "—", "—", "—"], 
      ["fruit commercial", "fruit commercial", "snack commercial", "snack commercial", "corporate commercial", "fruit commercial", "corporate commercial"], 
      ["seasonal commercial", "shopping commercial", "corporate commercial", "corporate commercial", "snack commercial", "seasonal commercial", "snack commercial"], 
      ["corporate commercial", "seasonal commercial", "shopping commercial", "shopping commercial", "seasonal commercial", "snack commercial", "seasonal commercial"], 
      ["drama", "talk show", "drama", "drama", "music program", "movie", "movie"], 
      ["seasonal commercial", "corporate commercial", "seasonal commercial", "seasonal commercial", "corporate commercial", "—", "—"], 
      ["drama", "talk show", "drama", "drama", "music program", "—", "—"], 
      ["—", "—", "—", "—", "—", "—", "snack commercial"], 
      ["—", "—", "—", "—", "—", "corporate commercial", "corporate commercial"], 
      ["—", "—", "—", "—", "—", "movie", "movie"], 
      ["fruit commercial", "snack commercial", "snack commercial", "corporate commercial", "fruit commercial", "—", "—"], 
      ["news", "news", "news", "news", "news", "—", "—"], 
      ["—", "—", "—", "—", "—", "seasonal commercial", "snack commercial"], 
      ["weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast", "weather forecast"], 
      ["shopping commercial", "seasonal commercial", "shopping commercial", "seasonal commercial", "seasonal commercial", "—", "—"], 
      ["variety show", "documentary", "quiz show", "variety show", "quiz show", "news", "news"], 
      ["corporate commercial", "corporate commercial", "corporate commercial", "snack commercial", "fruit commercial", "shopping commercial", "—"], 
      ["variety show", "documentary", "quiz show", "variety show", "quiz show", "cooking show", "—"], 
      ["shopping commercial", "shopping commercial", "shopping commercial", "shopping commercial", "corporate commercial", "corporate commercial", "seasonal commercial"]
    ];
  }
  Widget buildCell(var data, [bool stickyBar=false, bool keyCell=false, bool time=false]) {
    return Container(
      width: 200,
      height: 130,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: determineTVColor(data, stickyBar, keyCell, time),
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0),
        )
      ),
      margin: EdgeInsets.all(5),
      child: Center(
        child: Text(
          capitalize(data),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'ArialRoundedBold',
            color: colorTextBlack,
            fontSize: 27,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        )
      ),
    );
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
      appBar: AppBar(
        title: Text(
          "Television Program Guide",
        ),
      ),
      bottomNavigationBar: SizedBox(height:48),
      body: StickyHeadersTable(
        columnsLength: dayCol.length,
        rowsLength: timeRow.length,
        columnsTitleBuilder: (i) => buildCell(dayCol[i].toString(),true),
        rowsTitleBuilder: (i) => buildCell(timeRow[i].toString(),true, false, true),
        contentCellBuilder: (i, j) => buildCell(televisionData[j][i].toString()),
        legendCell: buildCell('Time',true,true),
        cellDimensions: CellDimensions(
          contentCellHeight: 70,
          contentCellWidth: 100,
          stickyLegendHeight: 70,
          stickyLegendWidth: 100,
        ),
      ),
    );
  }
}

bool highlightedTime = false;
determineTVColor(String tvString, [bool stickyBar = false, bool keyCell = false, bool time=false]){
  highlightedTime = false;
  if(tvString.contains("news"))
    return Color(0xFFffcc80).withOpacity(0.4);
  else if(tvString.contains("weather"))
    return Color(0xFF81d4fa).withOpacity(0.4);
  else if(tvString.contains("—"))
    return Color(0x00000000).withOpacity(0);
  else if(DateTime.now().weekday==1&&tvString.contains("Monday")||DateTime.now().weekday==2&&tvString.contains("Tuesday")||DateTime.now().weekday==3&&tvString.contains("Wednesday")||DateTime.now().weekday==4&&tvString.contains("Thursday")||DateTime.now().weekday==5&&tvString.contains("Friday")||DateTime.now().weekday==6&&tvString.contains("Saturday")||DateTime.now().weekday==7&&tvString.contains("Sunday"))
    return Color(0xFFFF511C).withOpacity(0.4);
  else if(time==true&&DateTime.now().hour==int.parse(tvString.substring(0,2))&&DateTime.now().minute>=int.parse(tvString.substring(3,5))){
    highlightedTime=true;
    return Color(0xFFFF511C).withOpacity(0.4);
  } else if (highlightedTime==false&&time==true&&DateTime.now().hour-1==int.parse(tvString.substring(0,2))&&DateTime.now().minute>=int.parse(tvString.substring(3,5))){
    highlightedTime=true;
    return Color(0xFFFF511C).withOpacity(0.4);
  }
  else if(stickyBar&&!keyCell)
    return colorSelectedAccent.withOpacity(0.5);
  else if(keyCell)
    return colorSelectedAccent;
  else
    return colorLightDarkAccent;
}

class MiscPage extends StatefulWidget {
  MiscPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MiscPageState createState() => _MiscPageState();
}

class _MiscPageState extends State<MiscPage>{


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


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: floatingActionButton(percentScale, context, true),
        body: Stack(
          children: <Widget>[
            TabBarView(
              children: <Widget>[
                TVPage(),
                SeasonsPage(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Container(
                    height:48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15*percentScale)),
                      color: colorWhite,                     
                      boxShadow: [
                        BoxShadow(color: colorShadow, spreadRadius: 2),
                      ],
                    ),
                  ),
                  TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15*percentScale),
                      color: colorSelectedAccent,
                    ),
                    labelColor: colorTextBlack,
                    tabs: <Widget>[
                      Tab(text:'Television',),
                      Tab(text:'Seasons'),
                    ],
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}