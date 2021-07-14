import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palm_hills_club/services/auth_service.dart';
import 'package:palm_hills_club/views/signup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constance.dart';
import 'account.dart';
import 'contact_us.dart';

// ignore: camel_case_types
class confirmAccount extends StatefulWidget {
  final Function showResult;
  final Function changeDisplay;
  final Function setError;
  final Function backToSignIn;
  String phoneNumber;
  TextEditingController membershipNumberController;

  confirmAccount(this.showResult, this.changeDisplay, this.setError,
      this.backToSignIn, this.phoneNumber, this.membershipNumberController);
  @override
  _confirmAccountState createState() => _confirmAccountState();
}

class _confirmAccountState extends State<confirmAccount> {
  // String phoneNumber;
  String signUpError = "";
  TextEditingController confirmationCodeController = TextEditingController();
  AmplifyAuthCognito auth;
  String displayState;
  String authState = 'User not signed in';
  String lastHubEvent = '';
  String currentText = "";
  AmplifyException error;
  @override
  void initState() {
    super.initState();
    print('result phone Passed: ' + widget.phoneNumber.toString());
    print(
        'result phone Passed: ' + widget.membershipNumberController.toString());
  }

  Future<bool> _confirmSignUp() async {
    setState(() {
      signUpError = "";
    });
    print('result phone onPhoneNumberChange: ' + widget.phoneNumber.toString());
    try {
      // SignUpResult res = await Amplify.Auth.confirmSignUp(
      //     username: widget.phoneNumber.trim(),
      //     confirmationCode: confirmationCodeController.text.trim());
      // if (res.isSignUpComplete) {
      await Amplify.Auth.signOut();

      final bool signInRes = await AuthService()
          .loginWithEmailPassword(widget.phoneNumber, 'password');

      print('SignIn result : ' + signInRes.toString());
      await AuthService()
          .saveUser(widget.phoneNumber, widget.membershipNumberController.text);
      Get.to(() => accountSetup(
            phoneNumber: widget.phoneNumber,
          ));

      return signInRes;
      // }
      Navigator.pop(context, true);
    } on AuthException catch (error) {
      print('SignIn result : ' + error.toString());
      AuthService().setError(error);
    }
  }

  void _resendSignUpCode() async {
    try {
      var res = await Amplify.Auth.resendSignUpCode(
        username: widget.phoneNumber,
      );
      widget.showResult(
          'Sign Up Code Resent to ' + res.codeDeliveryDetails.destination);
    } on AmplifyException catch (e) {
      widget.setError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppBackgroundColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Welcome To',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    ),
                    Text(
                      'The Club',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                            ),
                            onPressed: () {
                              // Get.to(
                              //   signUp(),
                              // );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: Text(
                            'Confirm account ',
                            style: GoogleFonts.getFont(
                              'Lato',
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90.0),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Please enter confirmation code sent to your number',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        // obscureText: true,
                        // obscuringCharacter: '*',
                        // obscuringWidget: FlutterLogo(
                        //   size: 24,
                        // ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        enablePinAutofill: true,
                        // validator: (v) {
                        //   if (v.length < 3) {
                        //     return "I'm from validator";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        pinTheme: PinTheme(
                          fieldOuterPadding:
                              EdgeInsets.symmetric(horizontal: 5.0),
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.zero,
                          fieldHeight: 35,
                          fieldWidth: 30,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: false,
                        // errorAnimationController: errorController,
                        controller: confirmationCodeController,
                        keyboardType: TextInputType.number,
                        // boxShadows: [
                        //   BoxShadow(
                        //     offset: Offset(0, 1),
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                    // TextFormField(
                    //   key: Key('confirm-signup-code-input'),
                    //   controller: confirmationCodeController,
                    //   autofocus: false,
                    //   keyboardType: TextInputType.number,
                    //   cursorColor: Colors.black,
                    //   decoration: InputDecoration(
                    //       hintStyle: TextStyle(
                    //           fontSize: 40.0,
                    //           decoration: TextDecoration.underline),
                    //       hintText: '- - -  - - -',
                    //       fillColor: AppBackgroundColor,
                    //       filled: true,
                    //       alignLabelWithHint: true),
                    //   // The validator receives the text that the user has entered.
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your password';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextButton(
                      child: Text('Didnt`t receive code ?',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0)),
                      onPressed: () {
                        _resendSignUpCode();
                      },
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onPressed: () {
                            _confirmSignUp();
                            // Get.to(() => accountSetup());
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20.0),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70.0,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'Having a trouble?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => ContactUs());
                              },
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
