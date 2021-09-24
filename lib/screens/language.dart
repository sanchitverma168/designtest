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
          Align(alignment: Alignment.bottomCenter, child: overLapPath()),
          Align(alignment: Alignment.bottomCenter, child: aquaPath()),
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
            decoration: const BoxDecoration(),
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
          child: LanguagePickerDropdown(
              initialValue: Language("en", "English"),
              onValuePicked: (Language language) {}),
        ));
  }

  Widget aquaPath() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(46, 59, 98, 0.5),
          )),
    );
  }

  Widget overLapPath() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ClipPath(
          clipper: OverLapBackgroundClipper(),
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(147, 210, 243, 1),
          )),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
   
    Path p = Path();
    p.moveTo(0, size.height * 0.3);
    var fEndPoint = Offset(size.width * 0.4, size.height * 0.3);
    var fControlPoint = Offset(size.width * 0.2, size.height * 0.6);
    p.quadraticBezierTo(
        fControlPoint.dx, fControlPoint.dy, fEndPoint.dx, fEndPoint.dy);

    var sEndPoint = Offset(size.width * 0.8, size.height * 0.3);
    var sControlPoint = Offset(size.width * 0.6, 0);
    p.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

    var tEndPoint = Offset(size.width, size.height * 0.38);
    var tControlPoint = Offset(size.width * 0.9, size.height * 0.42);
    p.quadraticBezierTo(
        tControlPoint.dx, tControlPoint.dy, tEndPoint.dx, tEndPoint.dy);

    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class OverLapBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p =  Path();
     p.moveTo(0, size.height * 0.3);
    var fEndPoint = Offset(size.width * 0.5, size.height * 0.5);
    var fControlPoint = Offset(size.width * 0.27, size.height*0.13);
    p.quadraticBezierTo(
        fControlPoint.dx, fControlPoint.dy, fEndPoint.dx, fEndPoint.dy);

    var sEndPoint = Offset(size.width , size.height * 0.3);
    var sControlPoint = Offset(size.width * 0.7, size.height *0.8 );
    p.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

    var tEndPoint = Offset(size.width, size.height * 0.38);
    var tControlPoint = Offset(size.width * 0.9, size.height * 0.1);
    // p.quadraticBezierTo(
    //     tControlPoint.dx, tControlPoint.dy, tEndPoint.dx, tEndPoint.dy);
    // p.lineTo(size.width, size.height*0.3);
    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
