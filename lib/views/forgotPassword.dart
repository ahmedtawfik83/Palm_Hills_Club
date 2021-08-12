import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/helpers/loadingOverlay.dart';
import 'package:palm_hills_club/views/signin.dart';

import '../constance.dart';
import 'confirmResetPassword.dart';

class ForgotPassword extends StatefulWidget {
  String phoneNumber;
  ForgotPassword({Key key, this.phoneNumber});
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController membershipNumberController = TextEditingController();
  @override
  void dispose() {
    membershipNumberController.dispose();
    super.dispose();
  }

  String phoneNumber = '';
  String phoneIsoCode = 'EG';
  var isPasswordReset;
  onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
    print('result phone onPhoneNumberChange: ' + phoneNumber.toString());
  }

  final _formKey = GlobalKey<FormState>();
  Future<String> _onRecoverPassword(BuildContext context, String phone) async {
    try {
      ResetPasswordResult res = await LoadingOverlay.of(context)
          .during(Amplify.Auth.resetPassword(username: phone));
      // setState(() {
      //   isPasswordReset = res.isPasswordReset;
      // });
      if (res.nextStep.updateStep == 'CONFIRM_RESET_PASSWORD_WITH_CODE') {
        Get.to(
          () => confirmResetPassword(
            phoneNumber: phoneNumber.trim(),
          ),
        );
      }
    } on AuthException catch (e) {
      print(e);
      // LoadingOverlay.of(context).hide();
      return Get.bottomSheet(
        Container(
          padding: EdgeInsets.all(5.0),
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${e.message}',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '  ${e.recoverySuggestion}',
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppBackgroundColor,
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(244, 244, 244, 244),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
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
                                    Get.to(
                                      () => SignIn(
                                          AuthController().showResult,
                                          AuthController().changeDisplay,
                                          AuthController().showCreateUser,
                                          AuthController().signOut,
                                          AuthController().fetchSession,
                                          AuthController().getCurrentUser,
                                          AuthController().setError,
                                          AuthController().phoneNumber),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(right: 120.0),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Please enter account information',
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
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
                          // Container(
                          //   height: MediaQuery.of(context).size.height * 0.07,
                          //   width: MediaQuery.of(context).size.width * 0.90,
                          //   child: TextFormField(
                          //     key: Key('signup-email-input'),
                          //     controller: emailController,
                          //     keyboardType: TextInputType.emailAddress,
                          //     decoration: InputDecoration(
                          //         focusedBorder: null,
                          //         fillColor: Colors.white,
                          //         filled: true,
                          //         border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.all(
                          //             Radius.circular(40.0),
                          //           ),
                          //         ),
                          //         labelText: 'Email',
                          //         alignLabelWithHint: true),
                          //     validator: (value) =>
                          //         !AuthService().validateEmail(value)
                          //             ? "Email is Invalid"
                          //             : null,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.03,
                          // ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextFormField(
                              controller: membershipNumberController,
                              decoration: const InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  labelText: 'Membership Number',
                                  alignLabelWithHint: true),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
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
                                    side: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  backgroundColor: Colors.transparent,
                                  title: '',
                                  content: Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: AppBackgroundColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(30.0),
                                            topRight:
                                                const Radius.circular(30.0),
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: 140,
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    'A code has been sent to your Email to change your password',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Gotham',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18.0),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(30.0),
                                            bottomRight:
                                                const Radius.circular(30.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
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
                                            _onRecoverPassword(
                                                context, phoneNumber.trim());
                                            // Get.to(() => confirmResetPassword(
                                            //       phoneNumber:
                                            //           phoneNumber.trim(),
                                            //     ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 20.0),
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
    );
  }
}
