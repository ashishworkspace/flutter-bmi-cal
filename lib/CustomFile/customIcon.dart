import 'package:bmi_cal/Constants/constants.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  CustomIcon({@required this.icon, @required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80 ,color: Color(0xCBFFFFFF,))
        ,SizedBox(height: 20,),
        Text(label,style: homePageText ,)
      ],
    );
  }
}
