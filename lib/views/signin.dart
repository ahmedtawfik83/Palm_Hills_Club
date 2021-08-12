import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/helpers/loadingOverlay.dart';

import '../constance.dart';
import 'forgotPassword.dart';
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

class _SignInState extends State<SignIn> {
  bool _isObscure = true;

  onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
    print('result phone onPhoneNumberChange: ' + phoneNumber.toString());
  }

  Future<String> signInWithPhoneNumberAndPassword(
      String username, String password) async {
    if (password.isEmpty || username.isNull) {
      Get.bottomSheet(Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              'All fields are required',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )));
    } else if (phoneNumber.isNotEmpty &&
        phoneNumber.isPhoneNumber &&
        password.isNotEmpty) {
      // final overlay = LoadingOverlay.of(context);

      try {
        await Amplify.Auth.signOut();
        SignInResult res =
            await LoadingOverlay.of(context).during(Amplify.Auth.signIn(
          username: username,
          password: password,
        ));
        print('Sign IN Result : ' + res.isSignedIn.toString());
        if (res.isSignedIn) {
          passwordController.clear();
          Get.offAll(() => Home());
        }

        // return res.isSignedIn;
      } on AuthException catch (e) {
        print(e);

        if (e.message == 'Incorrect username or password.' ||
            e.message == 'Failed since user is not authorized.')
          return Get.defaultDialog(
            backgroundColor: Colors.transparent,
            // actions: [okButton],
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
                                text: e.message,
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
          );
        LoadingOverlay.of(context).hide();
      }
    }
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
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
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
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          TextButton(
                            key: Key('goto-signup-button'),
                            onPressed: () {},
                            // widget.showCreateUser,
                            child: Text(
                              'Use authentication code',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                AuthController().backToSignIn,
                                                AuthController().phoneNumber,
                                                AuthController().email)));
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
