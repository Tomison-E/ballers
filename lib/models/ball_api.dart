import 'package:ballers/models/ball_Models.dart';
import 'package:flutter/material.dart';

final ball = [
  Ball(name: "Baden QB",
      description: "The QB Composite Football is an ideal everyday recreational football, great for tossing in the backyard or for football ...",
      date: "08 June 1996",
      state: "Malmo",
      about: "Final",
      awayTeam: "Germany",
      awayTeamScore: 40,
      country: "Sweden",
      homeTeam: "France",
      homeTeamScore: 32,
      time: "8 pm",
      details: "The QB Composite Football is an ideal everyday recreational football, great for tossing in the backyard or for football camps. It's cushioned composite cover provides a soft and tacky feel that's great right off the shelf.   ",
      properties: ['    weight \n\n', '  panel \n\n', '  properties \n\n'],
      values: ['  10 ounces', '   17 panels', '  Leather']),
  Ball(name: "Wilson Evolution",
      description: "The indoor ball is famous for it's cushion core carcass, making the ball softer to touch and easier to grip, the ball ... ",
      date: "08 June 58",
      state: "ohio",
      about: "Friendly",
      awayTeam: "canada",
      awayTeamScore: 90,
      country: "usa",
      homeTeam: "usa",
      homeTeamScore: 120,
      time: "9 pm",
      details: "The indoor ball is famous for it's cushion core carcass, making the ball softer to touch and easier to grip, the ball is approved for play by the National Federation of State High School Association (NFHS) ",
      properties: ['weight \n\n', '      size \n\n', 'properties \n\n'],
      values: ['1.45 Pounds  ', '    29.5', ' 7-9 PSI']),
  Ball(name: "LFC Retro Ball",
      description: "The football made its first debut in the liverpool vs everton opening match on 1958, there seems to be more ...",
      date: "08 June 58",
      state: "London",
      about: "Debut",
      awayTeam: "Everton",
      awayTeamScore: 2,
      country: "England",
      homeTeam: "Liverpool",
      homeTeamScore: 3,
      time: "7 pm",
      details: "The football made its first debut in the liverpool vs everton opening match on 1958, there seems to be more about this match as it signifies these two teams at their local state, a grudge derby match on who rules merseyside ",
      properties: ['    weight \n\n', 'panel \n\n', 'properties \n\n'],
      values: ['  221 g', '18 panels', 'Waterproof']),
];


class BallsApi with ChangeNotifier {
  List<Ball> balls = ball;
  int i = 2;
  int counter = 0;

  getBalls() => balls;

  //setCounter(int counter) => _counter = counter;

  void increment() {
    i++;
    notifyListeners();
  }

  void decrement() {
    i--;
    notifyListeners();
  }
}