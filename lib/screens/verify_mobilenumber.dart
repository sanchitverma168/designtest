import 'package:designtest/screens/profile_selection.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:flutter/material.dart';

class VerifyMobileNumber extends StatefulWidget {
  const VerifyMobileNumber({Key? key}) : super(key: key);

  @override
  _VerifyMobileNumberState createState() => _VerifyMobileNumberState();
}

class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Verify Phone"),
            const Text("Code is sent to 1234567890"),
            TextFormField(keyboardType: TextInputType.number),
            const Text("Didn't Recieve the code? Request Again"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectProfile()));
              },
              child: CustomButton("VERIFY AND CONTINUE"),
            )
          ],
        ),
      ),
    );
  }
}
