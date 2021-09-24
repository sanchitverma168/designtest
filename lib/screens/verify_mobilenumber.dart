import 'package:designtest/constant/colors.dart';
import 'package:designtest/screens/profile_selection.dart';
import 'package:designtest/widgets/button_text.dart';
import 'package:designtest/widgets/otp_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyMobileNumber extends StatefulWidget {
  VerifyMobileNumber(this.country, String this.phone, {Key? key})
      : super(key: key);
  String? phone, country;
  @override
  _VerifyMobileNumberState createState() => _VerifyMobileNumberState();
}

class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  void initState() {
    super.initState();
    // _verifyPhone();
  }

  _verifyPhone() async {
    String num = widget.country.toString() + widget.phone.toString();
    print(num);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: num,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("before  vphone");

          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectProfile()),
                  (route) => false);
            }
            {
              print("else  vphone");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("failed");

          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          print("code sent");
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("timeout");
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  String pin = "";
  List otpindex = [0, 0, 0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Verify Phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 10),
            Text("Code is sent to " + widget.phone!.toString(),
                style: const TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // OTPTextField(true),
                  // OTPTextField(true),
                  // OTPTextField(true),
                  // OTPTextField(true),
                  // OTPTextField(true),
                  // OTPTextField(true),
                  otptext(true, 0),
                  otptext(true, 1),
                  otptext(true, 2),
                  otptext(true, 3),
                  otptext(true, 4),
                  otptext(true, 5),
                ],
              ),
            ),
            // await pinputmethod(context),
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
              onTap: () async {
                bool flag = false;
                otpindex.forEach((element) {
                  if (element == 0) {
                    flag = true;
                  }
                });
                if (flag) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('OTP Not Given.'),
                  ));
                }
                print(pin);
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode!, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectProfile()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  print(e.toString());
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('invalid OTP')));
                }
                // try {
                //   await FirebaseAuth.instance
                //       .signInWithCredential(PhoneAuthProvider.credential(
                //           verificationId: _verificationCode!, smsCode: pin))
                //       .then((value) async {
                //     if (value.user != null) {
                //       Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const SelectProfile()),
                //           (route) => false);
                //     }
                //   });
                // } catch (e) {
                //   FocusScope.of(context).unfocus();
                //   _scaffoldkey.currentState!.showSnackBar(
                //       const SnackBar(content: Text('invalid OTP')));
                // }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SelectProfile()));
              },
              child: CustomButton("VERIFY AND CONTINUE"),
            ),
            // _getOtpKeyboard
          ],
        ),
      ),
    );
  }

  Widget otptext(bool autoFocus, int i) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextFormField(
          // maxLength: 1,
          validator: (value) {
            if (value!.isEmpty) {
              return "Invalid";
            } else {
              return value;
            }
          },
          autofocus: autoFocus,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              otpindex[i] = 1;
              pin += value;
              FocusScope.of(context).nextFocus();
            } else {
              otpindex[i] = 0;
            }
            // checkandclearpin();
          },
        ),
      ),
    );
  }

  checkandclearpin() {
    bool flag = false;
    otpindex.forEach((element) {
      if (element == 0) {
        flag = true;
      }
    });
    if (flag) {
      pin = "";
    }
  }

  Future<PinPut> pinputmethod(BuildContext context) async {
    return PinPut(
      fieldsCount: 6,
      textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
      eachFieldWidth: 40.0,
      eachFieldHeight: 55.0,
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.fade,
      onSubmit: (pin) async {
        try {
          await FirebaseAuth.instance
              .signInWithCredential(PhoneAuthProvider.credential(
                  verificationId: _verificationCode!, smsCode: pin))
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectProfile()),
                  (route) => false);
            }
          });
        } catch (e) {
          print(e.toString());
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('invalid OTP')));
        }
      },
    );
  }
}
