import 'package:flutter/material.dart';
import 'package:ballers/utils/sizeConfig.dart';
import '../models/ball_api.dart';
import 'package:ballers/utils/uiData.dart';
import 'package:provider/provider.dart';
import 'package:ballers/models/shuffle.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double initial;
  double distance;

  @override
  void initState() {
    distance = 0.0;
    initial = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var loc = Provider.of<Shuffle>(context, listen: false).loc;
    return Scaffold(
      body: Stack(children: [
        Image.asset("images/scene.png",
            fit: BoxFit.cover, height: SizeConfig.blockSizeVertical * 50),
        SafeArea(
          child: Column(children: [
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      child: Row(
                        children: [
                          GestureDetector(
                              child: Icon(Icons.keyboard_backspace,
                                  color: Colors.white),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                          Stack(children: [
                            Consumer<BallsApi>(
                                builder: (context, baller, child) => Hero(
                                    tag: "balls",
                                    child: Image.asset(
                                        "images/${baller.getBalls()[baller.i].name}.png",
                                        width: 50.0)))
                          ]),
                          ImageIcon(AssetImage("images/icons/hamb menu.png"),
                              color: Colors.white),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 6.16,
                                  left: SizeConfig.blockSizeHorizontal * 15),
                              child: Consumer<BallsApi>(
                                  builder: (context, ball, child) => Image.asset(
                                      "images/${ball.getBalls()[ball.i].country}.png",
                                      width: SizeConfig.blockSizeHorizontal *
                                          10.67))),
                          Padding(
                            child: Consumer<BallsApi>(
                                builder: (context, ball, child) => Text(
                                    ball.getBalls()[ball.i].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))),
                            padding: EdgeInsets.only(left: 30.0),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      flex: 2),
                  Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2.46,
                            left: 30.0,
                            right: 30.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              child: RotatedBox(
                                child: Text(
                                  "Descriptions",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                                quarterTurns: 1,
                              ),
                              padding: EdgeInsets.only(top: 15.0),
                            ),
                            SizedBox(width: 30.0),
                            Expanded(
                              child: Stack(
                                children: [
                                  Align(
                                    child: Padding(
                                      child: Consumer<BallsApi>(
                                          builder: (context, ball, child) =>
                                              Text(
                                                  ball
                                                      .getBalls()[ball.i]
                                                      .details,
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12.0))),
                                      padding: EdgeInsets.only(top: 5.0),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Align(
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                              maxRadius: 2.0,
                                              backgroundColor: Colors.white),
                                          CircleAvatar(
                                              maxRadius: 2.0,
                                              backgroundColor: Colors.white),
                                          CircleAvatar(
                                              maxRadius: 2.0,
                                              backgroundColor: Colors.white),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                      ),
                                      width: 28.0,
                                      height: 13.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 2),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              flex: 1,
            ),
            Flexible(
                child: Consumer<Shuffle>(
                    builder: (context, physics, child) => GestureDetector(
                          child: Stack(children: [
                            //0.79
                            Positioned(
                              child: Consumer<BallsApi>(
                                  builder: (context, ball, child) => Hero(
                                      tag: "ball",
                                      child: Image.asset(
                                          "images/${ball.getBalls()[ball.i].name}1.png",
                                          height: 450,
                                          fit: BoxFit.fitHeight))),
                              left: -SizeConfig.blockSizeHorizontal * 90,
                              right: -SizeConfig.blockSizeHorizontal * 93,
                              top: -SizeConfig.blockSizeVertical * .93,
                            ),
                            //  Positioned(child: Arc(),left: 10.0,right: 0.0,bottom: 0.0,top:-10.0),
                            Positioned(
                                child: Consumer<BallsApi>(
                                    builder: (context, ball, child) => RichText(
                                        text: TextSpan(
                                            text: ball
                                                .getBalls()[ball.i]
                                                .properties[loc[0]],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                  text: ball
                                                      .getBalls()[ball.i]
                                                      .values[loc[0]],
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                        textAlign: TextAlign.center)),
                                left: SizeConfig.blockSizeHorizontal * 15.97,
                                top: SizeConfig.blockSizeVertical * 5.70),

                            Positioned(
                              child: Consumer<BallsApi>(
                                  builder: (context, ball, child) => RichText(
                                      text: TextSpan(
                                          text: ball
                                              .getBalls()[ball.i]
                                              .properties[loc[1]],
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: ball
                                                    .getBalls()[ball.i]
                                                    .values[loc[1]],
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 26.0,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ]),
                                      textAlign: TextAlign.center)),
                              left: SizeConfig.blockSizeHorizontal * 38.67,
                              top: SizeConfig.blockSizeVertical * 13.40,
                            ),
                            Positioned(
                                child: Consumer<BallsApi>(
                                    builder: (context, ball, child) => RichText(
                                        text: TextSpan(
                                            text: ball
                                                .getBalls()[ball.i]
                                                .properties[loc[2]],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                  text: ball
                                                      .getBalls()[ball.i]
                                                      .values[loc[2]],
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                        textAlign: TextAlign.center)),
                                left: SizeConfig.blockSizeHorizontal * 76,
                                top: SizeConfig.blockSizeVertical * 24.40)
                          ]),
                          onVerticalDragStart: (DragStartDetails details) {
                            initial = details.globalPosition.dy;
                          },
                          onVerticalDragUpdate: (DragUpdateDetails details) {
                            distance = details.globalPosition.dy - initial;
                          },
                          onVerticalDragEnd: (DragEndDetails details) {
                            initial = 0.0;
                            distance > 0 ? physics.move() : physics.reverse();
                          },
                          onDoubleTap: () =>
                              Navigator.pushNamed(context, UIData.viewRoute),
                        )),
                flex: 1)
          ]),
          bottom: false,
          right: false,
          left: false,
        )
      ]),
      backgroundColor: Colors
          .black12, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
