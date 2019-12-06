import 'package:flutter/material.dart';
import 'package:quiver/time.dart';




void main(){
  runApp(MaterialApp(
    key: Key("staggered anime"),
    home: Scaffold(
      body: SafeArea(child: TextExample()),
    ),
  ));
}


class TextExample extends StatefulWidget{

  @override
  _AnimatedTextExampleState createState()=> _AnimatedTextExampleState();


}


class _AnimatedTextExampleState extends State<TextExample> with SingleTickerProviderStateMixin{

final _curve = Curves.bounceIn;
AnimationController animationController;

Animation<double> widthTween;
Animation<double> heightTween;
Animation<Color> colorTween;


    @override
  void initState(){
      animationController =
          AnimationController(duration: Duration(seconds: 2), vsync: this);
      widthTween = Tween<double>(begin: 100, end:240).animate(CurvedAnimation( parent:animationController, curve:Interval(0,0.5,curve: _curve)));
      heightTween = Tween<double>(begin: 50 , end:240).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5,1, curve: _curve)));
      colorTween = Tween<Color>(begin: Colors.blue, end: Colors.red).animate(CurvedAnimation(parent: animationController, curve: Interval(1,1, curve: Curves.linear)));

      super.initState();
      animationController.value = 0.5;
}


@override
  Widget build(BuildContext context){
    return Center(
      child: InkWell(
        onTap: (){
          //animationController.status == AnimationStatus.dismissed
          //  ? animationController.forward() : animationController.reverse();

          animationController.animateTo(1.0);
          setState(() {});
        },
        child: AnimatedBuilder(animation: animationController,
            builder: (context, widget)=> Container(
              color: colorTween.value,
              width: widthTween.value,
              height: heightTween.value,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Click me', textAlign: TextAlign.center,
                ),
              )

            )),
      )
    );
}

}