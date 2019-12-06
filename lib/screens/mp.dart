/*
import'package:flutter/material.dart';
import 'package:ballers/widgets/header.dart';
import '../models/ball_api.dart';
import '../models/ball_Models.dart';
import 'dart:async';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int i;
int j;
int ii;
double a;
double ao;
double b;
double c;
double d;
double bo;
double temp;
double tempo;
List<Ball> ball;
Header header;
Timer _timer;

@override
void initState(){
  i=2;
  ball=balls;
  a=0.0;
  b=20.0;
  ao=1.0;
  bo=0.0;
  c =0.0;
  d =20.0;
  ii =i;
  j =0;
  super.initState();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SafeArea(child:
        Column(
          children:[
            Padding(
        child:Row(
              children:[
                 Icon(Icons.keyboard_backspace,color: Colors.white),
                ImageIcon(AssetImage("images/icons/hamb menu.png"),color: Colors.white,),
              ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
              padding: EdgeInsets.only(left: 40.0,right: 40.0),
            ),
            SizedBox(height:5.0),
            Header(i: 2,ball: ball,a: a,b: b,c: c,ao: ao,bo: bo,d: d,ii: ii,j: j,temp: temp,tempo: tempo,),
            GestureDetector(onTap: (){ --i;print(i);print(i);print(header.i); move();},child: Text("Boyyyyys",style: TextStyle(color:Colors.white),),)
          ]

        ),
        ),
      ),
      backgroundColor: Colors.black,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

move(){
  if(c==0.0){
    j=i;
    setState(() {
      temp=a;
      tempo=ao;
      a=b;
      c=-20.0;
      d = 0.0;
      ao=bo;
      bo=tempo;
      b=temp;
    });
    _timer = new Timer(Duration(milliseconds: 500),() {
      setState(() {
        c=20.0;
      });
    });
  }
  else{
    ii = i;
    setState(() {
      temp=a;
      tempo=ao;
      a=b;
      d=-20.0;
      c = 0.0;
      ao=bo;
      bo=tempo;
      b=temp;
    });
    _timer = new Timer(Duration(milliseconds: 500),() {
      setState(() {
        d=20.0;
      });
    });
  }

}
}
 */


/*
import 'package:flutter/material.dart';
import '../models/ball_api.dart';
import '../models/ball_Models.dart';
import 'dart:async';




void main(){
  runApp(MaterialApp(
    key: Key("staggered anime"),
    home: Scaffold(
        body: Header(i: 2),
        backgroundColor: Colors.black
    ),
  ));
}


class Header extends StatefulWidget{
final int i;
final int j;
final int ii;
final double a;
final double ao;
final double b;
final double c;
final double d;
final double bo;
final double temp;
final double tempo;
final List<Ball> ball;

Header({@required this.i,this.ball,this.a=0.0,this.ao=1.0,this.b=20.0,this.bo=0.0,this.c=0.0,this.d=20.0,this.ii=2,this.j=0,this.temp=0.0,this.tempo=0.0});


  @override
  _AnimatedHeader createState()=> _AnimatedHeader();

}


class _AnimatedHeader extends State<Header> with SingleTickerProviderStateMixin{
  final _curve = Curves.linear;
  AnimationController animationController;
  Timer _timer;

  @override
  void initState(){
    animationController = AnimationController(duration: Duration(seconds: 1),vsync: this);
    super.initState();

  }


  @override
  Widget build(BuildContext context){

    return Container(
      child: Align(
          child: InkWell(
            onTap: (){
           print(widget.i);
           print(widget.j);
          // move();
            },
            onDoubleTap: () {
            // --widget.i;
           //  move();
            },
            child: Column(
    children: [
      Container(
              height: 90.0,
              color: Colors.black,
              width: 400.0,
              child: Stack(
                children: <Widget>[
               AnimatedPositioned(child: AnimatedOpacity(opacity: widget.ao, duration: Duration(milliseconds: 500),child: Padding(child:Text(widget.ball[widget.ii].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 40.0,bottom: 20.0,left: 30.0))),duration: Duration(milliseconds: 500),curve: _curve,top: widget.a),
               AnimatedPositioned(child: AnimatedOpacity(opacity: widget.bo, duration: Duration(milliseconds: 500),child: Padding(child:Text(widget.ball[widget.j].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 40.0,bottom: 20.0,left: 30.0))),duration: Duration(milliseconds: 500),curve: _curve,top: widget.b), //  Padding(child: Text("The Top Star ball had a popular design, it was similar to the ball of the time however there seems to the ball be there",style: TextStyle(color: Colors.white70,fontSize: 10.0),textAlign: TextAlign.left,),padding: EdgeInsets.only(left: 30.0),)
                ],alignment: Alignment.topLeft,
              ), alignment: Alignment.topLeft,
            ),
            Container(
             height: 50.0,
             color: Colors.black,
              width: 400.0,
              child: Stack(
        children: <Widget>[
          AnimatedPositioned(child: AnimatedOpacity(opacity: widget.ao, duration: Duration(milliseconds: 500),child:
          Padding(child:Text(widget.ball[widget.ii].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.visible,),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: widget.c,left: 1.0,right: 1.0,),
          AnimatedPositioned(child: AnimatedOpacity(opacity: widget.bo, duration: Duration(milliseconds: 500),child:
          Padding(child:Text(widget.ball[widget.j].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: widget.d,left: 1.0,right: 1.0,),
        ],alignment: Alignment.topLeft
      ), alignment: Alignment.topLeft,
    ),
      ],crossAxisAlignment: CrossAxisAlignment.start,
            )
          ),
          alignment: Alignment.topCenter),
      color: Colors.black,
    );



  }

  /*move(){
    if(c==0.0){
      j=widget.i;
      setState(() {
        temp=a;
        tempo=ao;
        a=b;
        c=-20.0;
        d = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          c=20.0;
        });
      });
    }
    else{
      i = widget.i;
      setState(() {
        temp=a;
        tempo=ao;
        a=b;
        d=-20.0;
        c = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          d=20.0;
        });
      });
    }

  }*/

}



 */
