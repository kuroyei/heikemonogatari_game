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
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "正答数",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$result",
                          style: TextStyle(
                            fontSize: 60,
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "/ $questionNumber",
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ),
                      ]
                    )
                  ],
                ),
              ),
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