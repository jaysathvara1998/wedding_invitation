import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const HeaderText(
      {super.key,
      required this.text,
      this.fontSize = 30,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.amaticSc(
        textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const SubTitleText(
      {super.key,
        required this.text,
        this.fontSize = 24,
      this.fontColor = Colors.black,
      this.fontWeight = FontWeight.w300});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        letterSpacing: .5,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Hannah'
      ),
    );
  }
}