/*
 import 'package:flutter/material.dart';
import '../models/ball_Models.dart';
import 'dart:async';


class Header extends StatefulWidget{
  final int i;
  final   List<Ball> ball;
  Header({@required this.i,Key key,@required this.ball}):assert(i>-1),assert(ball!=null),super(key: key);
  @override
  _AnimatedHeader createState()=> _AnimatedHeader();
}

class _AnimatedHeader extends State<Header> with SingleTickerProviderStateMixin{
  int ii;
  int j;
  final _curve = Curves.linear;
  AnimationController animationController;
  double a;
  double ao;
  double b;
  double c;
  double d;
  double bo;
  double temp;
  double tempo;
  Timer _timer;
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;



  @override
  void initState(){
    animationController = AnimationController(duration: Duration(seconds: 1),vsync: this);
    a=0.0;
    b=20.0;
    ao=1.0;
    bo=0.0;
    c =0.0;
    d =20.0;
    ii =widget.i;
    j =0;
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    print(screenHeight);
    print(screenWidth);
    return Container(
          child: Column(
                children: [
                  Container(
                    height: 75.0,
                    color: Colors.black87,
                    width: 400.0,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(child: AnimatedOpacity(opacity: ao, duration: Duration(milliseconds: 300),child: Padding(child:Text(widget.ball[ii].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 20.0,left: 40.0))),duration: Duration(milliseconds: 500),curve: _curve,top: a),
                        AnimatedPositioned(child: AnimatedOpacity(opacity: bo, duration: Duration(milliseconds: 300),child: Padding(child:Text(widget.ball[j].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 20.0,left: 40.0))),duration: Duration(milliseconds: 500),curve: _curve,top: b), //  Padding(child: Text("The Top Star ball had a popular design, it was similar to the ball of the time however there seems to the ball be there",style: TextStyle(color: Colors.white70,fontSize: 10.0),textAlign: TextAlign.left,),padding: EdgeInsets.only(left: 30.0),)
                      ],alignment: Alignment.topLeft,
                    ), alignment: Alignment.topLeft,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.black87,
                    width: 400.0,
                    child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(child: AnimatedOpacity(opacity: ao, duration: Duration(milliseconds: 300),child:
                          Padding(child:Text(widget.ball[ii].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.visible,),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: c,left: 1.0,right: 1.0,),
                          AnimatedPositioned(child: AnimatedOpacity(opacity: bo, duration: Duration(milliseconds: 300),child:
                          Padding(child:Text(widget.ball[j].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: d,left: 1.0,right: 1.0,),
                        ],alignment: Alignment.topLeft
                    ), alignment: Alignment.topLeft,
                  ),
                ],crossAxisAlignment: CrossAxisAlignment.start,
              ),padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.black87,
    );
  }

  void move(){
    if(c==0.0){
      j=widget.i;
      setState(() {
        temp=a;
        tempo=ao;
        a=b;
        c=-20.0;
        d = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          c=20.0;
        });
      });
    }
    else{
      ii = widget.i;
      setState(() {
        temp=a;
        tempo=ao;
        a=b;
        d=-20.0;
        c = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          d=20.0;
        });
      });
    }

  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Header oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }

}

import 'package:flutter/material.dart';
import '../models/ball_Models.dart';
import 'package:ballers/utils/sizeConfig.dart';
import 'dart:async';

class Slide extends StatefulWidget {
  final int i;
  final List<Ball> ball;

  Slide({@required this.i, Key key, @required this.ball})
      : assert(i > -1),
        assert(ball != null),
        super(key: key);

  @override
  _AnimatedSlider createState() => _AnimatedSlider();
}

class _AnimatedSlider extends State<Slide> with SingleTickerProviderStateMixin {
  final _curve = Curves.linear;
  AnimationController animationController;
  Animation<double> slider;
  double width;
  Timer _timer;
  Widget vol;
  Widget vol2;
  String countryA;
  String scoreA;
  String countryB;
  String scoreB;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    slider = Tween<double>(begin: 200.0, end: 10.0)
        .animate(CurvedAnimation(parent: animationController, curve: _curve));
    countryA = widget.ball[widget.i].homeTeam;
    scoreA = " ${widget.ball[widget.i].homeTeamScore}";
    countryB = widget.ball[widget.i].awayTeam;
    scoreB = " ${widget.ball[widget.i].awayTeamScore}";
    vol = Container(
      child: Row(
        children: [
          Text(widget.ball[widget.i].about,
              style: TextStyle(color: Colors.white54)),
          RichText(
            text: TextSpan(
                text: countryA,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                      text: scoreA,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: -3.0))
                ]),
            maxLines: 1,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      ),
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      width: 240.0,
    );
    vol2 = Container(
      child: RichText(
        text: TextSpan(
            text: countryB,
            style: TextStyle(fontSize: 15, color: Colors.white),
            children: [
              TextSpan(
                  text: scoreB,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.0))
            ]),
        maxLines: 1,
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0, top: 15.0),
      width: 240.0,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
                height: 300.0,
                color: Colors.black87,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        vol,
                        AnimatedContainer(
                          color: Colors.white54,
                          height: 1.0,
                          width:
                              width ?? MediaQuery.of(context).size.width - 130,
                          duration: Duration(milliseconds: 600),
                        ),
                        vol2
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Container(
                      color: Colors.white,
                      height: 150.0,
                      width: 3.0,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void move() {
    setState(() {
      vol = Text(" ");
      vol2 = Text(" ");
      width = 5.0;
      countryA = widget.ball[widget.i].homeTeam;
      scoreA = " ${widget.ball[widget.i].homeTeamScore}";
      countryB = widget.ball[widget.i].awayTeam;
      scoreB = " ${widget.ball[widget.i].awayTeamScore}";
    });

    _timer = new Timer(Duration(milliseconds: 400), () {
      setState(() {
        width = MediaQuery.of(context).size.width - 130;
        vol = Container(
          child: Row(
            children: [
              Text(widget.ball[widget.i].about,
                  style: TextStyle(color: Colors.white54)),
              RichText(
                text: TextSpan(
                    text: countryA,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                          text: scoreA,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: -3.0))
                    ]),
                maxLines: 1,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
          ),
          padding: EdgeInsets.only(left: 30.0, right: 20.0, bottom: 20.0),
          width: MediaQuery.of(context).size.width - 130,
        );

        vol2 = Container(
          child: RichText(
            text: TextSpan(
                text: countryB,
                style: TextStyle(fontSize: 15, color: Colors.white),
                children: [
                  TextSpan(
                      text: scoreB,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.0))
                ]),
            maxLines: 1,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20.0, top: 15.0),
          width: MediaQuery.of(context).size.width - 130,
        );
      });
    });
  }

  @override
  void didUpdateWidget(Slide oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }
}
/*
import'package:flutter/material.dart';
import 'package:ballers/utils/sizeConfig.dart';
import '../models/ball_api.dart';
import '../models/ball_Models.dart';
import 'package:ballers/widgets/arc.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.i,@required this.ball}) : super(key: key);
   final int i ;
   final  List<Ball> ball ;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int i;
  List<Ball> ball;
  bool shuffle;
  double sizes;
  @override
  void initState(){
    i=2;
    ball = balls;
    shuffle=false;
    sizes = 3.0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: SafeArea(child:
                Column(
                    children:[
                      Flexible(
                          child:Container(
                child:Column(
                children:[
                 Flexible(child: Padding(
                            child:Row(
                              children:[
                                GestureDetector(child:Icon(Icons.keyboard_backspace,color: Colors.white),onTap:()=> setState(() {
                                  shuffle=!shuffle;
                                  sizes=10.0;
                                  print(shuffle);
                                })),
                                Image.asset("images/${ball[i].name}.png",width: 50.0),
                                ImageIcon(AssetImage("images/icons/hamb menu.png"),color: Colors.white),
                              ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            padding: EdgeInsets.only(left: 30.0,right: 30.0),
                          ),flex: 1,),
                  Flexible(
                      child:Column(
                       children: <Widget>[
                         Padding(padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6.16,left: SizeConfig.blockSizeHorizontal*15),child: Image.asset("images/${ball[i].country}.png",width: SizeConfig.blockSizeHorizontal*10.67)),
                         SizedBox(height: 10.0),
                         Padding(child:Text(ball[i].name,style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold)),padding: EdgeInsets.only(left: 30.0),)
                       ],
                      ),flex:2),
                  Flexible(
                      child:Padding(padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2.46,left: 30.0,right: 30.0),child:
                        Row(
                          children: <Widget>[
                        Padding(child: RotatedBox(child: Text("Descriptions",style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),maxLines: 1,),quarterTurns: 1,),padding: EdgeInsets.only(top: 15.0),),
                            SizedBox(width: 30.0),
                            Expanded(child:
                            Stack(
                           children:[
                           Align(child: Padding(child:Text(ball[i].details,style: TextStyle(color: Colors.grey,fontSize: 12.0)),padding: EdgeInsets.only(top:5.0),),alignment: Alignment.center,),
                             Align(child:Container(
                               child: Row(
                                 children: <Widget>[
                                   CircleAvatar(maxRadius: 2.0,backgroundColor: Colors.white),
                                   CircleAvatar(maxRadius: 2.0,backgroundColor: Colors.white),
                                   CircleAvatar(maxRadius: 2.0,backgroundColor: Colors.white),
                                 ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               ),
                               width: 28.0,
                               height: 13.0,
                               decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.circular(5.0)),
                             ),alignment: Alignment.bottomLeft,
                             )
                            ],
    ),
                            )
                          ],
                        ),),flex:2),
        ],crossAxisAlignment: CrossAxisAlignment.start),/*decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/b.gif"))),*/
    ),flex: 1,),
                      Flexible(
                          child:
                          Stack(
                              children:[
                                Positioned(child:Image.asset("images/${ball[i].name}.png"),left: -100,right: -110,top: -70.0,),
                               Positioned(child: PathExample(shuffle:shuffle,sizes: sizes,),left: -1.0,right: 0.0,bottom: 0.0,top:-47),
                                Positioned(child: RichText(text: TextSpan(
                                  text:'weight \n\n',style: TextStyle(color: Colors.white,fontSize: 10.0,fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: '221 g',style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold))
                                  ]
                                ),textAlign: TextAlign.center),left: 55.0,top: 30.0),

                                Positioned(child: RichText(text: TextSpan(
                                    text:'properties \n\n',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(text: 'Waterproof',style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.bold))
                                    ]
                                ),textAlign: TextAlign.center),left: 125.0,top: 115.0,),
                                Positioned(child: RichText(text: TextSpan(
                                    text:'panela \n\n',style: TextStyle(color: Colors.white,fontSize: 10.0,fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(text: '18 panels',style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold))
                                    ]
                                ),textAlign: TextAlign.center),left: 285.0,top: 245.0)
                              ]
                          ),flex: 1)
                    ]
                ),
            bottom: false,right: false,left: false,
          )
      ), backgroundColor: Colors.black87,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
  */

  import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:ballers/models/shuffle.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

