import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'gridList.dart';
import 'databases.dart';
import 'dart:io';

class SettingList extends StatefulWidget {
  SettingList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingListPageState createState() => _SettingListPageState();
}


write(String filename, String content, var context) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  final directory = await DownloadsPathProvider.downloadsDirectory;
  final path = '${directory.path}/$filename.txt';
  final file = File(path);
  await file.writeAsString(content);
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Exported file as ACNHPocketGuideData.txt in Downloads folder.'),
    ),
  );
}

read(String filename, var context) async{
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  final directory = await DownloadsPathProvider.downloadsDirectory;
  final path = '${directory.path}/$filename.txt';
  final file = File(path);
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text('Importing... Looking for file: ' + path),
    ),
  );
  if(await File(path).exists()==false){
    return -1;
  }
  return await file.readAsString();
}

class _SettingListPageState extends State<SettingList>{
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
                  backgroundColor: colorSettingsAppBar,
                  pinned: true,
                  //snap: true,
                  floating: true,
                  elevation: 10,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      transform: Matrix4.translationValues(0,-13*percentScale,0),
                      child: Text("Settings",
                        style: TextStyle(
                          fontFamily: 'ArialRoundedBold',
                          color: darkModeColor(darkMode,colorTextWhite,colorTextBlack),
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
                      settingContainer(percentScale, 'Northern hemisphere', 'northernHemisphere', northernHemisphere, 'earth', "Select your hemisphere location, for accurate creature times."),
                      //settingContainer(percentScale, 'Splash Screen', 'skipSplash', skipSplash, 'phone'),
                      settingContainer(percentScale, 'Always show catchphrase', 'showCatchPhraseNow', showCatchPhraseNow, 'speechBubble', "Within the pop-up of each creature, show the catchphrase even if it has not been caught."),
                      settingContainer(percentScale, 'List only active creatures', 'showListOnlyActive', showListOnlyActive, 'clockIcon', "Show only creatures that are active within the month in the list, hide the others."),
                      settingContainer(percentScale, 'Show variations in lists', 'showListVariations', showListVariations, 'dice', "Show all variations and colours of furniture and customizable items in the list."),
                      settingContainer(percentScale, 'Creatures leaving warning', 'lastCaughtWarning', lastCaughtWarning, 'alarmClock', "Highlight creatures that will be disappearing next month in a differernt colour."),
                      settingContainer(percentScale, 'Show floating menu button', 'showButton', showButton, 'buttonIcon', "Show the floating menu button in the bottom right corner all the time. The side menu can still be opened with a swipe."),
                    ],),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child:Container(
                    height:3*percentScale,
                  )
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        var outputSave = "";
                        Future<void> getStorage(var list, var listGroup) async {
                          for(int i = 0; i < list.length; i++){
                            if(await getStoredBool(getKey(list[i], listGroup), false)){
                              outputSave = outputSave + getKey(list[i], listGroup) + "\n";
                            }
                          }
                        }
                        Future<void> readStorage() async {
                          var listGroup = "Furniture";
                          await getStorage(await getHousewaresData(""), listGroup);
                          await getStorage(await getMiscellaneousData(""), listGroup);
                          await getStorage(await getWallmountedData(""), listGroup);
                          await getStorage(await getPhotosData(""), listGroup);
                          await getStorage(await getPostersData(""), listGroup);

                          listGroup = "Clothing";
                          await getStorage(await getHeadwearData(""), listGroup);
                          await getStorage(await getAccessoriesData(""), listGroup);
                          await getStorage(await getTopsData(""), listGroup);
                          await getStorage(await getBottomsData(""), listGroup);
                          await getStorage(await getSocksData(""), listGroup);
                          await getStorage(await getShoesData(""), listGroup);
                          await getStorage(await getUmbrellasData(""), listGroup);
                          await getStorage(await getBagsData(""), listGroup);
                          await getStorage(await getWetsuitData(""), listGroup);
                          await getStorage(await getDressupData(""), listGroup);
                          
                          listGroup = "Tools";
                          await getStorage(await getToolsData(""), listGroup);
                          

                          listGroup = "Floor & Wall";
                          await getStorage(await getRugsData(""), listGroup);
                          await getStorage(await getFloorsData(""), listGroup);
                          await getStorage(await getWallpapersData(""), listGroup);

                          listGroup = "Villagers";
                          await getStorage(await getVillagerData(""), listGroup);
                          
                          listGroup = "Recipes";
                          await getStorage(await getCraftableData(""), listGroup);
                          
                          listGroup = "Fish";
                          await getStorage(await getFishData(""), listGroup);
                          
                          listGroup = "Sea Creatures";
                          await getStorage(await getSeaData(""), listGroup);

                          listGroup = "Bugs";
                          await getStorage(await getBugData(""), listGroup);

                          listGroup = "Fossils";
                          await getStorage(await getFossilData(""), listGroup);

                          listGroup = "Art";
                          await getStorage(await getArtData(""), listGroup);

                          listGroup = "Emojipedia";
                          await getStorage(await getEmojiData(""), listGroup);

                          List<String> albumNames = ["Agent K.K.","Aloha K.K.","*Animal City*","Bubblegum K.K.","Café K.K.","Comrade K.K.","DJ K.K.","*Drivin'*","*Farewell*","Forest Life","Go K.K. Rider","Hypno K.K.","I Love You","Imperial K.K.","K.K. Adventure","K.K. Aria","K.K. Ballad","K.K. Bazaar","K.K. Birthday","K.K. Blues","K.K. Bossa","K.K. Calypso","K.K. Casbah","K.K. Chorale","K.K. Condor","K.K. Country","K.K. Cruisin'","K.K. D&B","K.K. Dirge","K.K. Disco","K.K. Dixie","K.K. Étude","K.K. Faire","K.K. Flamenco","K.K. Folk","K.K. Fusion","K.K. Groove","K.K. Gumbo","K.K. House","K.K. Island","K.K. Jazz","K.K. Jongara","K.K. Lament","K.K. Love Song","K.K. Lullaby","K.K. Mambo","K.K. Marathon","K.K. March","K.K. Mariachi","K.K. Metal","K.K. Milonga","K.K. Moody","K.K. Oasis","K.K. Parade","K.K. Ragtime","K.K. Rally","K.K. Reggae","K.K. Rock","K.K. Rockabilly","K.K. Safari","K.K. Salsa","K.K. Samba","K.K. Ska","K.K. Sonata","K.K. Song","K.K. Soul","K.K. Steppe","K.K. Stroll","K.K. Swing","K.K. Synth","K.K. Tango","K.K. Technopop","K.K. Waltz","K.K. Western","King K.K.","Lucky K.K.","Marine Song 2001","Mountain Song","Mr. K.K.","My Place","Neapolitan","Only Me","Pondering","Rockin' K.K.","Soulful K.K.","Space K.K.","Spring Blossoms","Stale Cupcakes","Steep Hill","Surfin' K.K.","The K. Funk","To the Edge","Two Days Ago","Wandering","Welcome Horizons"];
                          for(int i = 0; i<albumNames.length; i++){
                            if(await getStoredBool("songCheckList"+albumNames[i], false)){
                              outputSave = outputSave + "songCheckList"+albumNames[i] + "\n";
                            }
                          }
                        }
                        final scaffold = Scaffold.of(context);
                        scaffold.showSnackBar(
                          SnackBar(
                            content: const Text('Exporting...'),
                          ),
                        );
                        readStorage().then((value) => write("ACNHPocketGuideData",outputSave, context));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120, right:120),
                        child: Container(
                          height: 40*percentScale,
                          decoration: BoxDecoration(
                            color: Color(0xFF70BFFF),
                            border: Border.all(width: 1.00, color: Color(0xFF0096DC),), borderRadius: BorderRadius.circular(50.00), 
                          ), 
                          child: Center(
                            child: Text(
                              'Export Data',
                              style: TextStyle(
                                color: Colors.white,
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
                    height:3*percentScale,
                  )
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        Future<void> readFile() async {
                            final scaffold = Scaffold.of(context);
                            var inputList = await read("ACNHPocketGuideData", context);
                            if(inputList==-1){
                              scaffold.showSnackBar(
                                SnackBar(
                                  content: Text('File does not exist.'),
                                ),
                              );
                              return;
                            }
                            inputList = inputList.split("\n");
                            for(int i = 0; i<inputList.length; i ++){
                              saveBool(inputList[i],false,true);
                            }
                            
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text('Successfully imported ' + inputList.length.toString() + " entries."),
                              ),
                            );
                        }
                        readFile();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120, right:120),
                        child: Container(
                          height: 40*percentScale,
                          decoration: BoxDecoration(
                            color: Color(0xFF37AC75),
                            border: Border.all(width: 1.00, color: Color(0xFF24BB5E),), borderRadius: BorderRadius.circular(50.00), 
                          ), 
                          child: Center(
                            child: Text(
                              'Import Data',
                              style: TextStyle(
                                color: Colors.white,
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
                    height:30*percentScale,
                  )
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: CupertinoAlertDialog(
                                title:  Text(
                                  'Would you like to delete all data?',
                                  style: TextStyle(
                                    fontFamily: 'ArialRoundedBold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                content: Text(
                                  'This action cannot be undone',
                                  style: TextStyle(
                                    fontFamily: 'ArialRounded',
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontFamily: 'ArialRounded'
                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'ArialRoundedBold'
                                      ),
                                    ),
                                    onPressed: (){
                                      HapticFeedback.mediumImpact();
                                      resetData();
                                      resetGlobals();
                                      Navigator.of(context).pop();
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                            child: CupertinoAlertDialog(
                                              title:  Text(
                                                'Data deleted. Please restart the app.',
                                                style: TextStyle(
                                                  fontFamily: 'ArialRoundedBold',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120, right:120),
                        child: Container(
                          height: 40*percentScale,
                          decoration: BoxDecoration(
                            color: Color(0xffff7070),
                            border: Border.all(width: 1.00, color: Color(0xffdc0000),), borderRadius: BorderRadius.circular(50.00), 
                          ), 
                          child: Center(
                            child: Text(
                              'Delete Data',
                              style: TextStyle(
                                color: Colors.white,
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

Widget settingContainer(double percentScale, String settingTitle, String settingKey, bool currentValue, String imageAsset, String description){
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      return Column(
        children: <Widget>[
          SizedBox(
            height:7*percentScale
          ),
          Stack(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14*percentScale),
                  child: new Container(
                    child: new Material(
                      child: new InkWell(
                        highlightColor: colorSettingsAppBar,
                        splashColor: colorSettingsAppBar,
                        enableFeedback: true,
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: CupertinoAlertDialog(
                                  title:  Text(
                                    settingTitle,
                                    style: TextStyle(
                                      fontFamily: 'ArialRoundedBold',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  content: Text(
                                    description,
                                    style: TextStyle(
                                      fontFamily: 'ArialRounded',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          fontFamily: 'ArialRounded'
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ]
                                ),
                              );
                            }
                          );
                        },
                        child: new Container(
                          width: 334*percentScale,
                          height: 65*percentScale,
                        ),
                      ),
                      color: colorWhite,
                    ),
                  )
                ),
              ),
              Container(
                width: 335*percentScale,
                height:65*percentScale,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoSwitch(
                    value: currentValue,
                    onChanged: ((bool state){
                      setState(() {
                        if(settingKey == 'northernHemisphere'){
                          northernHemisphere = state;
                          currentValue = state;
                        }else if (settingKey == 'showCatchPhraseNow') {
                          showCatchPhraseNow = state;
                          currentValue = state;
                        }else if(settingKey == 'showListOnlyActive') {
                          showListOnlyActive= state;
                          currentValue = state;
                        }else if(settingKey == 'showListVariations') {
                          showListVariations = state;
                          currentValue = state;
                        }else if(settingKey == 'skipSplash') {
                          skipSplash = state;
                          currentValue = state;
                        }else if(settingKey == 'lastCaughtWarning') {
                          lastCaughtWarning = state;
                          currentValue = state;
                        } else if(settingKey == 'showButton') {
                          showButton = state;
                          currentValue = state;
                        }
                        HapticFeedback.mediumImpact();
                      });
                      saveBool(settingKey, true, state);
                    }),
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  transform: Matrix4.translationValues(65*percentScale,0,0),
                  width: 330*percentScale,
                  height:65*percentScale,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(settingTitle,
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
              ),
              IgnorePointer(
                child: Container(
                  transform: Matrix4.translationValues(30*percentScale,0,0),
                  width: 330*percentScale,
                  height:65*percentScale,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Image.asset(
                      'assets/'+imageAsset+'.png',
                      height:24*percentScale,
                      width:24*percentScale,
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  );
}