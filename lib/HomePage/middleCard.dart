import 'package:bmi_cal/Constants/constants.dart';
import 'package:bmi_cal/CustomFile/customCard.dart';
import 'package:bmi_cal/HomePage/bmi_home_page.dart';
import 'package:flutter/material.dart';

class MiddleCardInside extends StatefulWidget {
  @override
  _MiddleCardInsideState createState() => _MiddleCardInsideState();
}

class _MiddleCardInsideState extends State<MiddleCardInside> {
  @override
  Widget build(BuildContext context) {
    return                 Expanded(
                    child: CustomCard(
                  color: inactiveColor,
                  customWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: homePageMiddleBottomText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "  ${height.toString()}",
                            style: bigHomePageText,
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                                fontSize: 25, fontFamily: "LilitaOne"),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: contrastColor,
                              overlayColor: Color(0x1547855B),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 14.0)),
                          child: Slider(
                            onChanged: (double value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                            value: height.toDouble(),
                            min: 150,
                            max: 220,
                            inactiveColor: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
  ));
  }
}