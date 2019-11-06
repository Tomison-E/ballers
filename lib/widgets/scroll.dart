import 'package:flutter/material.dart';
import 'package:ballers/utils/sizeConfig.dart';
import 'dart:async';



class Scroll extends StatefulWidget{

  final int index;
  Scroll({@required this.index,Key key}):assert(index>-1),super(key: key);

  @override
  _AnimatedScroll createState()=> _AnimatedScroll();


}


class _AnimatedScroll extends State<Scroll> with SingleTickerProviderStateMixin{

  final _curve = Curves.linear;
  AnimationController animationController;
  ScrollController _controller;
  List<double> radian;
  List<Color> color;
  int i;
  double median;






  @override
  void initState(){
    animationController = AnimationController(duration: Duration(seconds: 1),vsync: this);
    _controller =ScrollController();
    i = widget.index;
    median = 0.0;
    radian = [2.0,2.0,4.0,2.0,2.0];
    color = [Colors.white54,Colors.white70,Colors.white,Colors.white70,Colors.white54];
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Container(
      height: SizeConfig.blockSizeVertical * 8.621,
      width: SizeConfig.blockSizeHorizontal * 8,
      color: Colors.black87,
                child:ListView(
                  children: <Widget>[
                     Padding(child:CircleAvatar(maxRadius: radian[0],backgroundColor: color[0],),padding: EdgeInsets.only(bottom: 5.0)),
                     Padding(child:CircleAvatar(maxRadius: radian[1],backgroundColor: color[1],),padding: EdgeInsets.only(bottom: 5.0)),
                     Padding(child:CircleAvatar(maxRadius: radian[2],backgroundColor: color[2],),padding: EdgeInsets.only(bottom: 5.0)),
                     Padding(child:CircleAvatar(maxRadius: radian[3],backgroundColor: color[3],),padding: EdgeInsets.only(bottom: 5.0)),
                     Padding(child:CircleAvatar(maxRadius: radian[4],backgroundColor:color[4],),padding: EdgeInsets.only(bottom: 5.0)),
                  ],padding: EdgeInsets.all(3.0),controller: _controller,
                ),
            );

  }
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  void move(){
      if(widget.index<5 || widget.index>0) { // to limit movement to only central
        if(widget.index>i)
          {
            median = median + 4.0;
            i++;
          }else if(i>widget.index){
          median = median - 4.0;
          i--;
        }
        _controller.animateTo(
            median, duration: Duration(milliseconds: 300),
            curve: _curve);
        radian =
        [2.0, 2.0, 2.0, 2.0, 2.0];
        color = [
          Colors.white54,
          Colors.white54,
          Colors.white54,
          Colors.white54,
          Colors.white54,
        ];
        setState(() {
          radian[widget.index] = 4.0;
          color[widget.index] = Colors.white;
        });
      }
    }


  @override
  void didUpdateWidget(Scroll oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }
}

