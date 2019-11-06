import'package:flutter/material.dart';
import 'package:ballers/widgets/header.dart';
import 'package:ballers/widgets/slider.dart';
import 'package:ballers/widgets/info.dart';
import 'package:ballers/widgets/scroll.dart';
import 'package:ballers/widgets/balls.dart';
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
@override
void initState(){
  i=2;
  distance = 0.0;
  initial = 0.0;
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    ball = Provider.of<BallsApi>(context, listen: false).getBalls();
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
                                Icon(Icons.keyboard_backspace, color: Colors
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
                      heightFactor: 0.45,
                      child: GestureDetector(child: Balls(index: i),
                        onVerticalDragStart: (DragStartDetails details) {
                          initial = details.globalPosition.dy;
                        },
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          distance = details.globalPosition.dy - initial;
                        },
                        onVerticalDragEnd: (DragEndDetails details) {
                          initial = 0.0;
                          distance > 0 ? Provider.of<BallsApi>(context)
                              .decrement() : Provider.of<BallsApi>(context)
                              .increment();
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
}