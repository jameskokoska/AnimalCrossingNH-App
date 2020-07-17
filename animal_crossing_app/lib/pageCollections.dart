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
                        Tab(text:'Artwork'),
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