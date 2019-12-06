import'package:flutter/material.dart';
import 'package:ballers/widgets/header.dart';
import 'package:ballers/widgets/slider.dart';
import 'package:ballers/widgets/info.dart';
import 'package:ballers/widgets/scroll.dart';
import 'package:ballers/widgets/balls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ballers/utils/sizeConfig.dart';
import '../models/ball_api.dart';
import 'package:provider/provider.dart';
import 'package:ballers/utils/uiData.dart';
import '../models/ball_Models.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int i;
List<Ball> ball;
double initial;
double distance;
int counter;

@override
void initState(){
  ball = Provider.of<BallsApi>(context, listen: false).getBalls();
  distance = 0.0;
  initial = 0.0;
  counter = Provider
      .of<BallsApi>(context, listen: false)
      .counter;
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) =>
      _incrementCounter(context));
  //await prefs.setInt('counter', counter);
}
  @override
  Widget build(BuildContext context) {
    i = Provider
        .of<BallsApi>(context, listen: false)
        .i;
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: SafeArea(child: Stack(
              children: [
                Column(
                    children: [
                      Flexible(
                          child: Padding(
                            child: Row(
                              children: [
                                Icon(Icons.home, color: Colors
                                    .white),
                                ImageIcon(AssetImage(
                                    "images/icons/hamb menu.png"), color: Colors
                                    .white),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          ), flex: 1),

                      Flexible(
                          child: Header(i: i, ball: ball), flex: 2),
                      Flexible(
                          child: Row(
                            children: <Widget>[
                              Flexible(child:
                              Column(
                                children: [
                                  Expanded(
                                      child: Slide(i: i, ball: ball), flex: 2),
                                  Expanded(child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30.0, top: 0.0),
                                      child: Align(child: Scroll(index: i),
                                          alignment: Alignment.topLeft)),
                                      flex: 1),
                                ], mainAxisAlignment: MainAxisAlignment.start,),
                                  flex: 2),
                              Flexible(child: Info(i: i, ball: ball), flex: 1)
                            ],
                          ), flex: 3),
                      Flexible(
                        child: Text(" "), flex: 3,)
                    ]
                ),
                Align(
                  child: FractionallySizedBox(
                      heightFactor: 0.43,
                      child: GestureDetector(child: Balls(index: i),
                        onVerticalDragStart: (DragStartDetails details) {
                          initial = details.globalPosition.dy;
                        },
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          distance = details.globalPosition.dy - initial;
                        },
                        onVerticalDragEnd: (DragEndDetails details) {
                          initial = 0.0;
                          distance > 0 ? i > 0 ? Provider.of<BallsApi>(context)
                          // ignore: unnecessary_statements
                              .decrement() : null : i < 2 ? Provider.of<
                              BallsApi>(context)
                          // ignore: unnecessary_statements
                              .increment() : null;
                        },
                        onDoubleTap: () =>
                            Navigator.pushNamed(
                                context,
                                UIData.detailRoute),)
                  ), alignment: Alignment.bottomCenter,
                )
              ]),
            bottom: false, right: false, left: false,
          )
      ),
      backgroundColor: Colors.black87,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

void showCustomDialogWithImage(BuildContext context) {
  Dialog dialogWithImage = Dialog(
    child: Container(
      height: 350.0,
      width: 350.0,
      color: Colors.transparent,
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [Text(
                  "Gesture Hint",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                  IconButton(
                      icon: Icon(Icons.clear, color: Colors.white, size: 35,),
                      onPressed: () => Navigator.of(context).pop())
                ], mainAxisAlignment: MainAxisAlignment.spaceAround,)
          ),
          Row(
            children: [Container(
              height: 150,
              child: Image.asset(
                'images/GestureA.png',
                fit: BoxFit.contain,
              ),
            ),
              Container(
                height: 150,
                child: Image.asset(
                  'images/GestureB.png',
                  fit: BoxFit.contain,
                ),
              ),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Text(
                'Swipe up or down on ball image to iterate through list of ball items',
                style: TextStyle(fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ),
              SizedBox(width: 10.0),
              Expanded(child: Text(
                'Double tap on ball image for more details',
                style: TextStyle(fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),)
            ],
          ),
        ],
      ),
    ), backgroundColor: Colors.transparent, elevation: 500.0,
  );

  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}


_incrementCounter(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  counter = Provider
      .of<BallsApi>(context, listen: false)
      .counter = (prefs.getInt('counter') ?? 0) + 1;
  if (counter == 1) {
    await prefs.setInt('counter', counter);
    showCustomDialogWithImage(context);
  }
}
}