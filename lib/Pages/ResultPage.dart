import 'package:bmi_cal/Constants/bottombuttom.dart';
import 'package:bmi_cal/Constants/constants.dart';
import 'package:bmi_cal/CustomFile/customCard.dart';
import 'package:bmi_cal/Pages/resultConstant.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class Result extends StatefulWidget {
  final String aboveText;
  final String middleText;
  final String bottomText;
  Result(
      {@required this.aboveText,
      @required this.bottomText,
      @required this.middleText});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(7) + 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("BMI  RESULT", style: topBottomFont)),
        backgroundColor: contrastColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Your Result",
                style: TextStyle(fontFamily: "LilitaOne", fontSize: 50),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: inactiveColor,
              customWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.aboveText ?? "xyz",
                    style: topFont,
                  ),
                  Text(
                    widget.middleText ?? "xyz",
                    style: middleFont,
                  ),
                  Image.asset("assets/animalImage/animal$randomNumber.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      widget.bottomText ?? "xyz",
                      style: bottomFont,
                    ),
                  )
                ],
              ),
            ),
          ),
          LastBottomButton(
            lable: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
