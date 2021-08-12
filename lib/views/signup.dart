import 'dart:ui';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/helpers/loadingOverlay.dart';
import 'package:palm_hills_club/views/contactUs.dart';

import '../constance.dart';
import 'confirmAccount.dart';
import 'signin.dart';

class signUp extends StatefulWidget {
  final Function showResult;
  final Function changeDisplay;
  final Function setError;
  final Function backToSignIn;
  String phoneNumber = "";
  String email;
  final authServ = Get.put(AuthController);

  signUp(this.showResult, this.changeDisplay, this.setError, this.backToSignIn,
      this.phoneNumber, this.email);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController membershipNumberController =
      TextEditingController();
  final confirmationCodeController = TextEditingController();
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    membershipNumberController.dispose();
    confirmationCodeController.dispose();
    super.dispose();
  }

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
    if (firstNameController.text.isNull ||
        lastNameController.text.isNull ||
        phoneNumber.isNull ||
        membershipNumberController.text.isNull) {
      Get.bottomSheet(
        Container(
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
          ),
        ),
      );
    } else {
      final name = firstNameController.text.trim() +
          " " +
          lastNameController.text.trim();
      final email = emailController.text.trim();
      Map<String, String> userAttributes = {
        "name": name,
        "phone_number": phoneNumber.trim(),
        "email": email,
        "custom:club_id": membershipNumberController.text.trim(),
      };
      try {
        SignUpResult res = await LoadingOverlay.of(context).during(
            Amplify.Auth.signUp(
                username: phoneNumber.trim(),
                password: 'password',
                options: CognitoSignUpOptions(userAttributes: userAttributes)));
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

          Get.to(
            () => confirmAccount(
                AuthController().showResult,
                AuthController().changeDisplay,
                AuthController().setError,
                AuthController().backToSignIn,
                phoneNumber,
                membershipNumberController,
                widget.email),
          );
        }
      } on AuthException catch (error) {
        AuthController().setError(error);
        print(error.message);
        if (error.message == 'One or more parameters are incorrect.' ||
            error.message == 'Username is required to signUp')
          return Get.defaultDialog(
            backgroundColor: Colors.transparent,
            title: '',
            content: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                  ),
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Failed',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(height: 10.0),
                          RichText(
                            text: TextSpan(
                              text:
                                  'There seems to be a problem with the information you have submitted. Please check the information provided or contact us.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                    ),
                  ),
                  // padding: EdgeInsets.zero,
                  // margin: EdgeInsets.zero,
                  width: double.infinity,
                  height: 60,
                  // color: cardCustom,
                  child: TextButton(
                    // style: ButtonStyle(),
                    child: Text(
                      "Okay",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.normal,
                          fontSize: 26.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ).then((value) => LoadingOverlay.of(context).hide());
        else if (error.message == 'Username already exists in the system.' ||
            error.message ==
                'An account with the given phone_number already exists.')
          return Get.defaultDialog(
            backgroundColor: Colors.transparent,
            title: '',
            content: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                  ),
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Failed',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(height: 10.0),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Username already exists in the system.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                    ),
                  ),
                  // padding: EdgeInsets.zero,
                  // margin: EdgeInsets.zero,
                  width: double.infinity,
                  height: 60,
                  // color: cardCustom,
                  child: TextButton(
                    // style: ButtonStyle(),
                    child: Text(
                      "Okay",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.normal,
                          fontSize: 26.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ).then((value) => LoadingOverlay.of(context).hide());
      }
    }
  }

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
                                  AuthController().showResult,
                                  AuthController().changeDisplay,
                                  AuthController().showCreateUser,
                                  AuthController().signOut,
                                  AuthController().fetchSession,
                                  AuthController().getCurrentUser,
                                  AuthController().setError,
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
                                key: Key('signup-email-input'),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: null,
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    labelText: 'Email',
                                    alignLabelWithHint: true),
                                validator: (value) =>
                                    !AuthController().validateEmail(value)
                                        ? "Email is Invalid"
                                        : null,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
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
                                    MediaQuery.of(context).size.height * 0.01),
                            Expanded(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
