import 'package:bmi_cal/Constants/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  BottomButton({@required this.icon, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      shape: CircleBorder(),
      fillColor: contrastColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),child: Icon(icon, size: 30,),
    );
  }
}
