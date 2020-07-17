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
  List seasonsRowSH = ["summer","summer","summer","fall","fall","fall","fall","fall","fall","fall","winter","winter","winter","winter","winter","spring","spring","spring","spring","spring","spring","spring","summer","summer"];
  List seasonsRowNH = ["winter","winter","winter","spring","spring","spring","spring","spring","spring","spring","summer","summer","fall","fall","fall","fall","fall","fall","fall","winter","winter","winter","winter"];
  List seasonsColumn = ["From", "To", "Days", "Shops", "Vegetation", "Rain/Snow", "Sky Effect", "Blossoms", "Petal/Leaf Fall", "Fog", "Special Clouds", "Seasonal Crafting 1", "Seasonal Crafting 2", "Seasonal Crafting 3"];
  List seasonsDataSH = [
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
  List seasonsDataNH = [
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
      floatingActionButton: floatingActionButton(percentScale, context),
      appBar: AppBar(
        title: Text(
          "Seasons Guide",
        ),
      ),
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