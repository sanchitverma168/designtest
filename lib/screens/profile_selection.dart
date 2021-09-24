import 'package:designtest/constant/styles.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  _SelectProfileState createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  Object? gv = 0;
  Object v1 = 1, v2 = 2;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Please select your profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
            const SizedBox(height: 20),
            _customradio(v1, Icons.home, "Shipper", data["0"]["desc"]),
            const SizedBox(height: 20),
            _customradio(
                v2, Icons.car_rental, "Transporter", data["0"]["desc"]),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (!value) {
                      value = true;
                    }
                  });
                },
                child: CustomButton("CONTINUE")),
            const SizedBox(height: 20),
            Visibility(
                visible: value,
                child: const Text(
                  "Verification Completed",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                )),
          ],
        ),
      ),
    );
  }

  Widget _customradio(Object v, icon, title, desc) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Radio(
                  activeColor: Colors.black,
                  value: v,
                  groupValue: gv,
                  onChanged: (v) {
                    setState(() {
                      gv = v;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                icon,
                size: 60,
              ),
            ),
            Container(
              decoration: const BoxDecoration(),
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 19),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      desc,
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
