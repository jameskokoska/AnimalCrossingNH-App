//Test app
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Hello';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyStatefulWidget(),
      theme: ThemeData (
        primaryColor: Colors.red,
        accentColor: Colors.red[50],
        backgroundColor: Colors.grey[50],
        fontFamily: '',
      ),
      darkTheme: ThemeData (
        primaryColor: Colors.green,
        accentColor: Colors.red[50],
        backgroundColor: Colors.grey[50],
        fontFamily: '',
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedIndex = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  Widget currentPageWidget;


  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  @override
  void initState(){
    one = PageOne();
    two = PageTwo();
    three = PageThree();
    
    super.initState();
    getLastIndex().then((indexResult){
      setState(() {
        selectedIndex = indexResult;
        if(indexResult==1){
          currentPageWidget = one;
        } else if (indexResult==2){
          currentPageWidget = two;
        } else {
          currentPageWidget = three;
        }
      });
    });
  }

  void onItemTapped(int index) {
    if(selectedIndex != index){
      saveIndex(index);
      HapticFeedback.mediumImpact();  
    }
    setState(() {
      selectedIndex = index;
      if(index==1){
        currentPageWidget = one;
      } else if (index==2){
        currentPageWidget = two;
      } else {
        currentPageWidget = three;
      }
    });
  }

  
  getLastIndex() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int storageIndex = prefs.getInt('index2') ?? 0;
    return storageIndex;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Test', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column (
           mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds:250),
              child: currentPageWidget,
            ),
          ]
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        buttonBackgroundColor: Theme.of(context).accentColor,
        items: <Widget>[
          Icon(Icons.filter_1,size:20,color:Colors.black),
          Icon(Icons.filter_2,size:20,color:Colors.black),
          Icon(Icons.favorite_border,size:20,color:Theme.of(context).primaryColor),
          Icon(Icons.more_horiz,size:20,color:Colors.black),
        ],
        index: selectedIndex,
        onTap: onItemTapped,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds:400),
        
      ),
    );
  }
}

saveIndex(int selectedIndex) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int storedIndex = selectedIndex ?? 0;
  print('Stored $storedIndex');
  await prefs.setInt('index2', storedIndex);
}

class PageOne extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.purple,
    );
  }
}

class PageTwo extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return SizedBox (
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:
        CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            snap: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "MAP!",
                style: TextStyle(color: Colors.black),
              ),
              titlePadding: EdgeInsetsDirectional.only(start: 20, bottom: 16),
              background: Image.network(
                "https://www.adweek.com/wp-content/uploads/2019/06/GoogleMapsNYCHero.jpg",
                fit: BoxFit.cover,
              )
            ),
            centerTitle: false,
          ),
          
          /*SliverFixedExtentList(
          itemExtent: 60.0,
          delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
              ],
            ),
          ),*/
          SliverFixedExtentList(
            itemExtent: 60.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index > 5) return null;
                List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.black, Colors.brown, Colors.grey];
                return Container(color: colors[index], height: 150.0);
              },
            ),
          ),
          SliverFillRemaining(
          ),
        ],
      )
    );
  }
}

class PageThree extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
    );
  }
}

