import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'databases.dart';

class EmojiList extends StatefulWidget {
  EmojiList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmojiListPageState createState() => _EmojiListPageState();
}

String searchEmoji = '';
var futureEmoji;

class _EmojiListPageState extends State<EmojiList>{
  @override
  void initState(){
    super.initState();
    futureEmoji=getEmojiData(searchEmoji);
  }

  @override
  Widget build(BuildContext context){
    searchEmoji = '';
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
      floatingActionButton: floatingActionButton(percentScale, context),
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: colorLightDarkAccent,
            ),
            FutureBuilder(
              future: futureEmoji,
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
                          return emojiContainer(percentScale, darkMode, colorTextBlack, snapshot.data[index].name, snapshot.data[index].imageLink,snapshot.data[index].source);
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
                      backgroundColor: colorEmojipediaAppBar,
                      pinned: true,
                      //snap: true,
                      floating: true,
                      elevation: 10,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,17*percentScale-(top/6.8)*percentScale,0),
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
                                              color: colorSearchbarBG,
                                            ),
                                            prefix: Padding(
                                              padding:
                                                  const EdgeInsets.only(right:13, left:7),
                                              child: Icon(
                                                Icons.search,
                                                color:colorSearchbarIcon,
                                              ),
                                            ),
                                            onChanged: (string){
                                              setState(() {
                                                searchEmoji = string;
                                                futureEmoji=getEmojiData(searchEmoji);
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
                        height:15*percentScale,
                      )
                    ),
                    emojiListSliver,
                    SliverPadding(
                      padding: EdgeInsets.only(top:40*percentScale),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          new Center(
                            child: Text("*These emojis are only obtainable with high friendship",
                              style: TextStyle(
                              fontFamily: 'ArialRoundedBold',
                              color: colorTextBlack,
                              fontSize: 10*percentScale,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              )
                            ),
                          ),
                        ],),
                      ),
                    ),
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

Widget emojiContainer(double percentScale, bool darkMode, Color colorTextBlack, String name, String imageLink, String source){
  var specialEmoji = ["inspiration","flourish","pride","daydreaming","mischief","showmanship","love","confident"];
  var displayName;
  if(specialEmoji.contains(name.toLowerCase())){
    displayName=name+"*";
  } else {
    displayName = name;
  }
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return FutureBuilder(
        future: getStoredBool("emojiCheckList"+name, false),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return Stack(
              children: <Widget>[
                Container(
                  width: 120*percentScale,
                  height: 162*percentScale,
                  decoration: new BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                        color: colorShadow,
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
                        Text(displayName,
                          style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: colorTextBlack,
                            fontSize: 11*percentScale,
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
                            color: darkModeColor(darkMode,Color(0x60000000),Color(0x7EFFFFFF)),
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
                      if(snapshot.data == true)
                        return Duration(milliseconds:1200);
                      else
                        return Duration(milliseconds:10);
                    }()),
                    opacity: snapshot.data ? 0 : 1,
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
                              checkColor: darkModeColor(!darkMode,Color(0xFFFFFFFF),Color(0xFF444444)),
                              value: snapshot.data,
                              onChanged: (bool value) {
                                setState(() {
                                  saveBool("emojiCheckList"+name, false, value);
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
                    opacity: snapshot.data ? 1 : 0,
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
                          value: snapshot.data,
                          onChanged: (bool value) {
                            setState(() {
                              saveBool("emojiCheckList"+name, false, value);
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
          } else {
            return Container();
          }
        }
      );
    }
  );
}

