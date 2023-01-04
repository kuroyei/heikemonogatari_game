import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:heikemonogatari_game/model/question.dart';
import 'package:heikemonogatari_game/questionItem/questionItem.dart';
import 'package:heikemonogatari_game/view/result_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);


  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int index = 0;
  int result = 0;
  bool isSelectNow = true;
  late String answered;

  Stopwatch stopwatch = Stopwatch();
  
  List<Question> questions = questionItem.entries.map((e) => e.value).toList();
  late List<String> choices;
  late AudioPlayer audioPlayer = AudioPlayer()..setAsset("assets/${questions[index].audioFilePath}");

  @override
  void initState() {
    for(int i=0; i<questions.length; i++){
      questions[i].choices.shuffle();
    }
    super.initState();
    stopwatch.start();
  }

  Future<void> updateQuestion(BuildContext context, String selectAnswer) async {
    setState(() {
      isSelectNow = false;
    });
    if(questions[index].answer == selectAnswer){
      
      result++;
    }

    await Future.delayed(audioPlayer.duration ?? const Duration(seconds: 2));
    isSelectNow = true;
    setState(() {});
    index++;
    if(index == questions.length){
      stopwatch.stop();
      // print("${stopwatch.elapsed}");
      // ignore: use_build_context_synchronously
      await goToResult(context);
    }
    setState(() {});
  }

  Future<void> goToResult(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(result, questions.length, stopwatch)
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    choices = questions[index].choices;
    // choices.shuffle();
    audioPlayer = AudioPlayer()..setAsset("assets/${questions[index].audioFilePath}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("平家物語ゲーム"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    child: ListTile(
                      title: Text(choices[i]),
                      onTap: () {
                        audioPlayer.play();
                        if (!isSelectNow) return;
                        answered = choices[i];
                        updateQuestion(context, choices[i]);
                      },
                      tileColor: isSelectNow 
                        ? null 
                        : (choices[i] == answered)
                            ? (questions[index].answer == choices[i]) 
                                ? Colors.blue 
                                : Colors.red
                            : null
                        
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 0.1);
                },
                itemCount: choices.length,
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 30,
                value: index/questionItem.length,
              )
            )
          ),
        ]
      )
    );
  }
}