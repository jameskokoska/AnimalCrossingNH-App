import 'main.dart';
import 'package:flutter/material.dart';

class FishList extends StatefulWidget {
  FishList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishList>{
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
            color: Color(0xFFDEFEFF),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 197*percentScale,
                backgroundColor: Color(0xFF00A1FF),
                pinned: true,
                //snap: true,
                floating: true,
                elevation: 10,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    transform: Matrix4.translationValues(0,-13*percentScale,0),
                    child: Text("Fish",
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
                  background: Image.asset('assets/fishTitle.png'),
                ),
              ),
              //SliverFillRemaining(
              //),
              new SliverList(
                  delegate: new SliverChildListDelegate(_buildList(50))
              ),
            ],
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