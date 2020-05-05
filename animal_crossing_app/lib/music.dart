import 'main.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';


class MusicList extends StatefulWidget {
  MusicList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicList>{
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

    Color textColor;
    if(!darkMode)
      textColor = Color( 0xFFFFFFFF);
    else
      textColor = Color( 0xFFF5F5F5);

      
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: darkModeColor(darkMode, Color( 0xFF81C0FF), Color( 0xff08354E)),
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
                        color: textColor,
                        fontSize: 30*percentScale,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                    ),
                  ),
                  titlePadding: EdgeInsetsDirectional.only(start: 25*percentScale),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(5*percentScale, 0, 0, 0),
                sliver: new SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120*percentScale,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1,
                  ),
                  delegate: 
                  SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return songContainer(percentScale, index, textColor);
                    },
                    childCount: albumCoverLinks.length,
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child:Container(
                  height:170,
                )
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
                        [darkModeColor(darkMode, Color(0xaF2b74e3), Color(0x592b74e3)), darkModeColor(darkMode, Color(0xaF2b74e3), Color(0x592b74e3))],
                        [darkModeColor(darkMode, Color(0xaf3089ee), Color(0x593089ee)), darkModeColor(darkMode, Color(0xaf3089ee), Color(0x593089ee))],
                        [darkModeColor(darkMode, Color(0xaf3a7aee), Color(0x593a7aee)), darkModeColor(darkMode, Color(0xaf3a7aee), Color(0x593a7aee))],
                        [darkModeColor(darkMode, Color(0xaf5c94ff), Color(0x595c94ff)), darkModeColor(darkMode, Color(0xaf5c94ff), Color(0x595c94ff))]
                      ],
                      durations: [13000, 25000, 9000, 32000],
                      heightPercentages: [0.10, 0.12, 0.14, 0.16],
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
                      [darkModeColor(darkMode, Color(0xaF2b74e3), Color(0x592b74e3)), darkModeColor(darkMode, Color(0xaF2b74e3), Color(0x592b74e3))],
                      [darkModeColor(darkMode, Color(0xaf3089ee), Color(0x593089ee)), darkModeColor(darkMode, Color(0xaf3089ee), Color(0x593089ee))],
                      [darkModeColor(darkMode, Color(0xaf3a7aee), Color(0x593a7aee)), darkModeColor(darkMode, Color(0xaf3a7aee), Color(0x593a7aee))],
                      [darkModeColor(darkMode, Color(0xaf5c94ff), Color(0x595c94ff)), darkModeColor(darkMode, Color(0xaf5c94ff), Color(0x595c94ff))]
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

Widget songContainer(double percentScale, int index, Color textColor){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              //Not collected Background
              AnimatedOpacity(
                duration: Duration(milliseconds:300),
                opacity: check ? 0 : 1,
                child: new Container(
                  transform: Matrix4.translationValues(-2*percentScale,-2*percentScale,0),
                  width:99*percentScale,
                  height:99*percentScale,
                  decoration: new BoxDecoration(
                    color: Color(0x7EFF6C6C),
                    borderRadius: BorderRadius.circular(5*percentScale),
                  ),
                ),
              ),
              //Collected Background
              AnimatedOpacity(
                duration: Duration(milliseconds:300),
                opacity: !check ? 0 : 1,
                child: new Container(
                  transform: Matrix4.translationValues(-2*percentScale,-2*percentScale,0),
                  width:99*percentScale,
                  height:99*percentScale,
                  decoration: new BoxDecoration(
                    color: Color(0xB352C580),
                    borderRadius: BorderRadius.circular(5*percentScale),
                  ),
                ),
              ),
              new Container(
                width:95*percentScale,
                height:95*percentScale,
                decoration: new BoxDecoration(
                  color: Color(0xFF81C0FF),
                  borderRadius: BorderRadius.circular(5*percentScale),
                ),
              ),
              new Container(
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    width: 95*percentScale,
                    height: 95*percentScale,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4*percentScale),
                      image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: albumCoverLinks[index],
                  //placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  height:95*percentScale,
                  width:95*percentScale,
                  fadeInDuration: Duration(milliseconds:800),
                ),
              ),
              AnimatedOpacity(
                duration: ((){
                  if(check == true)
                    return Duration(milliseconds:1200);
                  else
                    return Duration(milliseconds:10);
                }()),
                opacity: check ? 0 : 1,
                child: Container(
                  width:95*percentScale,
                  height:95*percentScale,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300*percentScale),
                      child: new Transform.scale(
                        scale: 3*percentScale,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Color(0x00000000)),
                          child: new Checkbox(
                            activeColor: Color(0x04FFFFFF),
                            checkColor: Color(0xFF444444),
                            value: check,
                            onChanged: (bool value) {
                              setState(() {
                                check = value;
                                HapticFeedback.mediumImpact();
                              });
                            },
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3*percentScale,
          ),
          Text(albumName[index],
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              color: textColor,
              fontSize: 10*percentScale,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )
          ),
        ],
      );
    }
  );
}

