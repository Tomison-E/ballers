import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:ballers/models/shuffle.dart';
import 'package:flutter/material.dart';
import 'package:ballers/utils/sizeConfig.dart';
import 'dart:math' as math;

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Shuffle()),
      ],
      child: MaterialApp(
        home: Arc(),
      ),
    ));

class Arc extends StatefulWidget {
  @override
  _ArcState createState() => new _ArcState();
}

class _ArcState extends State<Arc> {
  void initState() {
    super.initState();
    // init();
  }

  @override
  Widget build(BuildContext context) {
    var repaints = Provider.of<Shuffle>(context, listen: false);
    var index = repaints.index;
    var loc = repaints.loc;
    return CustomPaint(
      foregroundPainter: new PathPainter(index: index, loc: loc),
      child: Image.asset("images/Kaka Star.png"),
    );
  }
}

class PathPainter extends CustomPainter {
  final index;
  final loc;

  PathPainter({this.index, this.loc, this.image});

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    double blockSizeHorizontal = size.width / 100;
    double blockSizeVertical = size.height / 100;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    /* final paints = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;*/

    final paintp = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final painted = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    /*  final painter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;*/

    num degToRad(num deg) => deg * (math.pi / 180.0);
    //var offsetList = [Offset(-69.0, 150.0), Offset(-74.0, 350.0),Offset(-61.0, 510.0),Offset(-63.0, 560.0)];
    //   var offsetList = [Offset(-blockSizeHorizontal*18.35, blockSizeVertical*34.80), Offset(-blockSizeHorizontal*19.68, blockSizeVertical*81.21),Offset(-blockSizeHorizontal*16.22, blockSizeVertical*118.33),Offset(-blockSizeHorizontal*16.76, blockSizeVertical*129.93)];
    var offsetList = [
      Offset(-blockSizeHorizontal * 57.95, blockSizeVertical * 32.80),
      Offset(-blockSizeHorizontal * 59.58, blockSizeVertical * 47.21),
      Offset(-blockSizeHorizontal * 59.2, blockSizeVertical * 60.33),
      Offset(-blockSizeHorizontal * 16.76, blockSizeVertical * 129.93)
    ];
    var rad = [3.0, 3.0, 3.0, 3.0];

    canvas.rotate(-.99);
    //canvas.drawArc(rect, degToRad(0),degToRad(270), useCenter, paint);
    //  canvas.drawLine(Offset(90.0, 10.0), Offset(90.0, 80.0), paint);
    //canvas.drawOval(Rect.fromPoints(Offset(50.0, 350), Offset(170, 500)), paint);
    //canvas.drawOval(Rect.fromCenter(center:Offset(0.0, 300),width: 10.0,height: 370.0), paint);
    var path = Path();
    /*  if(j>3){
      j=0;
    }*/

    //path.moveTo(30.0, 0.0);
    // path.lineTo(-10.0, -100.0);
    //path.lineTo(-10.0, 500.0);
    // path.lineTo(size.width+100.0, 0.0);
    // path.arcToPoint(Offset(150.0,250.0));
    //path.addArc(Rect.fromCenter(center:Offset(-50.0, 300),width: 50.0,height:470.0), degToRad(300.0), degToRad(-210.0));

    canvas.drawCircle(offsetList[loc[0]], rad[loc[0]], paintp);
    canvas.drawCircle(offsetList[loc[1]], rad[loc[1]], paintp);
    canvas.drawCircle(offsetList[loc[2]], rad[loc[2]], paintp);
    //canvas.drawCircle(offsetList[loc[3]], rad[loc[3]], paints);
    /*index>0? _timer = new Timer(Duration(milliseconds: 300),() {
      canvas.drawCircle(Offset(faction[loc[0]], fraction[loc[0]]), rad[loc[0]], painter);
    }):canvas.drawCircle(Offset(faction[loc[0]], fraction[loc[0]]), rad[loc[0]], painter);
   canvas.drawCircle(Offset(faction[loc[1]], fraction[loc[1]]), rad[loc[1]], painter);
    index>0?  _timer = new Timer(Duration(milliseconds: 100),() {
      canvas.drawCircle(Offset(faction[loc[2]], fraction[loc[2]]), rad[loc[2]], painter);
    }): canvas.drawCircle(Offset(faction[loc[2]], fraction[loc[2]]), rad[loc[2]], painter);*/
    //canvas.drawPoints(PointMode.points, offsetList, paints);
    // path.addArc(Rect.fromPoints(Offset(50.0, 350), Offset(170, 500)), degToRad(300.0), degToRad(-90.0));
    // canvas.drawCircle(Offset(90.0, 350.0), 6.0, paint);
    //  path.close();
    print(size.width);
    print(SizeConfig.blockSizeVertical);
    /*
    index==1?canvas.drawCircle(Offset(-74.5, 340.0), 6.0, paints):canvas.drawCircle(offsetList[index], rad[index], paints);
   index==1? canvas.drawCircle(Offset(-67.0, 480.0), 3.0, painter):canvas.drawCircle(offsetList[index+1], 6.0, painter);
   index==1?canvas.drawCircle(offsetList[index+2], 3.0, paints):canvas.drawCircle(offsetList[index+2], rad[index+2], paints);
   index==1? canvas.drawCircle(Offset(-69.0, 160.0), 3.0, paints):canvas.drawCircle(offsetList[j], rad[j], paints);
     */
    //path.addArc(Rect.fromCenter(center:Offset(-SizeConfig.blockSizeHorizontal*13.33, SizeConfig.blockSizeVertical*36.95),width: 50.0,height:SizeConfig.blockSizeVertical*57.88), degToRad(300.0), degToRad(-210.0));
    //
    //path.addArc(Rect.fromCenter(center:Offset(-SizeConfig.blockSizeHorizontal*13.33, SizeConfig.blockSizeVertical*36.95),width: 50.0,height:SizeConfig.blockSizeVertical*62.88), degToRad(300.0), degToRad(-210.0));
    path.addArc(
        Rect.fromCenter(center: Offset(-200, 400), width: 50.0, height: 370),
        degToRad(300.0),
        degToRad(-210.0));
    canvas.drawPath(path, paint);

    //index==1?canvas.drawCircle(Offset(-74.5, 340.0), 6.0, paints):print("no");
    // index==1?canvas.drawCircle(offsetList[3], 2.0, paints):print("no");
    //index==1?canvas.drawCircle(offsetList[2], 4.0, paints):print("no");
    // index==1?canvas.drawCircle(offsetList[0], 4.0, paints):print("no");

// close the path to form a bounded shape
    canvas.drawCircle(offsetList[1], 7.0, painted);

    // canvas.drawOval(Rect.fromCircle(center:Offset(0.0, 550),radius: 10.0 ), paint);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) {
    return index != oldDelegate.index;
  }
}
