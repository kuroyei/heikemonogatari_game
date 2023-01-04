import 'package:flutter/material.dart';
import 'package:heikemonogatari_game/view/game_page.dart';

class GameApp extends StatelessWidget {
  GameApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("平家物語ゲーム"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => GamePage())
                );
              },
              child: const Text("すたーと！"),
            ), 
          ],
        )
      )
    );
  }
}