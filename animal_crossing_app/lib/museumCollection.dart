import 'package:animal_crossing_app/emojipedia.dart';
import 'package:animal_crossing_app/fishList.dart';
import 'package:animal_crossing_app/bugList.dart';
import 'package:animal_crossing_app/floorWallList.dart';
import 'package:animal_crossing_app/fossilList.dart';
import 'package:animal_crossing_app/music.dart';
import 'package:animal_crossing_app/settingList.dart';
import 'package:animal_crossing_app/villagerList.dart';
import 'package:animal_crossing_app/toolsList.dart';
import 'package:animal_crossing_app/clothinglist.dart';
import 'package:animal_crossing_app/furniturelist.dart';

import 'package:flutter/material.dart';


class MuseumPage extends StatefulWidget {
  MuseumPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MuseumPageState createState() => _MuseumPageState();
}



class _MuseumPageState extends State<MuseumPage>{

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
        length: 10,
        child: Scaffold(
          
          body: Stack(
            children: <Widget>[
              
              TabBarView(
                children: <Widget>[
                  FurnitureList(),
                  ClothingList(),
                  ToolsList(),
                  FloorWallsList(),
                  BugList(),
                  EmojiList(),
                  VillagerList(),
                  MusicList(),
                  FishList(),
                  FossilList(),
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
                  Tab(text:'')
                ],
              ),
            ]
          )
        )
      )
    );
  }
}