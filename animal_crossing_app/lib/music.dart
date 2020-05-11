import 'main.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


List<String> albumCoverLinks = ["https://acnhcdn.com/latest/Audio/mjk_Keiji.png","https://acnhcdn.com/latest/Audio/mjk_Aloha.png","https://acnhcdn.com/latest/Audio/mjk_DoubutuNoMachi.png","https://acnhcdn.com/latest/Audio/mjk_Idol.png","https://acnhcdn.com/latest/Audio/mjk_Paris.png","https://acnhcdn.com/latest/Audio/mjk_ShowaKayo.png","https://acnhcdn.com/latest/Audio/mjk_EuroBeat.png","https://acnhcdn.com/latest/Audio/mjk_Drive.png","https://acnhcdn.com/latest/Audio/mjk_Sayonara.png","https://acnhcdn.com/latest/Audio/mjk_MoriNoSeikatsu.png","https://acnhcdn.com/latest/Audio/mjk_KekeRider.png","https://acnhcdn.com/latest/Audio/mjk_UtataneNoYume.png","https://acnhcdn.com/latest/Audio/mjk_Daisuki.png","https://acnhcdn.com/latest/Audio/mjk_China.png","https://acnhcdn.com/latest/Audio/mjk_Hollywood.png","https://acnhcdn.com/latest/Audio/mjk_Maria.png","https://acnhcdn.com/latest/Audio/mjk_Ballad.png","https://acnhcdn.com/latest/Audio/mjk_Roma.png","https://acnhcdn.com/latest/Audio/mjk_BirthdaySong.png","https://acnhcdn.com/latest/Audio/mjk_Blues.png","https://acnhcdn.com/latest/Audio/mjk_Bossa.png","https://acnhcdn.com/latest/Audio/mjk_Caripso.png","https://acnhcdn.com/latest/Audio/mjk_Turkey.png","https://acnhcdn.com/latest/Audio/mjk_Sanbika.png","https://acnhcdn.com/latest/Audio/mjk_Peru.png","https://acnhcdn.com/latest/Audio/mjk_Country.png","https://acnhcdn.com/latest/Audio/mjk_Urban.png","https://acnhcdn.com/latest/Audio/mjk_Drumnbass.png","https://acnhcdn.com/latest/Audio/mjk_KowaiUta.png","https://acnhcdn.com/latest/Audio/mjk_Disco.png","https://acnhcdn.com/latest/Audio/mjk_Dixie.png","https://acnhcdn.com/latest/Audio/mjk_Etude.png","https://acnhcdn.com/latest/Audio/mjk_Haisai.png","https://acnhcdn.com/latest/Audio/mjk_Flamenco.png","https://acnhcdn.com/latest/Audio/mjk_Minyo.png","https://acnhcdn.com/latest/Audio/mjk_Fusion.png","https://acnhcdn.com/latest/Audio/mjk_Raregroove.png","https://acnhcdn.com/latest/Audio/mjk_NewOrleans.png","https://acnhcdn.com/latest/Audio/mjk_House.png","https://acnhcdn.com/latest/Audio/mjk_DoubutsuNoShima.png","https://acnhcdn.com/latest/Audio/mjk_Jazz.png","https://acnhcdn.com/latest/Audio/mjk_Jongara.png","https://acnhcdn.com/latest/Audio/mjk_Enka.png","https://acnhcdn.com/latest/Audio/mjk_LoveSong.png","https://acnhcdn.com/latest/Audio/mjk_Lullaby.png","https://acnhcdn.com/latest/Audio/mjk_Mambo.png","https://acnhcdn.com/latest/Audio/mjk_Gamelan.png","https://acnhcdn.com/latest/Audio/mjk_March.png","https://acnhcdn.com/latest/Audio/mjk_Senor.png","https://acnhcdn.com/latest/Audio/mjk_Metal.png","https://acnhcdn.com/latest/Audio/mjk_Milonga.png","https://acnhcdn.com/latest/Audio/mjk_Bolero.png","https://acnhcdn.com/latest/Audio/mjk_Maharaja.png","https://acnhcdn.com/latest/Audio/mjk_Parade.png","https://acnhcdn.com/latest/Audio/mjk_RagTime.png","https://acnhcdn.com/latest/Audio/mjk_Ondo.png","https://acnhcdn.com/latest/Audio/mjk_Reggae.png","https://acnhcdn.com/latest/Audio/mjk_Rock.png","https://acnhcdn.com/latest/Audio/mjk_KekeBilly.png","https://acnhcdn.com/latest/Audio/mjk_Afro.png","https://acnhcdn.com/latest/Audio/mjk_Salsa.png","https://acnhcdn.com/latest/Audio/mjk_Samba.png","https://acnhcdn.com/latest/Audio/mjk_Ska.png","https://acnhcdn.com/latest/Audio/mjk_Sonata.png","https://acnhcdn.com/latest/Audio/mjk_KekeSong.png","https://acnhcdn.com/latest/Audio/mjk_Soul.png","https://acnhcdn.com/latest/Audio/mjk_Cossack.png","https://acnhcdn.com/latest/Audio/mjk_Osanpo.png","https://acnhcdn.com/latest/Audio/mjk_Swing.png","https://acnhcdn.com/latest/Audio/mjk_Electronica.png","https://acnhcdn.com/latest/Audio/mjk_Tango.png","https://acnhcdn.com/latest/Audio/mjk_TechnoBeat.png","https://acnhcdn.com/latest/Audio/mjk_Waltz.png","https://acnhcdn.com/latest/Audio/mjk_Western.png","https://acnhcdn.com/latest/Audio/mjk_Daimyo.png","https://acnhcdn.com/latest/Audio/mjk_Irish.png","https://acnhcdn.com/latest/Audio/mjk_HunaUta2001.png","https://acnhcdn.com/latest/Audio/mjk_Alpine.png","https://acnhcdn.com/latest/Audio/mjk_Sensei.png","https://acnhcdn.com/latest/Audio/mjk_BokuNoBasho.png","https://acnhcdn.com/latest/Audio/mjk_Napolitan.png","https://acnhcdn.com/latest/Audio/mjk_OnlyMe.png","https://acnhcdn.com/latest/Audio/mjk_KangaeChu.png","https://acnhcdn.com/latest/Audio/mjk_RocknRoll.png","https://acnhcdn.com/latest/Audio/mjk_Gospel.png","https://acnhcdn.com/latest/Audio/mjk_Minimal.png","https://acnhcdn.com/latest/Audio/mjk_HaruNoKomorebi.png","https://acnhcdn.com/latest/Audio/mjk_BlueOnigiri.png","https://acnhcdn.com/latest/Audio/mjk_NiDanZaka.png","https://acnhcdn.com/latest/Audio/mjk_Eleki.png","https://acnhcdn.com/latest/Audio/mjk_Funk.png","https://acnhcdn.com/latest/Audio/mjk_NamiNami.png","https://acnhcdn.com/latest/Audio/mjk_Ototoi.png","https://acnhcdn.com/latest/Audio/mjk_Horo.png","https://acnhcdn.com/latest/Audio/mjk_MainTheme.png"];
List<String> albumNames = ["Agent K.K.","Aloha K.K.","*Animal City*","Bubblegum K.K.","Café K.K.","Comrade K.K.","DJ K.K.","*Drivin'*","*Farewell*","Forest Life","Go K.K. Rider","Hypno K.K.","I Love You","Imperial K.K.","K.K. Adventure","K.K. Aria","K.K. Ballad","K.K. Bazaar","K.K. Birthday","K.K. Blues","K.K. Bossa","K.K. Calypso","K.K. Casbah","K.K. Chorale","K.K. Condor","K.K. Country","K.K. Cruisin'","K.K. D&B","K.K. Dirge","K.K. Disco","K.K. Dixie","K.K. Étude","K.K. Faire","K.K. Flamenco","K.K. Folk","K.K. Fusion","K.K. Groove","K.K. Gumbo","K.K. House","K.K. Island","K.K. Jazz","K.K. Jongara","K.K. Lament","K.K. Love Song","K.K. Lullaby","K.K. Mambo","K.K. Marathon","K.K. March","K.K. Mariachi","K.K. Metal","K.K. Milonga","K.K. Moody","K.K. Oasis","K.K. Parade","K.K. Ragtime","K.K. Rally","K.K. Reggae","K.K. Rock","K.K. Rockabilly","K.K. Safari","K.K. Salsa","K.K. Samba","K.K. Ska","K.K. Sonata","K.K. Song","K.K. Soul","K.K. Steppe","K.K. Stroll","K.K. Swing","K.K. Synth","K.K. Tango","K.K. Technopop","K.K. Waltz","K.K. Western","King K.K.","Lucky K.K.","Marine Song 2001","Mountain Song","Mr. K.K.","My Place","Neapolitan","Only Me","Pondering","Rockin' K.K.","Soulful K.K.","Space K.K.","Spring Blossoms","Stale Cupcakes","Steep Hill","Surfin' K.K.","The K. Funk","To the Edge","Two Days Ago","Wandering","Welcome Horizons"];

