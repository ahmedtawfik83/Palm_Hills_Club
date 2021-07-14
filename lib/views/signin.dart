import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/services/auth_service.dart';

import '../constance.dart';
import 'forgot_password.dart';
import 'home.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  final Function showResult;
  final Function changeDisplay;
  final Function showCreateUser;
  final Function signOut;
  final Function fetchSession;
  final Function getCurrentUser;
  final Function setError;
  String phoneNumber = '';

  // ignore: public_member_api_docs
  SignIn(this.showResult, this.changeDisplay, this.showCreateUser, this.signOut,
      this.fetchSession, this.getCurrentUser, this.setError, this.phoneNumber);

  @override
  _SignInState createState() => _SignInState();
}

final usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String phoneNumber;
String phoneIsoCode = 'EG';
// AuthProvider provider = AuthProvider.amazon;

class _SignInState extends State<SignIn> {
  bool _obscureText = true;

  onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
    print('result phone onPhoneNumberChange: ' + phoneNumber.toString());
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<bool> signInWithPhoneNumberAndPassword(
      String username, String password) async {
    // if (phoneNumber.isEmpty) {
    //   Get.bottomSheet(Container(
    //       height: 100,
    //       color: AppBackgroundColor,
    //       child: Center(
    //         child: Text(
    //           'All fields are required',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //       )));
    // } else if (phoneNumber.isNotEmpty && phoneNumber.isPhoneNumber) {
    try {
      await Amplify.Auth.signOut();
      SignInResult res = await Amplify.Auth.signIn(
        username: phoneNumber,
        password: passwordController.text.trim(),
      );
      print('Sign IN Result : ' + res.isSignedIn.toString());
      if (res.isSignedIn) {
        passwordController.clear();
        Get.offAll(() => Home());
      }

      return res.isSignedIn;
    } on AmplifyException catch (e) {
      throw e;
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppBackgroundColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/phc-logo.png',
                          ),
                          fit: BoxFit.fill,
                          scale: 1,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Sign in ',
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                      // GoogleFonts.(
                      //   'Gotham',
                      //   textStyle: Theme.of(context).textTheme.headline4,
                      //   fontSize: 30.0,
                      //   fontWeight: FontWeight.w700,
                      //   color: Colors.black,
                      // ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        key: Key('signin-component'),
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
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
                              initialPhoneNumber: "",
                              initialSelection: phoneIsoCode,
                              enabledCountries: ['+20'],
                              showCountryCodes: true,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: TextFormField(
                              obscureText: _obscureText,
                              decoration: const InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    // onPressed: () {},
                                    // Icons.remove_red_eye,
                                    // color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  labelText: 'Password',
                                  alignLabelWithHint: true),
                              controller: passwordController,
                              // onSaved: (value) {
                              //   password = value;
                              // },
                              // // The validator receives the text that the user has entered.
                              // validator: (value) {
                              //   return AuthService().validatePassword(value);
                              // },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width * 0.60,
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
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Key('signin-button');
                                signInWithPhoneNumberAndPassword(
                                    phoneNumber, passwordController.text);
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    'Dont have an account?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  TextButton(
                                    key: Key('goto-signup-button'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signUp(
                                                  widget.showResult,
                                                  widget.changeDisplay,
                                                  widget.setError,
                                                  AuthService().backToSignIn,
                                                  AuthService().phoneNumber)));
                                    },
                                    // widget.showCreateUser,
                                    child: Text(
                                      'Sign Up',
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
