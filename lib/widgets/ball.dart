import 'package:flutter/material.dart';
import 'package:quiver/time.dart';




void main(){
  runApp(MaterialApp(
    key: Key("staggered anime"),
    home: Scaffold(
      body: Ball(),
      backgroundColor: Colors.black,
    ),
  ));
}


class Ball extends StatefulWidget{

  @override
  _AnimatedBalls createState()=> _AnimatedBalls();


}


class _AnimatedBalls extends State<Ball> with SingleTickerProviderStateMixin{

  int i,j,k;

  List<double> t;
  List<double> r;
  List<double> l;
  List<double> o;



  @override
  void initState(){
  super.initState();

    t = [100.0,125.0,110.0,400.0,450.0];
    l = [120.0,90.0,-80.0,-80.0,-80.0];
    r = [170.0,100.0,-90.0,-90.0,-90.0];
    o = [0.0,1.0,1.0,0.0,0.0];

    i=0;j=1;k=2;
  }


  @override
  Widget build(BuildContext context){
    return Container(
      child: Align(
          child: InkWell(
            onTap: (){
              if(i<2){
                i++;
                j++;
                k<3?k++:k=3;
                setState(() {
                });
              }
            },
            onDoubleTap: (){
              if (k > 1) {
                i > 0 ? --i : i = 0;
                --j;
                j==2?k=3:--k;
                setState(() {});
              }},
            child: Container(
              height: 400.0,
              color: Colors.black,
              width: 400.0,
              child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(child:AnimatedOpacity(child: Image.asset("images/ball1.png"),opacity: o[i],duration: Duration(milliseconds: 500),),left: l[i],right: r[i],top:t[i],duration: Duration(microseconds: 800),),
                    AnimatedPositioned(child:AnimatedOpacity(child: Image.asset("images/ball2.png"),opacity: o[j],duration: Duration(milliseconds: 500),),left: l[j],right: r[j],top:t[j],duration: Duration(milliseconds: 800),),
                    AnimatedPositioned(child:AnimatedOpacity(child: Image.asset("images/ball1.png"),opacity: o[k],duration: Duration(milliseconds: 500),),top: t[k], right: r[k],left: l[k],duration: Duration(milliseconds: 800),)
                  ],
                ),
            ),
          ), alignment: Alignment.bottomCenter),
      color: Colors.black,
    );
  }
}

/*onDoubleTap: (){
            if(animationController.isCompleted) {
              animationController.reverse();
              setState(() {});
            }
            else{
             animationController.reset();
              setState(() {});
            }
          },*/

/*
    onDoubleTap: (){
    if(animationController.isCompleted) {
    animationController.reverse();
    setState(() {});
    }
    else {
      if(k>2) {
        i > 0 ? i-- : i = 0;
        j > 0 ? j-- : j = 1;
        k > 0 ? k-- : k = 2;
        setState(() {});
      }
    }
          }
 */

/*topTweenA = Tween<double>(begin: 100.0 , end:105.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenA = Tween<double>(begin: 150.0 , end:90.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenA = Tween<double>(begin: 170.0 , end:100.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    oTweenA = Tween<double>(begin: 0.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    topTweenB = Tween<double>(begin: 105.0 , end:110.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    leftTweenB = Tween<double>(begin: 90.0 , end:-80.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    rightTweenB = Tween<double>(begin: 100.0 , end:-90.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    oTweenB = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    topTweenC = Tween<double>(begin: 110.0 , end:400.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    leftTweenC = Tween<double>(begin: -80.0 , end:-80.0).animate(CurvedAnimation(parent: animationController,curve: _curve));
    rightTweenC = Tween<double>(begin: -90.0 , end:-90.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    oTweenC = Tween<double>(begin: 1.0 , end:1.0).animate(CurvedAnimation(parent: animationController, curve: _curve));
    */