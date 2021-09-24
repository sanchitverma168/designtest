import 'package:designtest/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(this.text, {this.wvalue = 0.95, Key? key}) : super(key: key);
  String text;
  double wvalue;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * wvalue,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
