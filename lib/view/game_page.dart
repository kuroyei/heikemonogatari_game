import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:heikemonogatari_game/model/question.dart';
import 'package:heikemonogatari_game/questionItem/questionItem.dart';
import 'package:heikemonogatari_game/view/result_page.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);


  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int index = 0;
  int result = 0;
  bool isSelectNow = true;
  late String answered;
  
  List<Question> questions = questionItem.entries.map((e) => e.value).toList();
  late List<String> choices;
  late AudioPlayer audioPlayer = AudioPlayer()..setAsset("assets/${questions[index].audioFilePath}");

  @override
  void initState() {
    for(int i=0; i<questions.length; i++){
      questions[i].choices.shuffle();
    }
    super.initState();
  }

  Future<void> updateQuestion(BuildContext context, String selectAnswer) async {
    setState(() {
      isSelectNow = false;
    });
    if(questions[index].answer == selectAnswer){
      
      result++;
    }

    await Future.delayed(audioPlayer.duration ?? Duration(seconds: 0));
    isSelectNow = true;
    setState(() {});
    index++;
    if(index == questions.length){
      await goToResult(context);
    }
    setState(() {});
  }

  Future<void> goToResult(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(result, questions.length)
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    choices = questions[index].choices;
    // choices.shuffle();
    audioPlayer = AudioPlayer()..setAsset("assets/${questions[index].audioFilePath}");
    return Scaffold(
      appBar: AppBar(
        title: Text("平家物語ゲーム"),
      ),
      body: Container(
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.all(5),
            itemBuilder: (BuildContext context, int _index) {
              return Card(
                child: ListTile(
                  title: Text(choices[_index]),
                  onTap: () {
                    audioPlayer.play();
                    if (!isSelectNow) return;
                    answered = choices[_index];
                    updateQuestion(context, choices[_index]);
                  },
                  tileColor: isSelectNow 
                    ? null 
                    : (choices[_index] == answered)
                        ? (questions[index].answer == choices[_index]) 
                            ? Colors.blue 
                            : Colors.red
                        : null
                    
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 0.1);
            },
            itemCount: choices.length,
          )
        ),
      )
    );
  }
}