bool check = false;
List<String> albumCoverLinks = ["https://acnhcdn.com/latest/Audio/mjk_Keiji.png","https://acnhcdn.com/latest/Audio/mjk_Aloha.png","https://acnhcdn.com/latest/Audio/mjk_DoubutuNoMachi.png","https://acnhcdn.com/latest/Audio/mjk_Idol.png","https://acnhcdn.com/latest/Audio/mjk_Paris.png","https://acnhcdn.com/latest/Audio/mjk_ShowaKayo.png","https://acnhcdn.com/latest/Audio/mjk_EuroBeat.png","https://acnhcdn.com/latest/Audio/mjk_Drive.png","https://acnhcdn.com/latest/Audio/mjk_Sayonara.png","https://acnhcdn.com/latest/Audio/mjk_MoriNoSeikatsu.png","https://acnhcdn.com/latest/Audio/mjk_KekeRider.png","https://acnhcdn.com/latest/Audio/mjk_UtataneNoYume.png","https://acnhcdn.com/latest/Audio/mjk_Daisuki.png","https://acnhcdn.com/latest/Audio/mjk_China.png","https://acnhcdn.com/latest/Audio/mjk_Hollywood.png","https://acnhcdn.com/latest/Audio/mjk_Maria.png","https://acnhcdn.com/latest/Audio/mjk_Ballad.png","https://acnhcdn.com/latest/Audio/mjk_Roma.png","https://acnhcdn.com/latest/Audio/mjk_BirthdaySong.png","https://acnhcdn.com/latest/Audio/mjk_Blues.png","https://acnhcdn.com/latest/Audio/mjk_Bossa.png","https://acnhcdn.com/latest/Audio/mjk_Caripso.png","https://acnhcdn.com/latest/Audio/mjk_Turkey.png","https://acnhcdn.com/latest/Audio/mjk_Sanbika.png","https://acnhcdn.com/latest/Audio/mjk_Peru.png","https://acnhcdn.com/latest/Audio/mjk_Country.png","https://acnhcdn.com/latest/Audio/mjk_Urban.png","https://acnhcdn.com/latest/Audio/mjk_Drumnbass.png","https://acnhcdn.com/latest/Audio/mjk_KowaiUta.png","https://acnhcdn.com/latest/Audio/mjk_Disco.png","https://acnhcdn.com/latest/Audio/mjk_Dixie.png","https://acnhcdn.com/latest/Audio/mjk_Etude.png","https://acnhcdn.com/latest/Audio/mjk_Haisai.png","https://acnhcdn.com/latest/Audio/mjk_Flamenco.png","https://acnhcdn.com/latest/Audio/mjk_Minyo.png","https://acnhcdn.com/latest/Audio/mjk_Fusion.png","https://acnhcdn.com/latest/Audio/mjk_Raregroove.png","https://acnhcdn.com/latest/Audio/mjk_NewOrleans.png","https://acnhcdn.com/latest/Audio/mjk_House.png","https://acnhcdn.com/latest/Audio/mjk_DoubutsuNoShima.png","https://acnhcdn.com/latest/Audio/mjk_Jazz.png","https://acnhcdn.com/latest/Audio/mjk_Jongara.png","https://acnhcdn.com/latest/Audio/mjk_Enka.png","https://acnhcdn.com/latest/Audio/mjk_LoveSong.png","https://acnhcdn.com/latest/Audio/mjk_Lullaby.png","https://acnhcdn.com/latest/Audio/mjk_Mambo.png","https://acnhcdn.com/latest/Audio/mjk_Gamelan.png","https://acnhcdn.com/latest/Audio/mjk_March.png","https://acnhcdn.com/latest/Audio/mjk_Senor.png","https://acnhcdn.com/latest/Audio/mjk_Metal.png","https://acnhcdn.com/latest/Audio/mjk_Milonga.png","https://acnhcdn.com/latest/Audio/mjk_Bolero.png","https://acnhcdn.com/latest/Audio/mjk_Maharaja.png","https://acnhcdn.com/latest/Audio/mjk_Parade.png","https://acnhcdn.com/latest/Audio/mjk_RagTime.png","https://acnhcdn.com/latest/Audio/mjk_Ondo.png","https://acnhcdn.com/latest/Audio/mjk_Reggae.png","https://acnhcdn.com/latest/Audio/mjk_Rock.png","https://acnhcdn.com/latest/Audio/mjk_KekeBilly.png","https://acnhcdn.com/latest/Audio/mjk_Afro.png","https://acnhcdn.com/latest/Audio/mjk_Salsa.png","https://acnhcdn.com/latest/Audio/mjk_Samba.png","https://acnhcdn.com/latest/Audio/mjk_Ska.png","https://acnhcdn.com/latest/Audio/mjk_Sonata.png","https://acnhcdn.com/latest/Audio/mjk_KekeSong.png","https://acnhcdn.com/latest/Audio/mjk_Soul.png","https://acnhcdn.com/latest/Audio/mjk_Cossack.png","https://acnhcdn.com/latest/Audio/mjk_Osanpo.png","https://acnhcdn.com/latest/Audio/mjk_Swing.png","https://acnhcdn.com/latest/Audio/mjk_Electronica.png","https://acnhcdn.com/latest/Audio/mjk_Tango.png","https://acnhcdn.com/latest/Audio/mjk_TechnoBeat.png","https://acnhcdn.com/latest/Audio/mjk_Waltz.png","https://acnhcdn.com/latest/Audio/mjk_Western.png","https://acnhcdn.com/latest/Audio/mjk_Daimyo.png","https://acnhcdn.com/latest/Audio/mjk_Irish.png","https://acnhcdn.com/latest/Audio/mjk_HunaUta2001.png","https://acnhcdn.com/latest/Audio/mjk_Alpine.png","https://acnhcdn.com/latest/Audio/mjk_Sensei.png","https://acnhcdn.com/latest/Audio/mjk_BokuNoBasho.png","https://acnhcdn.com/latest/Audio/mjk_Napolitan.png","https://acnhcdn.com/latest/Audio/mjk_OnlyMe.png","https://acnhcdn.com/latest/Audio/mjk_KangaeChu.png","https://acnhcdn.com/latest/Audio/mjk_RocknRoll.png","https://acnhcdn.com/latest/Audio/mjk_Gospel.png","https://acnhcdn.com/latest/Audio/mjk_Minimal.png","https://acnhcdn.com/latest/Audio/mjk_HaruNoKomorebi.png","https://acnhcdn.com/latest/Audio/mjk_BlueOnigiri.png","https://acnhcdn.com/latest/Audio/mjk_NiDanZaka.png","https://acnhcdn.com/latest/Audio/mjk_Eleki.png","https://acnhcdn.com/latest/Audio/mjk_Funk.png","https://acnhcdn.com/latest/Audio/mjk_NamiNami.png","https://acnhcdn.com/latest/Audio/mjk_Ototoi.png","https://acnhcdn.com/latest/Audio/mjk_Horo.png","https://acnhcdn.com/latest/Audio/mjk_MainTheme.png"];
List<String> albumName = ["Agent K.K.","Aloha K.K.","Animal City","Bubblegum K.K.","Café K.K.","Comrade K.K.","DJ K.K.","Drivin'","Farewell","Forest Life","Go K.K. Rider","Hypno K.K.","I Love You","Imperial K.K.","K.K. Adventure","K.K. Aria","K.K. Ballad","K.K. Bazaar","K.K. Birthday","K.K. Blues","K.K. Bossa","K.K. Calypso","K.K. Casbah","K.K. Chorale","K.K. Condor","K.K. Country","K.K. Cruisin'","K.K. D&B","K.K. Dirge","K.K. Disco","K.K. Dixie","K.K. Étude","K.K. Faire","K.K. Flamenco","K.K. Folk","K.K. Fusion","K.K. Groove","K.K. Gumbo","K.K. House","K.K. Island","K.K. Jazz","K.K. Jongara","K.K. Lament","K.K. Love Song","K.K. Lullaby","K.K. Mambo","K.K. Marathon","K.K. March","K.K. Mariachi","K.K. Metal","K.K. Milonga","K.K. Moody","K.K. Oasis","K.K. Parade","K.K. Ragtime","K.K. Rally","K.K. Reggae","K.K. Rock","K.K. Rockabilly","K.K. Safari","K.K. Salsa","K.K. Samba","K.K. Ska","K.K. Sonata","K.K. Song","K.K. Soul","K.K. Steppe","K.K. Stroll","K.K. Swing","K.K. Synth","K.K. Tango","K.K. Technopop","K.K. Waltz","K.K. Western","King K.K.","Lucky K.K.","Marine Song 2001","Mountain Song","Mr. K.K.","My Place","Neapolitan","Only Me","Pondering","Rockin' K.K.","Soulful K.K.","Space K.K.","Spring Blossoms","Stale Cupcakes","Steep Hill","Surfin' K.K.","The K. Funk","To the Edge","Two Days Ago","Wandering","Welcome Horizons"];