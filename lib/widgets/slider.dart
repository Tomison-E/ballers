import 'package:flutter/material.dart';
import '../models/ball_Models.dart';
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
  Timer _timer;
  Widget vol;
  Widget vol2;
  String countryA;
  String scoreA;
  String countryB;
  String scoreB;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    slider = Tween<double>(begin: 200.0, end: 10.0)
        .animate(CurvedAnimation(parent: animationController, curve: _curve));
    countryA = widget.ball[widget.i].homeTeam;
    scoreA = " ${widget.ball[widget.i].homeTeamScore}";
    countryB = widget.ball[widget.i].awayTeam;
    scoreB = " ${widget.ball[widget.i].awayTeamScore}";
    vol = AnimatedContainer(
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
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      duration: Duration(milliseconds: 200),
      width: 240.0,
    );
    vol2 = AnimatedContainer(
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
      padding: EdgeInsets.only(right: 20.0, top: 15.0),
      duration: Duration(milliseconds: 200),
      width: 240.0,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          child: InkWell(
            child: Container(
                height: 300.0,
                color: Colors.black,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        vol,
                        AnimatedContainer(
                          color: Colors.white54,
                          height: 1.0,
                          width:
                              width ?? MediaQuery.of(context).size.width - 130,
                          duration: Duration(milliseconds: 200),
                        ),
                        vol2
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Container(
                      color: Colors.white,
                      height: 150.0,
                      width: 3.0,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )),
          ),
          alignment: Alignment.topCenter),
      color: Colors.black,
    );
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

    _timer = new Timer(Duration(milliseconds: 300), () {
      setState(() {
        width = MediaQuery.of(context).size.width - 130;
        vol = AnimatedContainer(
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
          padding: EdgeInsets.only(left: 30.0, right: 20.0, bottom: 20.0),
          duration: Duration(milliseconds: 200),
          width: MediaQuery.of(context).size.width - 130,
        );

        vol2 = AnimatedContainer(
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
          padding: EdgeInsets.only(right: 20.0, top: 15.0),
          duration: Duration(milliseconds: 200),
          width: MediaQuery.of(context).size.width - 130,
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
