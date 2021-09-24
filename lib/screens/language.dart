import 'package:designtest/screens/enter_mobilenumber.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: content()),
          aquaPath(),
          overLapPath(),
        ],
      ),
    );
  }

  Widget content() {
    const double size = 20;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.image,
          size: size * 3.2,
        ),
        const SizedBox(height: 40),
        const Text("Please select your Language",
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 10),
        Container(
            // color: Colors.orange,
            width: MediaQuery.of(context).size.width * 0.45,
            child: const Text("You can change the language at any time",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size * 0.7,
                ))),
        const SizedBox(height: 20),
        dropdown(),
        const SizedBox(height: 20),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterMobileNumber()));
            },
            child: CustomButton(
              "NEXT",
              wvalue: 0.6,
            )),
      ],
    );
  }

  Widget dropdown() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LanguagePickerDropdown(onValuePicked: (Language language) {}),
        ));
  }

  Widget aquaPath() {
    return const ClipPath();
  }

  Widget overLapPath() {
    return const ClipPath();
  }
}
