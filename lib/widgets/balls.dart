import 'package:flutter/material.dart';
import 'package:ballers/utils/sizeConfig.dart';
import '../models/ball_api.dart';
import 'package:provider/provider.dart';



class Balls extends StatefulWidget{

  final int index;
  Balls({@required this.index,Key key}):assert(index>-1),super(key: key);

  @override
  _AnimatedBalls createState()=> _AnimatedBalls();
}


class _AnimatedBalls extends State<Balls> with SingleTickerProviderStateMixin{

  final _curve = Curves.linear;
  AnimationController animationController;

  Animation<double> topTweenA;
  Animation<double> leftTweenA;
  Animation<double> rightTweenA;
  Animation<double> oTweenA;
  Animation<double> topTweenB;
  Animation<double> leftTweenB;
  Animation<double> rightTweenB;
  Animation<double> oTweenB;
  Animation<double> topTweenC;
  Animation<double> leftTweenC;
  Animation<double> rightTweenC;
  Animation<double> oTweenC;
  Animation<double> topTweenD;
  Animation<double> leftTweenD;
  Animation<double> rightTweenD;
  Animation<double> oTweenD;
  int i,j,k,index;

  List <Animation<double>> t;
  List<Animation<double>> r;
  List<Animation<double>>l;
  List<Animation<double>> o;



  @override
  void initState(){
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    topTweenA =
        Tween<double>(begin: 0.0, end: SizeConfig.blockSizeVertical * 12.32)
            .animate(
            CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenA = Tween<double>(begin: SizeConfig.blockSizeHorizontal * 32,
        end: SizeConfig.blockSizeHorizontal * 24).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenA = Tween<double>(begin: SizeConfig.blockSizeHorizontal * 45.33,
        end: SizeConfig.blockSizeHorizontal * 26.67).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    oTweenA = Tween<double>(begin: 0.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    topTweenB = Tween<double>(begin: 0.0 , end:0.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenB = Tween<double>(begin: SizeConfig.blockSizeHorizontal * 24,
        end: -SizeConfig.blockSizeHorizontal * 21.33).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenB = Tween<double>(begin: SizeConfig.blockSizeHorizontal * 26.67,
        end: -SizeConfig.blockSizeHorizontal * 24).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    oTweenB = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    topTweenC =
        Tween<double>(begin: 0.0, end: SizeConfig.blockSizeVertical * 30.79)
            .animate(
            CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenC = Tween<double>(begin: -SizeConfig.blockSizeHorizontal * 21.33,
        end: -SizeConfig.blockSizeHorizontal * 21.33).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenC = Tween<double>(begin: -SizeConfig.blockSizeHorizontal * 24,
        end: -SizeConfig.blockSizeHorizontal * 24).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    oTweenC = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    topTweenD = Tween<double>(begin: SizeConfig.blockSizeVertical * 33.79,
        end: SizeConfig.blockSizeVertical * 36.95).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenD = Tween<double>(begin: -SizeConfig.blockSizeHorizontal * 21.33,
        end: -SizeConfig.blockSizeHorizontal * 21.33).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenD = Tween<double>(begin: -SizeConfig.blockSizeHorizontal * 24,
        end: -SizeConfig.blockSizeHorizontal * 24).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
    oTweenD = Tween<double>(begin: 1.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
      t = [topTweenA, topTweenB,topTweenC,topTweenD];
      l = [leftTweenA, leftTweenB,leftTweenC,leftTweenD];
      r = [rightTweenA,rightTweenB,rightTweenC,rightTweenD];
      o = [oTweenA,oTweenB,oTweenC,oTweenD];
    i=0;j=1;k=2;
    index=widget.index;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var ballers = Provider.of<BallsApi>(context, listen: false).getBalls();
    return
                  Stack(
                    children: <Widget>[
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Image.asset("images/ball1.png"),
                        opacity: o[i].value,
                        duration: Duration(milliseconds: 400),),
                        left: l[i].value,
                        right: r[i].value,
                        top: t[i].value,
                        duration: Duration(milliseconds: 500),),
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Image.asset("images/ball2.png"),
                        opacity: o[j].value,
                        duration: Duration(milliseconds: 400),),
                        left: l[j].value,
                        right: r[j].value,
                        top: t[j].value,
                        duration: Duration(milliseconds: 500),),
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Hero(
                          tag: "balls", child: Image.asset("images/ball1.png"),
                          flightShuttleBuilder: (flightContext, animation,
                              direction,
                              fromContext, toContext) {
                            return Image.asset(
                                "images/${ballers[2].name}.png", width: 50.0);
                          },),
                        opacity: o[k].value,
                        duration: Duration(milliseconds: 500),),
                        top: t[k].value,
                        right: r[k].value,
                        left: l[k].value,
                        duration: Duration(milliseconds: 500),)
                    ],
                  );

  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  void move(){
    if(widget.index<index){
      i++;
      j++;
      k<3?k++:k=3;
      setState(() {
      });
      index--;
    }
    else if(widget.index>index){
      i>0?i--:i=0;
      j--;
      j==2?k=3:--k;
      setState(() {
      });
      index++;
    }
  }

  @override
  void didUpdateWidget(Balls oldWidget) {
    move();
    super.didUpdateWidget(oldWidget);
  }
}
