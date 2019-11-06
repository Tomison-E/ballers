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
  double verticalPosition;
  double horizontalPosition;
  Timer _timer;
  Widget vol;
  Widget vol2;
  String countryA;
  String scoreA;
  String countryB;
  String scoreB;


  @override
  void initState() {
    horizontalPosition = SizeConfig.blockSizeHorizontal * 5.33;
    verticalPosition = SizeConfig.blockSizeVertical * 2.46;
    width = SizeConfig.blockSizeHorizontal * 64;
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    slider = Tween<double>(begin: 200.0, end: 10.0).animate(
        CurvedAnimation(parent: animationController, curve: _curve));
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
      padding: EdgeInsets.only(left: horizontalPosition,
          right: horizontalPosition,
          bottom: verticalPosition),
      width: width,
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
      padding: EdgeInsets.only(
          right: horizontalPosition, top: verticalPosition),
      width: width,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockSizeVertical * 36.95,
        color: Colors.black87,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 6.16,
                        ),
                        vol,
                        AnimatedContainer(
                          color: Colors.white54,
                          height: 1.0,
                          width:
                          width,
                          duration: Duration(milliseconds: 600),
                        ),
                        vol2
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Container(
                      color: Colors.white,
                      height: SizeConfig.blockSizeVertical * 18.47,
                      width: SizeConfig.blockSizeHorizontal * 0.8,
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
        width = SizeConfig.blockSizeHorizontal * 64;
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
          padding: EdgeInsets.only(left: horizontalPosition,
              right: horizontalPosition,
              bottom: verticalPosition),
          width: width,
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
          padding: EdgeInsets.only(
              right: horizontalPosition, top: verticalPosition),
          width: width,
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
