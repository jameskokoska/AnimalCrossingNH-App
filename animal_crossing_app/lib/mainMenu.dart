import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

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
        body: 
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                new Container(
                  width: 230*percentScale,
                  height: 30*percentScale,
                  child: Center(
                    child: Text(
                      "Nate's Birthday",
                      style: TextStyle(
                        fontFamily: 'ArialRoundedBold',
                        color: Color(0xff4e4e4e),
                        fontSize: 15*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    )
                  ),
                  decoration: new BoxDecoration(
                    color: Color(0xa6ffffff),
                    borderRadius: BorderRadius.circular(30*percentScale),
                    boxShadow: [BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                    ) ],
                  )
                ),
                new Container(
                  width: deviceWidth,
                  height: 127*percentScale,
                  decoration: new BoxDecoration(
                    color: Color(0xffb8e299),
                  )
                ),

                //Progress Section
                new Stack(
                  children: <Widget>[
                    //Background
                    new Container(
                      width: deviceWidth,
                      height: 290*percentScale,
                      decoration: new BoxDecoration(
                        color: Color(0xffdbd6f4),
                        borderRadius: BorderRadius.circular(30*percentScale),
                        boxShadow: [BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0,3),
                          blurRadius: 10,
                          spreadRadius: 0
                        ) ],
                      )
                    ),
                    //Text bubble
                    new Container(
                      transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                      width: 105*percentScale,
                      height: 35*percentScale,
                      decoration: new BoxDecoration(
                        color: Color(0xff9d99fc),
                        borderRadius: BorderRadius.circular(30*percentScale),
                        boxShadow: [BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                        ) ],
                      ),
                      child: Center(
                        child: Text("Collection",
                          style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: Color(0xff000000),
                          fontSize: 16*percentScale,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      ),
                    ),
                    //Progress bars
                    Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 44*percentScale),
                          new Container(
                            width: 334*percentScale,
                            height: 29*percentScale,
                            decoration: new BoxDecoration(
                              color: Color(0xffe9e7f2),
                              borderRadius: BorderRadius.circular(10*percentScale),
                              boxShadow: [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                              ) ],
                            )
                          ),
                          SizedBox(height: 19*percentScale),
                          new Container(
                            width: 334*percentScale,
                            height: 29*percentScale,
                            decoration: new BoxDecoration(
                              color: Color(0xffe9e7f2),
                              borderRadius: BorderRadius.circular(10*percentScale),
                              boxShadow: [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                              ) ],
                            )
                          ),
                          SizedBox(height: 19*percentScale),
                          new Container(
                            width: 334*percentScale,
                            height: 29*percentScale,
                            decoration: new BoxDecoration(
                              color: Color(0xffe9e7f2),
                              borderRadius: BorderRadius.circular(10*percentScale),
                              boxShadow: [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                              ) ],
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                //Events Section 
                new Container(
                  transform: Matrix4.translationValues(0,-60*1*percentScale,0),
                  child:Stack(
                    //Background
                    children: <Widget>[
                      new Container(
                        width: deviceWidth,
                        height: 648*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xfffffcea),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0,3),
                            blurRadius: 10,
                            spreadRadius: 0
                          ) ],
                        )
                      ),
                      //Text bubble
                      new Container(
                        transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                        width: 80*percentScale,
                        height: 35*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xffffe86b),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                          ) ],
                        ),
                        child: Center(
                          child: Text("Events",
                            style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: Color(0xff000000),
                            fontSize: 16*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                      ),
                    ]
                  ),
                ),

                //Active Creatures Section
                new Container(
                  transform: Matrix4.translationValues(0,-60*2*percentScale,0),
                  child:Stack(
                    //Background
                    children: <Widget>[
                      new Container(
                        width: deviceWidth,
                        height: 648*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xffffdede),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0,3),
                            blurRadius: 10,
                            spreadRadius: 0
                          ) ],
                        )
                      ),
                      //Text bubble
                      new Container(
                        transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                        width: 159*percentScale,
                        height: 35*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xffff8181),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                          ) ],
                        ),
                        child: Center(
                          child: Text("Active Creatures",
                            style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: Color(0xff000000),
                            fontSize: 16*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                      ),
                    ]
                  ),
                ),

                //Store Hours Section
                new Container(
                  transform: Matrix4.translationValues(0,-60*3*percentScale,0),
                  child:Stack(
                    //Background
                    children: <Widget>[
                      new Container(
                        width: deviceWidth,
                        height: 648*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xffdefeff),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0,3),
                            blurRadius: 10,
                            spreadRadius: 0
                          ) ],
                        )
                      ),
                      //Text bubble
                      new Container(
                        transform: Matrix4.translationValues(21*percentScale,-18*percentScale,0),
                        width: 123*percentScale,
                        height: 35*percentScale,
                        decoration: new BoxDecoration(
                          color: Color(0xff95c8f5),
                          borderRadius: BorderRadius.circular(30*percentScale),
                          boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                          ) ],
                        ),
                        child: Center(
                          child: Text("Store Hours",
                            style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            color: Color(0xff000000),
                            fontSize: 16*percentScale,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                      ),
                    ]
                  ),
                ),

              ],
            )
          )
        ),
    );
  }
}