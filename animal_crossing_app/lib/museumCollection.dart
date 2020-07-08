import 'package:animal_crossing_app/creditsList.dart';
import 'package:animal_crossing_app/emojipedia.dart';
import 'package:animal_crossing_app/fishList.dart';
import 'package:animal_crossing_app/bugList.dart';
import 'package:animal_crossing_app/seaList.dart';
import 'package:animal_crossing_app/fossilList.dart';
import 'package:animal_crossing_app/music.dart';
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

  Widget toolsListSliver;

  Widget rugsListSliver;
  Widget floorsListSliver;
  Widget wallpapersListSliver;

  Widget villagerListSliver;

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
        length: 13,
        child: Scaffold(
          
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
                  ),
                  SeaList(),
                  BugList(),
                  EmojiList(),
                  MusicList(),
                  FishList(),
                  FossilList(),
                  GridList(
                    title: "Furniture",
                    sliverList: <Widget>[housewaresListSliver, miscellaneousListSliver, wallmountedListSliver, photosListSliver, postersListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorFurnitureAppBar,
                    accentColor: colorFurnitureAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 500,
                  ),
                  GridList(
                    title: "Clothing",
                    sliverList: <Widget>[headwearListSliver,accessoriesListSliver,topsListSliver,bottomsListSliver,socksListSliver,shoesListSliver,umbrellasListSliver,bagsListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorClothingAppBar,
                    accentColor: colorClothingAccent,
                    checkmark: true,
                    checkmarkColor: colorCheckGreen,
                    popupHeight: 450,
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
                  ),
                  GridList(
                    title: "Villagers",
                    sliverList: <Widget>[villagerListSliver],
                    titleColor: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
                    mainColor: colorVillagerAppBar,
                    accentColor: colorVillagerAccent,
                    checkmark: false,
                    checkmarkColor: colorVillagerCheck,
                    popupHeight: 450,
                  ),
                  CreditsList(),
                ],
              ),
              TabBar(
                tabs: <Widget>[
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                ],
              ),
            ]
          )
        )
      )
    );
  }
}