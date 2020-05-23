import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'villagerPopup.dart';
import 'databases.dart';


class VillagerList extends StatefulWidget {
  VillagerList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VillagerListPageState createState() => _VillagerListPageState();
}

String searchVillager = '';


class _VillagerListPageState extends State<VillagerList>{

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
              future: getVillagerData(searchVillager),
              builder: (context,snapshot){
                Widget villagerListSliver;
                if(snapshot.hasData){
                  villagerListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(20*percentScale, 0, 20*percentScale, 0),
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
                          return villagerContainer(percentScale, snapshot.data[index].name, snapshot.data[index].image,snapshot.data[index].favorite,snapshot.data[index].species,snapshot.data[index].gender,snapshot.data[index].personality, snapshot.data[index].birthday,snapshot.data[index].catchphrase,snapshot.data[index].style1,snapshot.data[index].style2,snapshot.data[index].color1,snapshot.data[index].color2);
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  villagerListSliver = SliverToBoxAdapter(
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
                      backgroundColor: Color(0xFF66CFD6),
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
                              child: Text("Villagers",
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
                                              searchVillager='';
                                            },
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchVillager==''){
                                                  return 'Search';
                                                } else {
                                                  return searchVillager;
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
                                                searchVillager = string;
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
                    villagerListSliver,
                    
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

Widget villagerContainer(double percentScale, String name, String imageLink, bool favorite,String species, String gender, String personality, String birthday, String catchphrase, String style1, String style2, String color1, String color2){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Stack(
        children: <Widget>[
          //Shadow
          IgnorePointer(
            child: Container(
              width: 300*percentScale,
              height: 300*percentScale,
              decoration: new BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                    color: Color(0x0C000000),
                    offset: Offset(0,3),
                    blurRadius: 5,
                    spreadRadius: 0
                ) ],
              ),
            ),
          ),
          //Tap region inkwell
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
                      favorite = !favorite;
                      saveBool("villagerCheckList"+name, false, favorite);
                    });
                  },
                  onTap: (){
                    currentFavoriteVillager = favorite;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Future<void> future = showModalBottomSheet(
                      //by setting this to true, we can avoid the half screen limit
                      isScrollControlled:true,
                      context: context, 
                      builder: (context){
                        return Container(
                          height: 450*percentScale,
                            child: Container(
                              child: villagerPopUp(percentScale,currentFavoriteVillager,name, imageLink, species,  gender,  personality, birthday, catchphrase, style1, style2, color1, color2)
                          ),
                        );
                    });
                    future.then((void value)=> setState(() {
                      getStoredBool("villagerCheckList"+name, false).then((indexResult){
                          favorite = indexResult;
                      });
                    }));
                  },
                  child: new Container(
                    width: 350*percentScale,
                    height: 350*percentScale,
                  ),
                ),
                color: colorWhite,
              ),
            )
          ),
          //villager box
          IgnorePointer(
            child: Container(
              width: 300*percentScale,
              height: 300*percentScale,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: new Container(
                      transform: Matrix4.translationValues(0,13*percentScale,0),
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
                            height: 8*percentScale,
                          ),
                          Text(name,
                            style: TextStyle(
                              fontFamily: 'ArialRoundedBold',
                              color: colorTextBlack,
                              fontSize: 13*percentScale,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds:200),
                      opacity: favorite ? 1 : 0,
                      child: Container(
                        transform: Matrix4.translationValues(6*percentScale,-6*percentScale,0),
                        height: 25*percentScale,
                        width: 25*percentScale,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorVillagerAccent,
                          boxShadow: [BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                          ) ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red[400],
                          size: 15*percentScale,
                        ),
                      )
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      );
   
    }
  );
}