class MusicList extends StatefulWidget {
  MusicList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicListPageState createState() => _MusicListPageState();
}

String searchMusic = '';

class MusicData{
  final String name;
  final String imageLink;
  final bool collected;

  MusicData(this.name, this.imageLink, this.collected);
}

class _MusicListPageState extends State<MusicList>{

  Future<List<MusicData>> getMusicData(String search) async{
    bool collected = false;
    List<MusicData> musicData = [];
    for(int i = 0; i<albumNames.length; i++){
      getStoredBool("songCheckList"+albumNames[i], false).then((indexResult){
        collected = indexResult;
        MusicData musicDatum = MusicData(albumNames[i],albumCoverLinks[i],collected);
        if(search == ''){
          musicData.add(musicDatum);
        } else if (albumNames[i].toLowerCase().contains(search.toLowerCase())){
          musicData.add(musicDatum);
        }
      });
    }
    return musicData;
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
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeColor(darkMode, colorLightDarkAccent, Color( 0xffFFFFFF)),
            ),
            FutureBuilder(
              future: getMusicData(searchMusic),
              builder: (context,snapshot){
                Widget songListSliver;
                if(snapshot.hasData){
                  songListSliver = SliverPadding(
                    padding: EdgeInsets.fromLTRB(28*percentScale, 0, 0, 0),
                    sliver: new SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 0,
                        childAspectRatio: 1,
                      ),
                      delegate: 
                      SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return songContainer(percentScale, colorTextBlack, snapshot.data[index].name, snapshot.data[index].imageLink,snapshot.data[index].collected);
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  );
                } else {
                  songListSliver = SliverToBoxAdapter(
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
                      backgroundColor: Color(0x00FFFFFF),
                      pinned: false,
                      //snap: true,
                      floating: false,
                      elevation: 0,
                      flexibleSpace: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            title: Container(
                              transform: Matrix4.translationValues(0,10*percentScale-(top/6.8)*percentScale,0),
                              child: Text("K.K. Songs",
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
                                    transform: Matrix4.translationValues(0,-182*percentScale+(top*percentScale/1.7)*percentScale,0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:20,right:10),
                                      child: Opacity(
                                        opacity: top/280,
                                        child: Container(
                                          height: (35*percentScale*((top)/267)),
                                          width: 300*percentScale,
                                          child: CupertinoTextField(
                                            maxLength: 15,
                                            placeholder: (){
                                              if (searchMusic==''){
                                                  return 'Search';
                                                } else {
                                                  return searchMusic;
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
                                                searchMusic = string;
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
                    songListSliver,
                    
                    SliverPadding(
                      padding: EdgeInsets.only(top:40*percentScale),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          new Center(
                            child: Text("*These songs are only availible upon K.K. request",
                              style: TextStyle(
                              fontFamily: 'ArialRoundedBold',
                              color:  darkModeColor(darkMode,Color( 0xFFB7E3FF),Color(0xaF757575)),
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
            
            IgnorePointer(
              child: new Align(
                alignment: Alignment.topCenter,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(180 / 360),
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Color(0x59e8eaf6), Color(0x59e8eaf6)],
                        [Color(0xafc5cae9), Color(0x59c5cae9)],
                        [Color(0x599fa8da), Color(0x599fa8da)],
                        [Color(0x597986cb), Color(0x597986cb)]
                      ],
                      durations: [13000, 25000, 9000, 32000],
                      heightPercentages: [0.10, 0.12, 0.14, 0.16],
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    backgroundColor: Colors.transparent,
                    size: Size(360*percentScale, 60*percentScale),
                    waveAmplitude: 13*percentScale,
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Color(0x59e8eaf6), Color(0x59e8eaf6)],
                        [Color(0xafc5cae9), Color(0x59c5cae9)],
                        [Color(0x599fa8da), Color(0x599fa8da)],
                        [Color(0x597986cb), Color(0x597986cb)]
                      ],
                      durations: [30000, 20000, 11000, 8000],
                      heightPercentages: [0.10, 0.11, 0.12, 0.13],
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    backgroundColor: Colors.transparent,
                    size: Size(360*percentScale, 114*percentScale),
                    waveAmplitude: 7*percentScale,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

Widget songContainer(double percentScale, Color colorTextBlack, String name, String imageLink, bool collected){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Stack(
        children: <Widget>[
          new Container(
            width: 143*percentScale,
            height: 162*percentScale,
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                  color: Color(0x0C000000),
                  offset: Offset(0,3),
                  blurRadius: 6,
                  spreadRadius: 0
              ) ],
            )
          ),
          
          new Container(
            transform: Matrix4.translationValues(13*percentScale,13*percentScale,0),
            width:117*percentScale,
            height:117*percentScale,
            decoration: new BoxDecoration(
              color: Color(0x83D7EBFF),
              borderRadius: BorderRadius.circular(5*percentScale),
            ),
          ),
          new Container(
            transform: Matrix4.translationValues(13*percentScale,13*percentScale,0),
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    width: 117*percentScale,
                    height: 117*percentScale,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4*percentScale),
                      boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,2),
                        blurRadius: 2,
                        spreadRadius: 0
                      )],
                      image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: imageLink,
                  //placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  height:95*percentScale,
                  width:95*percentScale,
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
                transform: Matrix4.translationValues(-11*percentScale,-8*percentScale,0),
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
                            saveBool("songCheckList"+name, false, collected);
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
          AnimatedOpacity(
            duration: Duration(milliseconds:400),
            opacity: collected ? 1 : 0,
            child: Container(
              transform: Matrix4.translationValues(113*percentScale,113*percentScale,0),
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
                      saveBool("songCheckList"+name, false, collected);
                      //HapticFeedback.mediumImpact();
                    });
                  },
                ),
              ),
            )
          ),
        ],
      );
    }
  );
}

