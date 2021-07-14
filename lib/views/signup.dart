import 'dart:ui';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/services/auth_service.dart';
import 'package:palm_hills_club/views/contact_us.dart';

import '../constance.dart';
import 'confirm_account.dart';
import 'signin.dart';

class signUp extends StatefulWidget {
  final Function showResult;
  final Function changeDisplay;
  final Function setError;
  final Function backToSignIn;
  String phoneNumber = "";
  final authServ = Get.put(AuthService);

  signUp(this.showResult, this.changeDisplay, this.setError, this.backToSignIn,
      this.phoneNumber);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController membershipNumberController = TextEditingController();
  final confirmationCodeController = TextEditingController();

  String phoneNumber = '';
  String phoneIsoCode = 'EG';
  String signUpError = "";
  bool isSignedUp = false;
  AmplifyAuthCognito auth;
  String displayState;
  String authState = 'User not signed in';
  String lastHubEvent = '';
  AmplifyException error;
  bool visible = false;
  String confirmedNumber = '';

  Future<void> _signUp() async {
    setState(() {
      signUpError = "";
    });
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumber.isEmpty ||
        membershipNumberController.text.isEmpty) {
      Get.bottomSheet(Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              'All fields are required',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )));
    } else {
      final name = firstNameController.text.trim() +
          " " +
          lastNameController.text.trim();
      Map<String, String> userAttributes = {
        "name": name,
        "phone_number": phoneNumber.trim(),
        "custom:club_id": membershipNumberController.text.trim(),
      };
      try {
        SignUpResult res = await Amplify.Auth.signUp(
            username: phoneNumber.trim(),
            password: 'password',
            options: CognitoSignUpOptions(userAttributes: userAttributes));
        widget.showResult('Sign Up Status = ' + res.nextStep.signUpStep);
        widget.changeDisplay(res.nextStep.signUpStep != 'DONE'
            ? 'SHOW_CONFIRM'
            : 'SHOW_SIGN_UP');
        setState(() {
          isSignedUp = true;
        });
        if (res.nextStep.signUpStep != 'DONE') {
          firstNameController.clear();
          lastNameController.clear();
          // membershipNumberController.clear();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => confirmAccount(
                      AuthService().showResult,
                      AuthService().changeDisplay,
                      AuthService().setError,
                      AuthService().backToSignIn,
                      phoneNumber,
                      membershipNumberController)));
        }
      } on AuthException catch (error) {
        AuthService().setError(error);
        print('Signup failed: $error');
      }
    }
  }

  // void _confirmSignUp() async {
  //   setState(() {
  //     _signUpError = "";
  //   });
  //
  //   try {
  //     SignUpResult res = await Amplify.Auth.confirmSignUp(
  //         username: phoneNumber.trim(),
  //         confirmationCode: confirmationCodeController.text.trim());
  //     Navigator.pop(context, true);
  //   } on AuthException catch (error) {
  //     _setError(error);
  //   }
  // }

  onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
    print('result phone onPhoneNumberChange: ' + phoneNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          key: Key('signup-component'),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            key: Key('goto-signin-button'),
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                            ),
                            onPressed: () {
                              // widget.backToSignIn;
                              Get.offAll(() => SignIn(
                                  AuthService().showResult,
                                  AuthService().changeDisplay,
                                  AuthService().showCreateUser,
                                  AuthService().signOut,
                                  AuthService().fetchSession,
                                  AuthService().getCurrentUser,
                                  AuthService().setError,
                                  phoneNumber));
                            }),
                        Padding(
                          padding: const EdgeInsets.only(right: 120.0),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: TextFormField(
                                    key: Key('signup-firstName-input'),
                                    controller: firstNameController,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintText: 'First Name',
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              40.0,
                                            ),
                                          ),
                                        ),
                                        alignLabelWithHint: true),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: TextFormField(
                                    key: Key('signup-lastName-input'),
                                    // onChanged: (val) {
                                    //   controller.lastNameController =
                                    //       val as TextEditingController;
                                    // },
                                    controller: lastNameController,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintText: 'Last Name',
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              40.0,
                                            ),
                                          ),
                                        ),
                                        alignLabelWithHint: true),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  // color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: InternationalPhoneInput(
                                  decoration: InputDecoration.collapsed(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Phone Number',
                                  ),
                                  onPhoneNumberChange: onPhoneNumberChange,
                                  initialPhoneNumber: phoneNumber,
                                  initialSelection: phoneIsoCode,
                                  enabledCountries: ['+20'],
                                  showCountryCodes: true),
                            ),

                            // InternationalPhoneInputText(
                            //   onValidPhoneNumber:
                            //       AuthService().onValidPhoneNumber,
                            // ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: TextFormField(
                                key: Key('signup-membershipNumber-input'),

                                controller: membershipNumberController,
                                decoration: InputDecoration(
                                    focusedBorder: null,
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    labelText: 'Membership Number',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Membership number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    _signUp();
                                    // AuthService()
                                    // .createAccountOnPressed(
                                    // authService.phoneNumber
                                    //     .toString(),
                                    // authService.firstNameController,
                                    // authService.lastNameController
                                    // )
                                    // .then((value) =>
                                    //     Get.to(() => confirmAccount()));

                                    // AuthController().createAccountOnPressed(
                                    //     phoneNumber,
                                    //     firstNameController,
                                    //     lastNameController);
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
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
