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