void main() => runApp(
  MaterialApp(
    home: Arc(),
  ),
);

class Arc extends StatefulWidget {

  @override
  _ArcState createState() => _ArcState();

}

  class _ArcState extends State<Arc> with SingleTickerProviderStateMixin {
   double _fraction=150.0;
   double _fractionB= 330.0;
   double _fractionC= 470.0;

   double _faction = -69.0;
   double _factionB = -74.0;
   double _factionC = -67.0;

  static List<Offset> offsetList = [Offset(-69.0, 150.0), Offset(-74.5, 330.0),Offset(-67.0, 470.0),Offset(-63.0, 560.0)];
  Animation<double> animation;
   Animation<double> animationB;
   Animation<double> animationC;
   Animation<double> danimation;
   Animation<double> danimationB;
   Animation<double> danimationC;
   AnimationController controller;
   List<double> state;
   List<double> states;
   List<double> dy = [150.0,330.0,470.0,560.0];
   List<double> dx = [-69.0,-74.5,-67.0,-63.0];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 8000), vsync: this);

  animation = Tween(begin: dy[0], end: dy[1]).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });
    danimation = Tween(begin: dx[0], end: dx[1]).animate(controller)
      ..addListener(() {
        setState(() {
          _faction = danimation.value;
        });
      });

    /*animation = Tween(begin: offsetList[0], end: offsetList[1]).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });*/

    animationB = Tween(begin: dy[1], end: dy[2]).animate(controller)
      ..addListener(() {
        setState(() {
          _fractionB = animationB.value;
        });
      });

    danimationB = Tween(begin: dx[1], end: dx[2]).animate(controller)
      ..addListener(() {
        setState(() {
          _factionB = danimationB.value;
        });
      });
    animationC = Tween(begin: dy[2], end: dy[3]).animate(controller)
      ..addListener(() {
        setState(() {
          _fractionC = animationC.value;
        });
      });
    danimationC = Tween(begin: dx[2], end: dx[3]).animate(controller)
      ..addListener(() {
        setState(() {
          _factionC = danimationC.value;
        });
      });
    states=[_faction,_factionB,_factionC];
    state= [_fraction,_fractionB,_fractionC];
    //controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    var repaints = Provider.of<Shuffle>(context, listen: false);
    var index = repaints.index;
    return CustomPaint(
      painter: PathPainter(index: index,fraction: state,faction: states),
    );
  }

 @override
 void dispose() {
   controller.dispose();
   super.dispose();
 }

 @override
 void didUpdateWidget(Arc oldWidget) {
  controller.forward();
   print("k");
   super.didUpdateWidget(oldWidget);
 }
}

