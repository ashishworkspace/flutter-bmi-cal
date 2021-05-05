import 'package:bmi_cal/HomePage/bmi_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  theme: ThemeData.dark().copyWith(
scaffoldBackgroundColor: Color((0xFF2C332E)),
  ),home: BmiHomePage(),),);
}
