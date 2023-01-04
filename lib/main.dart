import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heikemonogatari_game/view/game_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "平家物語ゲーム",
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.zenKurenaidoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const GameApp()
    );
  }
}