class PathPainter extends CustomPainter {
  final index;
  final List<double> fraction;
  List<double> faction;
  PathPainter({this.index,this.fraction,this.faction});
  Timer _timer;

  @override
  void paint(Canvas canvas, Size size) {
   /* final rect = Rect.fromLTRB(250, 100, 300, 150);
    final startAngle = -math.pi / 2;
    final sweepAngle = math.pi;
    final useCenter = false;*/
    List<int> loc = new List(4);
   //int j = index+3;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paints = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final painted = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

   final painter = Paint()
     ..color = Colors.white
     ..style = PaintingStyle.stroke
     ..strokeWidth = 8;

    num degToRad(num deg) => deg * (math.pi / 180.0);
   //canvas.drawArc(rect, degToRad(-220),degToRad(90), useCenter, paint);
   var offsetList = [Offset(-69.0, 150.0), Offset(-74.5, 330.0),Offset(-67.0, 470.0),Offset(-63.0, 560.0)];
    var rad = [3.0,6.0,3.0,3.0];
    var list = [0,1,2,3];
    for(int i=0;i<list.length;i++){
      loc[i]=list[(index+i)%4];
    }
    //canvas.drawPoints(PointMode.lines, offsetList, paint);
   canvas.rotate(-.8);
    //canvas.drawArc(rect, degToRad(0),degToRad(270), useCenter, paint);
  //  canvas.drawLine(Offset(90.0, 10.0), Offset(90.0, 80.0), paint);
    //canvas.drawOval(Rect.fromPoints(Offset(50.0, 350), Offset(170, 500)), paint);
    //canvas.drawOval(Rect.fromCenter(center:Offset(0.0, 300),width: 10.0,height: 370.0), paint);
    var path = Path();
  /*  if(j>3){
      j=0;
    }*/

    //path.moveTo(30.0, 0.0);
   // path.lineTo(-10.0, -100.0);
    //path.lineTo(-10.0, 500.0);
   // path.lineTo(size.width+100.0, 0.0);
   // path.arcToPoint(Offset(150.0,250.0));
    //path.addArc(Rect.fromCenter(center:Offset(-50.0, 300),width: 50.0,height:470.0), degToRad(300.0), degToRad(-210.0));

   canvas.drawCircle(offsetList[loc[0]], rad[loc[0]], painted);
   canvas.drawCircle(offsetList[loc[1]], rad[loc[1]], painter);
   canvas.drawCircle(offsetList[loc[2]], rad[loc[2]], painted);
  canvas.drawCircle(offsetList[loc[3]], rad[loc[3]], paints);
    /*index>0? _timer = new Timer(Duration(milliseconds: 300),() {
      canvas.drawCircle(Offset(faction[loc[0]], fraction[loc[0]]), rad[loc[0]], painter);
    }):canvas.drawCircle(Offset(faction[loc[0]], fraction[loc[0]]), rad[loc[0]], painter);
   canvas.drawCircle(Offset(faction[loc[1]], fraction[loc[1]]), rad[loc[1]], painter);
    index>0?  _timer = new Timer(Duration(milliseconds: 100),() {
      canvas.drawCircle(Offset(faction[loc[2]], fraction[loc[2]]), rad[loc[2]], painter);
    }): canvas.drawCircle(Offset(faction[loc[2]], fraction[loc[2]]), rad[loc[2]], painter);*/
    //canvas.drawPoints(PointMode.points, offsetList, paints);
   // path.addArc(Rect.fromPoints(Offset(50.0, 350), Offset(170, 500)), degToRad(300.0), degToRad(-90.0));
   // canvas.drawCircle(Offset(90.0, 350.0), 6.0, paint);
  //  path.close();
    //print(size.height);
    /*
    index==1?canvas.drawCircle(Offset(-74.5, 340.0), 6.0, paints):canvas.drawCircle(offsetList[index], rad[index], paints);
   index==1? canvas.drawCircle(Offset(-67.0, 480.0), 3.0, painter):canvas.drawCircle(offsetList[index+1], 6.0, painter);
   index==1?canvas.drawCircle(offsetList[index+2], 3.0, paints):canvas.drawCircle(offsetList[index+2], rad[index+2], paints);
   index==1? canvas.drawCircle(Offset(-69.0, 160.0), 3.0, paints):canvas.drawCircle(offsetList[j], rad[j], paints);
     */
    path.addArc(Rect.fromCenter(center:Offset(-50.0, 300),width: 50.0,height:470.0), degToRad(300.0), degToRad(-210.0));
    canvas.drawPath(path, paint);
    //index==1?canvas.drawCircle(Offset(-74.5, 340.0), 6.0, paints):print("no");
  // index==1?canvas.drawCircle(offsetList[3], 2.0, paints):print("no");
   //index==1?canvas.drawCircle(offsetList[2], 4.0, paints):print("no");
  // index==1?canvas.drawCircle(offsetList[0], 4.0, paints):print("no");

// close the path to form a bounded shape
    canvas.drawCircle(offsetList[1], 7.0, painted);

    // canvas.drawOval(Rect.fromCircle(center:Offset(0.0, 550),radius: 10.0 ), paint);

  }


  @override
  bool shouldRepaint(PathPainter oldDelegate) {
   return index!=oldDelegate.index;
  }
}
  */


