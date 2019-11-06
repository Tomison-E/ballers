import 'package:ballers/utils/uiData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ballers/models/shuffle.dart';
import 'package:ballers/models/ball_api.dart';
import 'package:ballers/router/router.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
      _) {
    runApp(
        MultiProvider(
            providers: [
              ChangeNotifierProvider(builder: (_) => Shuffle()),
              ChangeNotifierProvider(builder: (_) => BallsApi())
            ],
            child: MyApp())
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
      onUnknownRoute: Router.unknownRoute,
      initialRoute: UIData.homeRoute,
    );
  }
}


