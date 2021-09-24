import 'package:country_code_picker/country_code_picker.dart';
import 'package:designtest/screens/verify_mobilenumber.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EnterMobileNumber extends StatefulWidget {
  const EnterMobileNumber({Key? key}) : super(key: key);

  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Please enter your mobile Number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const Text(
            "You'll recieve a 4 digit code to verify next.",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'IN',
                    favorite: const ['+91', 'IN'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
              
               
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Mobile Number"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyMobileNumber()));
              },
              child: CustomButton("CONTINUE"))
        ],
      ),
    ));
  }
}