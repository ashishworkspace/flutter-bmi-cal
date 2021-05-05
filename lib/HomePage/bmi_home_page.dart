import 'package:bmi_cal/BmiCalculatorLogic/logic.dart';
import 'package:bmi_cal/Constants/bottombuttom.dart';
import 'package:bmi_cal/Constants/constants.dart';
import 'package:bmi_cal/CustomFile/customBottomButton.dart';
import 'package:bmi_cal/CustomFile/customIcon.dart';
import 'package:bmi_cal/HomePage/middleCard.dart';
import 'package:bmi_cal/Pages/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_cal/CustomFile/customCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

Color maleCardColor = inactiveColor;
Color femaleCardColor = inactiveColor;
int height = 180;
int weight = 70;
int userInut;
double feet = 0;
int valueInCm = 0;

class BmiHomePage extends StatefulWidget {
  @override
  _BmiHomePageState createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  void getGender(Gender gender) {
    setState(() {
      maleCardColor = Gender.male == gender ? activeColor : inactiveColor;
      femaleCardColor = Gender.female == gender ? activeColor : inactiveColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: contrastColor,
          title: Center(
              child: Text(
            "BMI  CALCULATOR",
            style: topBottomFont,
          )),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                  customFunc: () {
                    getGender(Gender.male);
                  },
                  color: maleCardColor,
                  customWidget: CustomIcon(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                )),
                Expanded(
                    child: CustomCard(
                  customFunc: () {
                    getGender(Gender.female);
                  },
                  color: femaleCardColor,
                  customWidget: CustomIcon(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [MiddleCardInside()],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: CustomCard(
                      customWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: homePageMiddleBottomText),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: bottomText,
                              ),
                              Text(
                                "kg",
                                style: baseLineText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BottomButton(
                                icon: Icons.add,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              BottomButton(
                                icon: Icons.remove,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      color: inactiveColor,
                    )),
                Expanded(
                    flex: 5,
                    child: CustomCard(
                      customWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("CONVERTER", style: homePageMiddleBottomText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                margin: EdgeInsets.all(10),
                                width: 85,
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'LilitaOne',
                                      fontSize: 20),
                                  cursorColor: Colors.blueGrey,
                                  cursorHeight: 30,
                                  cursorWidth: 3,
                                  onChanged: (value) {
                                    try {
                                      feet = double.parse(value);
                                    } catch (error) {
                                      print(error);
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffix: Text("ft", style: fbutton),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: FloatingActionButton(
                                      backgroundColor: contrastColor,
                                      onPressed: () {
                                        setState(() {
                                          double tmp;
                                          tmp = feet * 30.48;
                                          valueInCm = tmp.floor() ?? 0;
                                        });
                                      },
                                      child: Icon(Icons.check_outlined,
                                          size: 25, color: Colors.grey[300])))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                valueInCm.toString(),
                                style: bottomText,
                              ),
                              Text("cm", style: baseLineText)
                            ],
                          )
                        ],
                      ),
                      color: inactiveColor,
                    )),
              ],
            ),
          ),
          LastBottomButton(
            lable: "CALCULATE",
            onTap: () {
              BmiLogic logic = BmiLogic(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Result(middleText: logic.calculateBmi(),bottomText: logic.comment(),aboveText: logic.outCome(),);
              }));
            },
          )
        ]),
      ),
    );
  }
}
