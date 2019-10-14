import 'package:flutter/material.dart';




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
    animationController = AnimationController(duration: Duration(seconds: 1),vsync: this);
    topTweenA = Tween<double>(begin: 0.0 , end:100.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenA = Tween<double>(begin: 120.0 , end:90.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenA = Tween<double>(begin: 170.0 , end:100.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    oTweenA = Tween<double>(begin: 0.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    topTweenB = Tween<double>(begin: 0.0 , end:0.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenB = Tween<double>(begin: 90.0 , end:-80.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenB = Tween<double>(begin: 100.0 , end:-90.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    oTweenB = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    topTweenC = Tween<double>(begin: 0.0 , end:250.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    leftTweenC = Tween<double>(begin: -80.0 , end:-80.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    rightTweenC = Tween<double>(begin: -90.0 , end:-90.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    oTweenC = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    topTweenD = Tween<double>(begin: 250.0 , end:300.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    leftTweenD = Tween<double>(begin: -80.0 , end:-80.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    rightTweenD = Tween<double>(begin: -90.0 , end:-90.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    oTweenD = Tween<double>(begin: 1.0 , end:0.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
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
    return  AnimatedBuilder(animation: animationController,
              builder: (context, widget) =>
                  Stack(
                    children: <Widget>[
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Image.asset("images/ball.png"),
                        opacity: o[i].value,
                        duration: Duration(milliseconds: 400),),
                        left: l[i].value,
                        right: r[i].value,
                        top: t[i].value,
                        duration: Duration(milliseconds: 800),),
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Image.asset("images/ball2.png"),
                        opacity: o[j].value,
                        duration: Duration(milliseconds: 400),),
                        left: l[j].value,
                        right: r[j].value,
                        top: t[j].value,
                        duration: Duration(milliseconds: 800),),
                      AnimatedPositioned(child: AnimatedOpacity(
                        child: Image.asset("images/ball1.png"),
                        opacity: o[k].value,
                        duration: Duration(milliseconds: 400),),
                        top: t[k].value,
                        right: r[k].value,
                        left: l[k].value,
                        duration: Duration(milliseconds: 800),)
                    ],
                  ),
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
