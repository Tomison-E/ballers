import 'package:flutter/material.dart';
import '../models/ball_Models.dart';
import 'package:ballers/utils/sizeConfig.dart';
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
  double motion = 0.0;
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
    motion = SizeConfig.blockSizeVertical * 2.46;
    return Container(
          child: Column(
                children: [
                  Container(
                    height: SizeConfig.blockSizeVertical * 9.23,
                    color: Colors.black87,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(child: AnimatedOpacity(opacity: ao,
                            duration: Duration(milliseconds: 300),
                            child: Padding(child: Text(widget.ball[ii].name,
                                style: TextStyle(color: Colors.white,
                                    fontSize: SizeConfig.blockSizeVertical *
                                        4.93,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left),
                                padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2.45,
                                    left: SizeConfig.blockSizeHorizontal * 8))),
                            duration: Duration(milliseconds: 500),
                            curve: _curve,
                            top: a),
                        AnimatedPositioned(child: AnimatedOpacity(opacity: bo,
                            duration: Duration(milliseconds: 300),
                            child: Padding(child: Text(widget.ball[j].name,
                                style: TextStyle(color: Colors.white,
                                    fontSize: SizeConfig.blockSizeVertical *
                                        4.93,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left),
                                padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2.45,
                                    left: SizeConfig.blockSizeHorizontal * 8))),
                            duration: Duration(milliseconds: 500),
                            curve: _curve,
                            top: b),
                        //  Padding(child: Text("The Top Star ball had a popular design, it was similar to the ball of the time however there seems to the ball be there",style: TextStyle(color: Colors.white70,fontSize: 10.0),textAlign: TextAlign.left,),padding: EdgeInsets.only(left: 30.0),)
                      ],alignment: Alignment.topLeft,
                    ), alignment: Alignment.topLeft,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 6.16,
                    color: Colors.black87,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(
                            child: AnimatedOpacity(opacity: ao,
                                duration: Duration(milliseconds: 300),
                                child:
                                Padding(child: Text(widget.ball[ii].description,
                                  style: TextStyle(color: Colors.white70,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,),
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical *
                                            1.23,
                                        left: SizeConfig.blockSizeHorizontal *
                                            8,
                                        right: SizeConfig.blockSizeHorizontal *
                                            16))),
                            duration: Duration(milliseconds: 500),
                            curve: _curve,
                            top: c,
                            left: 1.0,
                            right: 1.0,),
                          AnimatedPositioned(
                            child: AnimatedOpacity(opacity: bo,
                                duration: Duration(milliseconds: 300),
                                child:
                                Padding(child: Text(widget.ball[j].description,
                                    style: TextStyle(color: Colors.white70,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.left, maxLines: 2,),
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical *
                                            1.23,
                                        left: SizeConfig.blockSizeHorizontal *
                                            8,
                                        right: SizeConfig.blockSizeHorizontal *
                                            16))),
                            duration: Duration(milliseconds: 500),
                            curve: _curve,
                            top: d,
                            left: 1.0,
                            right: 1.0,),
                        ],alignment: Alignment.topLeft
                    ), alignment: Alignment.topLeft,
                  ),
                ],crossAxisAlignment: CrossAxisAlignment.start,
          ), padding: EdgeInsets.only(bottom: 10.0),
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
        c = -motion;
        d = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          c = motion;
        });
      });
    }
    else{
      ii = widget.i;
      setState(() {
        temp=a;
        tempo=ao;
        a=b;
        d = -motion;
        c = 0.0;
        ao=bo;
        bo=tempo;
        b=temp;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          d = motion;
        });
      });
    }

  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(Header oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }

}

