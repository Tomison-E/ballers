import'package:flutter/material.dart';
import 'package:ballers/widgets/header.dart';
import 'package:ballers/widgets/slider.dart';
import 'package:ballers/widgets/info.dart';
import 'package:ballers/widgets/scroll.dart';
import 'package:ballers/widgets/balls.dart';
import '../models/ball_api.dart';
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
  ball = balls;
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(child: Stack(
       children:[
         Column(
          children:[
         Flexible(
        child:Padding(
        child:Row(
              children:[
                 GestureDetector(child:Icon(Icons.keyboard_backspace,color: Colors.white),onTap: ()=> setState((){
                   ++i;
                 })),
                GestureDetector(child:ImageIcon(AssetImage("images/icons/hamb menu.png"),color: Colors.white,),onTap: ()=> setState((){
                  --i;
                }),),
              ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
              padding: EdgeInsets.only(left: 40.0,right: 40.0),
            ),flex:1),

                Flexible(
                      child:Header(i: i,ball: ball,),flex:2),
            Flexible(
                      child:   Row(
              children: <Widget>[
                       Flexible(child:
                             Column(
                    children:[
                     Expanded(child:Slide(i:i,ball:ball),flex:2 ),
                     Expanded(child:Padding(padding: EdgeInsets.only(left: 30.0,top:0.0),child:Align(child:Scroll(index: i),alignment: Alignment.topLeft)),flex: 1),
                    ],mainAxisAlignment: MainAxisAlignment.start,),flex: 2),
                Flexible(child: Info(i:i,ball: ball),flex: 1)
              ],
            ),flex:3),
    Flexible(
    child:Text(" "),flex: 2,)
          ]
        ),
         Align(
    child:FractionallySizedBox(
           heightFactor: 0.38,
           child: GestureDetector(child:Balls(index: i),
               onVerticalDragStart: (DragStartDetails details) {
             initial = details.globalPosition.dy;
           },
               onVerticalDragUpdate: (DragUpdateDetails details) {
                 distance= details.globalPosition.dy - initial;
               },
               onVerticalDragEnd: (DragEndDetails details) {
                 initial = 0.0;
                 distance>0?setState((){--i;}):setState((){++i;});
               })
         ),alignment: Alignment.bottomCenter,
         )
    ]),
    bottom: false,
        )
      ),
      backgroundColor: Colors.black,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}