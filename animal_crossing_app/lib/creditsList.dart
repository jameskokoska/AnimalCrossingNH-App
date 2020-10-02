import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreditsList extends StatefulWidget {
  CreditsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreditsListPageState createState() => _CreditsListPageState();
}


class _CreditsListPageState extends State<CreditsList>{
  Future<void> resetData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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

    return Scaffold(
      floatingActionButton: floatingActionButton(percentScale, context),
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: colorLightDarkAccent,
            ),

            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 219*percentScale,
                  backgroundColor: colorCreditsAppBar,
                  pinned: true,
                  //snap: true,
                  floating: true,
                  elevation: 10,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      transform: Matrix4.translationValues(0,-11*percentScale,0),
                      child: Text("Credits",
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: darkModeColor(darkMode,colorTextBlack,colorTextBlack),
                          fontSize: 30*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                    titlePadding: EdgeInsetsDirectional.only(start: 25*percentScale),
                    //background: Image.asset('assets/fishTitle.png'),
                  ),
                ),

                //Add the sliverlist parsed in future function above
                SliverPadding(
                  padding: EdgeInsets.only(top:10*percentScale),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      creditsContainer(percentScale, "James", "Team Lead",'James'),
                      creditsContainer(percentScale, "Ryan", "Graphics Lead",'Ryan'),
                      creditsContainer(percentScale, "Andrew", "Supporter",'earth'),
                    ],),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        return showAboutDialog(
                          context: context,
                          applicationLegalese: "This application was created using Flutter, 'free and open source'. Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. This application and contents are NOT affiliated with Nintendo. All local artwork recreated/licensed. This application is not made for commercial use. All application source code is of property to repective owners/contributors listed on the Credits page and/or licenses listed within the view licenses page. Twemoji Icons Graphics licensed under CC-BY 4.0: https://creativecommons.org/licenses/by/4.0/. View licenses for source libraries used. Data taken from https://tinyurl.com/acnh-sheet. Thank you for all the hard work and for making the spreadsheet! Seasons Data from capstone#3473.",
                          applicationVersion: '1.0.0',
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100, left: 120, right:120),
                        child: Container(
                          height: 40*percentScale,
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(14*percentScale), 
                          ), 
                          child: Center(
                            child: Text(
                              'About...',
                              style: TextStyle(
                                color: colorTextBlack,
                                fontFamily: 'ArialRoundedBold'
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:20*percentScale,
                  )
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

Widget creditsContainer(double percentScale, String creditName, String creditDescription, String imageAsset){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            child: Container(
              width: 360*percentScale,
              height: 105*percentScale,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14*percentScale),
                      child: new Container(
                        child: new Material(
                          child: new InkWell(
                            highlightColor: colorCreditsAppBar,
                            splashColor: colorCreditsAppBar,
                            enableFeedback: true,
                            onTap: (){
                            },
                            child: new Container(
                              width: 360*percentScale,
                              height: 105*percentScale,
                            ),
                          ),
                          color: colorWhite,
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Image.asset(
                        'assets/'+imageAsset+'.png',
                        height:65*percentScale,
                        width:65*percentScale,
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0, bottom: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(creditName,
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextBlack,
                          fontSize: 25*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0, top: 37),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(creditDescription,
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: colorTextBlack,
                          fontSize: 16*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  );
}