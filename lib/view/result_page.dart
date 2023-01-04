import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.result, this.questionNumber, {Key? key}) : super(key: key);
  int result;
  int questionNumber;

  Future<void> goToTop(BuildContext context) async {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( 
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          title: Text("平家物語ゲーム"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("正答数 $result / $questionNumber"),
              ElevatedButton(
                onPressed: () async {
                  await goToTop(context);
                },
                child: const Text('トップへ'),
              )
            ],
          )
        )
      )
    );

  }
}