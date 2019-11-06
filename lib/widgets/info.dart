import 'package:flutter/material.dart';
import '../models/ball_Models.dart';
import 'package:ballers/utils/sizeConfig.dart';
import 'dart:async';


class Info extends StatefulWidget{

  final int i;
  final List<Ball> ball;
  Info({@required this.i,Key key,@required this.ball}):assert(i>-1),assert(ball!=null),super(key: key);

  @override
  _AnimatedInfo createState()=> _AnimatedInfo();


}


class _AnimatedInfo extends State<Info> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  double a;
  double ao;
  double b;
  double bo;
  double c;
  double d;
  double temp;
  double tempo;
  Timer _timer;
  int i;
  int j;
  final hidden = SizeConfig.blockSizeHorizontal * 40;


  @override
  void initState(){
    animationController = AnimationController(duration: Duration(seconds: 1),vsync: this);
    super.initState();
    a= 1.0;
    b= 1.0;
    c = hidden;
    d =-10.0;
    ao=1.0;
    bo=0.0;
    i = widget.i;
    j = 0;
  }


  @override
  Widget build(BuildContext context){
    return Container(
      height: SizeConfig.blockSizeVertical * 36.95,
      width: SizeConfig.blockSizeHorizontal * 53.33,
      color: Colors.black87,
                  child: Stack(
    children:[AnimatedPositioned(child:AnimatedOpacity( child: Column(
                    children: <Widget>[
                    Text(widget.ball[i].time,style: TextStyle(color: Colors.white70,fontSize: 10.0,height: 2.5),maxLines: 1,),
                    Text(widget.ball[i].date,style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),maxLines: 1,),
                      Padding(padding: EdgeInsets.only(top: 25.0),
                          child: Image.asset(
                            "images/${widget.ball[i].country}.png",
                            width: SizeConfig.blockSizeHorizontal * 10.67,)),
                   Padding(child:RotatedBox(child: Text("${widget.ball[i].country}, ${widget.ball[i].state}",style: TextStyle(color: Colors.white,fontSize: 13.0),maxLines: 1,),quarterTurns: 1,),padding: EdgeInsets.only(right: 10.0,top: 5.0),),

                    ],crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
                  ),opacity: ao,duration: Duration(milliseconds: 700),
                  ),duration: Duration(milliseconds: 500), left: a,right:b
                  ),
    AnimatedPositioned(child:AnimatedOpacity( child: Column(
      children: <Widget>[
        Text(widget.ball[j].time,style: TextStyle(color: Colors.white70,fontSize: 10.0,height: 2.5),maxLines: 1,),
        Text(widget.ball[j].date,style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),maxLines: 1,),
        Padding(padding: EdgeInsets.only(top: 25.0),
            child: Image.asset("images/${widget.ball[j].country}.png",
              width: SizeConfig.blockSizeHorizontal * 10.67,)),
        Padding(child:RotatedBox(child: Text("${widget.ball[j].country}, ${widget.ball[j].state}",style: TextStyle(color: Colors.white,fontSize: 13.0),maxLines: 1,),quarterTurns: 1,),padding: EdgeInsets.only(right: 10.0,top: 5.0),),

      ],crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
    ),opacity: bo,duration: Duration(milliseconds: 700),
    ),duration: Duration(milliseconds: 500), left: c,right: d
    )
    ]),
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3.70,
          right: SizeConfig.blockSizeHorizontal * 6.67),
      alignment: Alignment.bottomRight,
                );



  }

  move(){
    if(a==1.0){
      j=widget.i;
      setState(() {
        a = -10.0;
        b = hidden;
        tempo=ao;
        ao=bo;
        bo=tempo;
        c=1.0;
        d=1.0;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          a = hidden;
          b = -10.0;
        });
      });
    }
    else{
      i=widget.i;
      setState(() {
        c = -10.0;
        d = hidden;
        tempo=ao;
        ao=bo;
        bo=tempo;
        a=1.0;
        b=1.0;
      });
      _timer = new Timer(Duration(milliseconds: 500),() {
        setState(() {
          c = hidden;
          d= -10.0;
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
  void didUpdateWidget(Info oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }

}
