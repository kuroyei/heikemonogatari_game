import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
      bgImagePath = "assets/bg-result_page-90.png";  
    } else if(correctAnswersRate >= 80) {
      bgImagePath = "assets/bg-result_page-80.png";
    } else if(correctAnswersRate >= 60) {
      bgImagePath = "assets/bg-result_page-60.png";
    } else if(correctAnswersRate >= 30) {
      bgImagePath = "assets/bg-result_page-30.png";
    } else {
      bgImagePath = "assets/bg-result_page-00.png";
    }

    return WillPopScope( 
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          title: const Text("平家物語ゲーム"),
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
                      const Color(0xFFFAFAFA).withOpacity(0.4),
                      BlendMode.dstATop
                    ),
                    // opacity: 0.4,
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
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                              style: const TextStyle(
                                fontSize: 60,
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "/ $questionNumber",
                                style: const TextStyle(
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
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                              style: const TextStyle(
                                fontSize: 60,
                              )
                            ),
                            const Padding(
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