import 'dart:async';

import 'package:designtest/constant/colors.dart';
import 'package:designtest/screens/profile_selection.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:designtest/widgets/otp_textField.dart';
import 'package:flutter/cupertino.dart';
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Verify Phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 10),
            const Text("Code is sent to 1234567890",
                style: TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OTPTextField(true),
                OTPTextField(true),
                OTPTextField(true),
                OTPTextField(true),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Didn't Recieve the code?  "),
                GestureDetector(
                  child: const Text("Request Again",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      )),
                )
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectProfile()));
              },
              child: CustomButton("VERIFY AND CONTINUE"),
            ),
            // _getOtpKeyboard
          ],
        ),
      ),
    );
  }
}
