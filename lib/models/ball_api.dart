import 'package:ballers/models/ball_Models.dart';
import 'package:flutter/material.dart';

final ball = [
  Ball(name: "Top Star",description: "The football made its first debut in the france vs germany opening match, there seems to be more ...",
      date: "08 June 58",
      state: "Slonias",
      about: "Debut",
      awayTeam: "Mexico",
      awayTeamScore: 4,
      country: "Sweden",
      homeTeam: "Sweden",
      homeTeamScore: 0,
      time: "7 pm",
      details: "The football made its first debut in the france vs germany opening match, there seems to be more The football made its first debut in the france vs germany opening match, there seems to be more The football made its first ",
      properties: ['    weight \n\n', 'panel \n\n', 'properties \n\n'],
      values: ['  221 g', '18 panels', 'Waterproof']),
  Ball(name: "Trip Star",description: "Destiny lies ahead football made its first debut in the france vs germany opening match, there seems to be more ...",
      date: "08 June 58",
      state: "Slonia",
      about: "Final",
      awayTeam: "Mexico",
      awayTeamScore: 4,
      country: "Brazil",
      homeTeam: "Sweden",
      homeTeamScore: 0,
      time: "8 pm",
      details: "The football made its first debut in the france vs germany opening match, there seems to be more The football made its first debut in the france vs germany opening match, there seems to be more The football made its first  ",
      properties: ['    weight \n\n', 'panel \n\n', 'properties \n\n'],
      values: ['  221 g', '18 panels', 'Waterproof']),
  Ball(name: "Kaka Star",description: "Football made its first debut in the france vs germany opening match, there seems to be more ...",
      date: "08 June 58",
      state: "Lagos",
      about: "Friendly",
      awayTeam: "Mexico",
      awayTeamScore: 4,
      country: "Nigeria",
      homeTeam: "Sweden",
      homeTeamScore: 0,
      time: "9 pm",
      details: "The football made its first debut in the france vs germany opening match, there seems to be more The football made its first debut in the france vs germany opening match, there seems to be more The football made its first ",
      properties: ['    weight \n\n', 'panel \n\n', 'properties \n\n'],
      values: ['  221 g', '18 panels', 'Waterproof']),
];


class BallsApi with ChangeNotifier {
  List<Ball> balls = ball;
  int i = 2;

  getBalls() => balls;

  //setCounter(int counter) => _counter = counter;

  void increment() {
    i < 2 ? i++ : i = 2;
    notifyListeners();
  }

  void decrement() {
    i > 0 ? i-- : i = 0;
    notifyListeners();
  }
}