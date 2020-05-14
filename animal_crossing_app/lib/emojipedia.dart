import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:convert';


class EmojiList extends StatefulWidget {
  EmojiList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmojiListPageState createState() => _EmojiListPageState();
}

String searchEmoji = '';

class EmojiData{
  final String name;
  final String imageLink;
  final String source;
  final bool collected;

  EmojiData(this.name, this.imageLink, this.source,this.collected);
}

class _EmojiListPageState extends State<EmojiList>{

  Future<List<EmojiData>> getEmojiData(String search) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/emojis.json");

    final jsonData = json.decode(data);
    bool collected = false;
    List<EmojiData> emojiData = [];
    for(var u in jsonData){
      getStoredBool("emojiCheckList"+u["Name"], false).then((indexResult){
        collected = indexResult;
        EmojiData villagerDatum = EmojiData(u["Name"],u["Image"],u["Source"],collected);
        if(search == ''){
          emojiData.add(villagerDatum);
        } else if (u["Name"].toLowerCase().contains(search.toLowerCase())){
          emojiData.add(villagerDatum);
        }
      });
    }
    return emojiData;
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
    
    double top = 0;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color( 0xffFFFFFF)),
            ),
            FutureBuilder(
              future: getEmojiData(searchEmoji),
              builder: (context,snapshot){
                Widget emojiListSliver;
                if(snapshot.hasData){
                  emojiListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    sliver: new SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 17,
                        childAspectRatio: 0.78,
                      ),
                      delegate: 
                      SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return emojiContainer(percentScale, colorTextBlack, snapshot.data[index].name, snapshot.data[index].imageLink,snapshot.data[index].source,snapshot.data[index].collected);
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  emojiListSliver = SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:100*percentScale,
                        ),
                        SpinKitThreeBounce(
                          color: darkModeColor(darkMode, Color(0xFF2DA6F7), Color(0xFF8BBADA)),
                          size:80,
                        )
                      ],
                    )
                  );
                }
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: Color(0xFFFFF176),
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 10,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,10*percentScale-(top/6.8)*percentScale,0),
                              child: Text("Emojipedia",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: colorTextBlack,
                                  fontSize: 30*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                              ),
                            ),
                            titlePadding: EdgeInsets.only(left: 30*percentScale, bottom: 20),
                            background: Stack(
                              children: <Widget>[
                                  Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:20,right:10),
                                      child: Opacity(
                                        opacity: (){
                                          print(top);
                                          if(top<280&&top>190){
                                            return 1-((280-top)/90);
                                          } else {
                                            return 0.0;
                                          }
                                        }(),
                                        child: Container(
                                          height: 35*percentScale,
                                          width: 300*percentScale,
                                          child: CupertinoTextField(
                                            onTap: (){
                                              searchEmoji='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchEmoji==''){
                                                  return 'Search';
                                                } else {
                                                  return searchEmoji;
                                                }
                                            }(),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Color(0x75D4D4D4),
                                            ),
                                            prefix: Padding(
                                              padding:
                                                  const EdgeInsets.only(right:13, left:7),
                                              child: Icon(
                                                Icons.search,
                                                color: Color(0xAD6B6B6B),
                                              ),
                                            ),
                                            onChanged: (string){
                                              setState(() {
                                                searchEmoji = string;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:Container(
                        height:20*percentScale,
                      )
                    ),
                    emojiListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:120*percentScale,
                      )
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      )
    );
  }
}

Widget emojiContainer(double percentScale, Color colorTextBlack, String name, String imageLink, String source, bool collected){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return new Stack(
            children: <Widget>[
              Container(
                width: 120*percentScale,
                height: 162*percentScale,
                decoration: new BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                      color: Color(0x0C000000),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                  ) ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  transform: Matrix4.translationValues(0,5*percentScale,0),
                  child: Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          width: 67*percentScale,
                          height: 67*percentScale,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4*percentScale),
                            image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        imageUrl: imageLink,
                        //placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 67*percentScale,height:67*percentScale),
                        height:67*percentScale,
                        width:67*percentScale,
                        fadeInDuration: Duration(milliseconds:800),
                      ),
                      SizedBox(
                        height: 2*percentScale,
                      ),
                      Text(name,
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextBlack,
                          fontSize: 12*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                      SizedBox(
                        height: 5*percentScale,
                      ),
                      Text(source,
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: Color(0x60000000),
                          fontSize: 10*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  duration: ((){
                    if(collected == true)
                      return Duration(milliseconds:1200);
                    else
                      return Duration(milliseconds:10);
                  }()),
                  opacity: collected ? 0 : 1,
                  child: Container(
                    width:120*percentScale,
                    height:120*percentScale,
                    transform: Matrix4.translationValues(0,-8*percentScale,0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300*percentScale),
                      child: new Transform.scale(
                        scale: 3*percentScale,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Color(0x00000000)),
                          child: new Checkbox(
                            activeColor: Color(0x04FFFFFF),
                            checkColor: Color(0xFF444444),
                            value: collected,
                            onChanged: (bool value) {
                              setState(() {
                                collected = value;
                                saveBool("emojiCheckList"+name, false, collected);
                                HapticFeedback.mediumImpact();
                              });
                            },
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds:400),
                  opacity: collected ? 1 : 0,
                  child: Container(
                    transform: Matrix4.translationValues(6*percentScale,-6*percentScale,0),
                    height: 25*percentScale,
                    width: 25*percentScale,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorCheckGreen,
                      boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,3),
                        blurRadius: 6,
                        spreadRadius: 0
                      ) ],
                    ),
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: Color(0x00000000)),
                      child: new Checkbox(
                        activeColor: Color(0x00000000),
                        checkColor: Color(0xFF444444),
                        value: collected,
                        onChanged: (bool value) {
                          setState(() {
                            collected = value;
                            saveBool("emojiCheckList"+name, false, collected);
                            //HapticFeedback.mediumImpact();
                          });
                        },
                      ),
                    ),
                  )
                ),
              ),
          ]
      );
    }
  );
}

