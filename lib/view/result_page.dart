import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.result, this.questionNumber, this.time, {Key? key}) : super(key: key);
  int result;
  int questionNumber;
  Stopwatch time;



  Future<void> goToTop(BuildContext context) async {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswersRate = (result / questionNumber) *100 ~/ 1;
    String bgImagePath;
    if(correctAnswersRate >= 90) {
      bgImagePath = "bg-result_page-90.png";  
    } else if(correctAnswersRate >= 80) {
      bgImagePath = "bg-result_page-80.png";
    } else if(correctAnswersRate >= 60) {
      bgImagePath = "bg-result_page-60.png";
    } else if(correctAnswersRate >= 30) {
      bgImagePath = "bg-result_page-30.png";
    } else {
      bgImagePath = "bg-result_page-00.png";
    }
    print("$result, $questionNumber, $correctAnswersRate");

    return WillPopScope( 
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          title: Text("平家物語ゲーム"),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Color(0xFFFAFAFA).withOpacity(0.4),
                      BlendMode.dstATop
                    ),
                    image: AssetImage(bgImagePath),
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.contain,
                  )
                ),
              )
            ),
            Center(
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "タイム",
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
                              "${time.elapsedMilliseconds ~/ 1000}",
                              style: TextStyle(
                                fontSize: 60,
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "秒",
                                style: TextStyle(
                                  fontSize: 20,
                                )
                              )
                            )
                          ],
                        )
                      ],
                    )
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
          ],
        )
      )
    );

  }
}