import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'fossilPopup.dart';
import 'popupFunctions.dart';
import 'databases.dart';

class FossilList extends StatefulWidget {
  FossilList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FossilsListPageState createState() => _FossilsListPageState();
}

String searchFossil = '';


class _FossilsListPageState extends State<FossilList>{

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


    return Scaffold(
      body: GestureDetector(
        //exit keyboard when tapping anywhere else
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color(0xFF193D69)),
            ),
            
            FutureBuilder(
              future: getFossilData(searchFossil),
              builder: (context,snapshot){
                Widget FossilListSliver;
                if(snapshot.hasData){
                  FossilListSliver = SliverPadding(
                    padding: EdgeInsets.only(top:0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return fossilContainer(percentScale, index, snapshot.data[index].collected, snapshot.data[index].name,snapshot.data[index].image,snapshot.data[index].sell,snapshot.data[index].source);
                        }, 
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  FossilListSliver = SliverToBoxAdapter(
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

                double top = 0;

                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 219*percentScale,
                      backgroundColor: Color(0xFF947C5D),
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
                              child: Text("Fossils",
                                style: TextStyle(
                                  fontFamily: 'ArialRoundedBold',
                                  color: colorTextWhite,
                                  fontSize: 30*percentScale,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                              ),
                            ),
                            titlePadding: EdgeInsets.only(left: 30*percentScale, bottom: 20),
                            background: Stack(
                              children: <Widget>[
                                //Image.asset('assets/fishTitle.png'),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom:20,right:10),
                                    child: Container(
                                      height: 35*percentScale,
                                      width: 300*percentScale,
                                      child: Opacity(
                                        opacity: (){
                                          print(top);
                                          if(top<280&&top>190){
                                            return 1-((280-top)/90);
                                          } else {
                                            return 0.0;
                                          }
                                        }(),
                                        child: CupertinoTextField(
                                          onTap: (){
                                            searchFossil='';
                                          },
                                          maxLength: 15,
                                          placeholder: (){
                                            if (searchFossil==''){
                                              return 'Search';
                                            } else {
                                              return searchFossil;
                                            }
                                          }(),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: Color(0x75F0F1F5),
                                          ),
                                          prefix: Padding(
                                            padding:
                                                const EdgeInsets.only(right:13, left:7),
                                            child: Icon(
                                              Icons.search,
                                              color: Color(0xADFFFFFF),
                                            ),
                                          ),
                                          onChanged: (string){
                                            setState(() {
                                              searchFossil = string;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                      
                    ),
                    //Add the sliverlist parsed in future function above
                    FossilListSliver,
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child:Container(
                        height:100,
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

Widget fossilContainer(double percentScale, int index, bool collected,String name,String image,String sell,String source){
  return Center(
    child: new StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) { 
        return Column(
          children: <Widget>[
            SizedBox(
              height:4.5*percentScale,
            ),
            new Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(14*percentScale),
                  child: new Container(
                    child: new Material(
                      child: new InkWell(
                        highlightColor: Color(0xFFcfd8dc),
                        splashColor: Color(0xFFb3e5fc),
                        enableFeedback: true,
                        onLongPress: (){
                          setState(() {
                            collected = !collected;
                            saveBool("fossilCheckList"+name, false, collected);
                          });
                        },
                        onTap: (){
                          currentCollectedFossil = collected;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Future<void> future = showModalBottomSheet(
                            //by setting this to true, we can avoid the half screen limit
                            isScrollControlled:true,
                            context: context, 
                            builder: (context){
                              return Container(
                                height: 340*percentScale,
                                  child: Container(
                                    child: fossilPopUp(percentScale, currentCollectedFossil, name, image, sell, source),
                                ),
                              );
                          });
                          future.then((void value)=> setState(() {
                            getStoredBool("fossilCheckList"+name, false).then((indexResult){
                                collected = indexResult;
                            });
                          }));
                        },
                        child: new Container(
                          width: 334*percentScale,
                          height: 75*percentScale,
                        ),
                      ),
                      color: colorWhite,
                    ),
                    
                  ),
                ),
                // 
                // new Container(
                //     width: 334*percentScale,
                //     height: 71*percentScale,
                //     decoration: new BoxDecoration(
                //       color: Color(0xffb9f4fb),
                //       borderRadius: BorderRadius.circular(8)
                //     )
                //   ),
                //
                //
                IgnorePointer(
                  child: Stack(
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(12*percentScale,10*percentScale,0),
                        width: 55*percentScale,
                        height: 55*percentScale,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Color(0xFFE9DAC5)),
                        )
                      ),
                      Container(
                        transform: Matrix4.translationValues((12+5)*percentScale,(10+5)*percentScale,0),
                        child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            width: 45*percentScale,
                            height: 45*percentScale,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4*percentScale),
                              image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          imageUrl: image,
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Container(child: new Icon(Icons.error), width: 45*percentScale,height:45*percentScale),
                          height:45*percentScale,
                          width:45*percentScale,
                          fadeInDuration: Duration(milliseconds:800),
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues((80)*percentScale,(27)*percentScale,0),
                        child: new Text((capitalize(name)),
                          style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextBlack,
                          fontSize: 18*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                      //Checkmark background
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 300),
                        top: collected ? 40*percentScale : 0,
                        bottom: collected ? 40*percentScale : 0,
                        child: new Container(
                          transform: Matrix4.translationValues((279)*percentScale,(10)*percentScale,0),
                          width: 40*percentScale,
                          height: 40*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorCheckRed
                          )
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        top: !collected ? 40*percentScale : 0,
                        bottom: !collected ? 40*percentScale : 0,
                        child: new Container(
                          transform: Matrix4.translationValues((279)*percentScale,(10)*percentScale,0),
                          width: 40*percentScale,
                          height: 40*percentScale,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorCheckGreen
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                
                Container(
                  transform: Matrix4.translationValues((272)*percentScale,(11)*percentScale,0),
                  width:55*percentScale,
                  height:55*percentScale,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300*percentScale),
                      child: new Transform.scale(
                        scale: 1.6*percentScale,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Color(0x00F9E4E4)),
                          child: new Checkbox(
                            activeColor: Color(0x04b2fab4),
                            checkColor: Color(0xFFFFFFFF),
                            value: collected,
                            onChanged: (bool value) {
                              setState(() {
                                collected = value;
                                saveBool("fossilCheckList"+name, false, collected);
                                HapticFeedback.mediumImpact();
                            });
                          },
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        );
    }),
  );
}
