import 'package:calculator_app/widgets/calc_widget.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int? firstNum;
  int? secondNum;
  String? history;
  String textToDisplay = "";
  String res = "";
  String? operation;

  void btnOnClick(String btnValue) {
    print(btnValue);
    if (btnValue == "C") {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = "";
      res = "";
    } else if (btnValue == "AC") {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = "";
      res = "";
      history = "";
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "X" ||
        btnValue == "/") {
      firstNum = int.parse(textToDisplay!);
      res = "";
      operation = btnValue;
    } else if (btnValue == "=") {
      secondNum = int.parse(textToDisplay!);
      if (operation == "+") {
        res = (firstNum! + secondNum!).toString();
        history = firstNum.toString() + operation! + secondNum.toString();
      } else if (operation == "-") {
        res = (firstNum! - secondNum!).toString();
        history = firstNum.toString() + operation! + secondNum.toString();
      } else if (operation == "X") {
        res = (firstNum! * secondNum!).toString();
        history = firstNum.toString() + operation! + secondNum.toString();
      } else if (operation == "/") {
        res = (firstNum! / secondNum!).toString();
        history = firstNum.toString() + operation! + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay! + btnValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                history ?? '',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                textToDisplay ?? '',
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              children: [
                CalcWidget(
                  text: 'AC',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: 'C',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '<',
                  textSize: 20,
                  fillColor: Colors.orangeAccent,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '/',
                  fillColor: Colors.orangeAccent,
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              children: [
                CalcWidget(
                  text: '9',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '8',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '7',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: 'X',
                  fillColor: Colors.orangeAccent,
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              children: [
                CalcWidget(
                  text: '6',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '5',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '4',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '-',
                  fillColor: Colors.orangeAccent,
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              children: [
                CalcWidget(
                  text: '3',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '2',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '1',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '+',
                  fillColor: Colors.orangeAccent,
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              children: [
                CalcWidget(
                  text: '+/-',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '0',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '00',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalcWidget(
                  text: '=',
                  fillColor: Colors.orangeAccent,
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
