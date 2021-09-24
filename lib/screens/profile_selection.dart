import 'package:designtest/widgets/button_text.dart';
import 'package:flutter/material.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  _SelectProfileState createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Please select your profile"),
            GestureDetector(
              child: CustomButton("CONTINUE"),
            )
          ],
        ),
      ),
    );
  }
}
