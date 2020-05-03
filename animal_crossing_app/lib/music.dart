import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class MusicList extends StatefulWidget {
  MusicList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicList>{
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

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF81C0FF),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 197*percentScale,
                backgroundColor: Colors.transparent,
                //pinned: true,
                //snap: true,
                //floating: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    transform: Matrix4.translationValues(0,-13*percentScale,0),
                    child: Text("K.K. Songs",
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: Color(0xffffffff),
                        fontSize: 30*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                  titlePadding: EdgeInsetsDirectional.only(start: 25*percentScale),
                ),
              ),
              //SliverFillRemaining(
              //),
              new SliverList(
                  delegate: new SliverChildListDelegate(_buildList(50))
              ),
            ],
          ),
          IgnorePointer(
            child: new Align(
              alignment: Alignment.topCenter,
              child: Container(
                transform: Matrix4.translationValues(0,-550*percentScale,0),
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(180 / 360),
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Color(0xaF2b74e3), Color(0xaF2b74e3)],
                        [Color(0xaf3089ee), Color(0xaf3089ee)],
                        [Color(0xaf3a7aee), Color(0xaf3a7aee)],
                        [Color(0xaf5c94ff), Color(0xaF5C94FF)]
                      ],
                      durations: [6000, 25000, 13000, 32000],
                      heightPercentages: [0.1, 0.12, 0.14, 0.16],
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    backgroundColor: Colors.transparent,
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 13,
                  ),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: new Align(
              alignment: Alignment.topCenter,
              child: Container(
                transform: Matrix4.translationValues(0,480*percentScale,0),
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Color(0xaF2b74e3), Color(0xaF2b74e3)],
                      [Color(0xaf3089ee), Color(0xaf3089ee)],
                      [Color(0xaf3a7aee), Color(0xaf3a7aee)],
                      [Color(0xaf5c94ff), Color(0xaF5C94FF)]
                    ],
                    durations: [30000, 20000, 11000, 8000],
                    heightPercentages: [0.10, 0.11, 0.12, 0.13],
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  backgroundColor: Colors.transparent,
                  size: Size(double.infinity, double.infinity),
                  waveAmplitude: 8,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

List _buildList(int count) {
      List<Widget> listItems = List();
  
      for (int i = 0; i < count; i++) {
        listItems.add(new Padding(padding: new EdgeInsets.all(20.0),
            child: new Text(
                'Item ${i.toString()}',
                style: new TextStyle(fontSize: 25.0)
            )
        ));
      }
  
      return listItems;
}
