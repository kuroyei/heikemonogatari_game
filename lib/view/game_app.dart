import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heikemonogatari_game/view/game_page.dart';
import 'package:url_launcher/url_launcher.dart';

class GameApp extends StatelessWidget {
  GameApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("平家物語ゲーム"),
      ),
      body: Column(
        children: [
          Expanded(
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
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: GestureDetector(
              onTap: () {
                launchUrl(Uri.parse("https://github.com/kuroyei/heikemonogatari_game"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.github),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: const Text("ぎっとはぶ")
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}