import 'package:bmi_cal/Constants/constants.dart';
import 'package:flutter/material.dart';

class LastBottomButton extends StatelessWidget {
    final Function onTap;
    final String lable;
    LastBottomButton({this.lable, this.onTap});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottombuttonHeight,
        color: contrastColor,
        child: Center(
          child: Text(lable, style: topBottomFont),
        ),
      ),
    );
  }
}
