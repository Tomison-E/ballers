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

    return Container(
          child: Column(
                children: [
                  Container(
                    height: 75.0,
                    color: Colors.black,
                    width: 400.0,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(child: AnimatedOpacity(opacity: ao, duration: Duration(milliseconds: 500),child: Padding(child:Text(widget.ball[ii].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 20.0,left: 40.0))),duration: Duration(milliseconds: 500),curve: _curve,top: a),
                        AnimatedPositioned(child: AnimatedOpacity(opacity: bo, duration: Duration(milliseconds: 500),child: Padding(child:Text(widget.ball[j].name, style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left),padding: EdgeInsets.only(top: 20.0,left: 40.0))),duration: Duration(milliseconds: 500),curve: _curve,top: b), //  Padding(child: Text("The Top Star ball had a popular design, it was similar to the ball of the time however there seems to the ball be there",style: TextStyle(color: Colors.white70,fontSize: 10.0),textAlign: TextAlign.left,),padding: EdgeInsets.only(left: 30.0),)
                      ],alignment: Alignment.topLeft,
                    ), alignment: Alignment.topLeft,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.black,
                    width: 400.0,
                    child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(child: AnimatedOpacity(opacity: ao, duration: Duration(milliseconds: 500),child:
                          Padding(child:Text(widget.ball[ii].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.visible,),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: c,left: 1.0,right: 1.0,),
                          AnimatedPositioned(child: AnimatedOpacity(opacity: bo, duration: Duration(milliseconds: 500),child:
                          Padding(child:Text(widget.ball[j].description, style: TextStyle(color: Colors.white70,fontSize: 10.0,fontWeight: FontWeight.normal),textAlign: TextAlign.left),padding: EdgeInsets.only(top:10.0,left: 30.0,right: 60.0))),duration: Duration(milliseconds: 500),curve: _curve,top: d,left: 1.0,right: 1.0,),
                        ],alignment: Alignment.topLeft
                    ), alignment: Alignment.topLeft,
                  ),
                ],crossAxisAlignment: CrossAxisAlignment.start,
              ),padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.black,
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

