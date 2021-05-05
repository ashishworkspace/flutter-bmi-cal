import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget customWidget;
  final Function customFunc;
  CustomCard({@required this.color, this.customWidget, this.customFunc});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: customFunc,
            child: Container(margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: customWidget,
      ),
    );
  }
}
