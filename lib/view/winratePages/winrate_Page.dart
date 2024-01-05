import 'package:flutter/material.dart';
import 'package:mobilelegendguide/static_data.dart';

class WinratePage extends StatefulWidget {
  const WinratePage({super.key});

  @override
  State<WinratePage> createState() => _WinratePageState();
}

class _WinratePageState extends State<WinratePage> {
  final Color cardsColor = Colors.blue;

  TextEditingController totalMatchesController = TextEditingController();
  TextEditingController currentWinRateController = TextEditingController();
  TextEditingController desiredWinRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //this variable

    return Scaffold(
      backgroundColor: StaticData.backgroundColor,
      appBar: AppBar(
        title: const Text("Win Rate Calculator"),
      ),
      body: ListView(children: [
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Padding(
              padding: StaticData.cardsPadding,
              child: Column(
                children: [
                  TextFormField(
                    controller: totalMatchesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Total Matches",
                      hintText: "Enter your total matches",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    controller: currentWinRateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Current Win Rate",
                      hintText: "Enter your current win rate",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Current Win Matches : ${calculateCurrentWinMathces()}",
                        ),
                        Text(
                          "Current Lose Matches : ${calculateCurrentLoseMatches()}",
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: desiredWinRateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Desired Win Rate",
                      hintText: "Enter your desired win rate",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              )),
        ),

        // stats
        Card(
          color: StaticData.cardColor,
          margin: StaticData.cardsMargin,
          child: Padding(
            padding: StaticData.cardsPadding,
            child: Text(
              "You need to win ${calculateWinRate().toString()} matches to get ${desiredWinRateController.text} win rate",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  int calculateCurrentWinMathces() {
    double totalMatches = double.parse(totalMatchesController.text);
    double currentWinRate = double.parse(currentWinRateController.text);

    var mWin = (totalMatches * currentWinRate) / 100;
    return mWin.ceil();
  }

  int calculateCurrentLoseMatches() {
    double totalMatches = double.parse(totalMatchesController.text);
    double currentWinRate = double.parse(currentWinRateController.text);

    var mWin = (totalMatches * currentWinRate) / 100;
    var mLose = totalMatches - mWin;
    return mLose.ceil();
  }

  int calculateWinRate() {
    double totalMatches = double.parse(totalMatchesController.text);
    double currentWinRate = double.parse(currentWinRateController.text);
    double desiredWinRate = double.parse(desiredWinRateController.text);

    var mWin = (totalMatches * currentWinRate) / 100;
    var mLose = totalMatches - mWin;
    var sWr = 100 - desiredWinRate;
    var wrResult = 100 / sWr;
    var sPersen = mLose * wrResult;
    double hasil = sPersen - mWin;
    return hasil.ceil();
  }
}
