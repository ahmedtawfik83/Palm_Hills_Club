import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/views/signin.dart';
import 'package:palm_hills_club/views/signup.dart';

import '../constance.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '';
  String phoneIsoCode = 'EG';

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
          color: AppBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
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
                                    size: 35.0,
                                  ),
                                  onPressed: () {
                                    Get.to(() => SignIn(
                                        AuthController().showResult,
                                        AuthController().changeDisplay,
                                        AuthController().showCreateUser,
                                        AuthController().signOut,
                                        AuthController().fetchSession,
                                        AuthController().getCurrentUser,
                                        AuthController().setError,
                                        AuthController().phoneNumber));
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(right: 120.0),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Name',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  labelText: 'Email',
                                  alignLabelWithHint: true),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                            ),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              maxLines: 6,
                              decoration: const InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  labelText: 'Describe your issue',
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
                            height: MediaQuery.of(context).size.height * 0.03,
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
                                Get.defaultDialog(
                                  backgroundColor: Colors.transparent,
                                  // actions: [okButton],
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
                                        height: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    'Thank you for contacting us.',
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
                                            Get.offAll(() => signUp(
                                                  AuthController().showResult,
                                                  AuthController()
                                                      .changeDisplay,
                                                  AuthController().setError,
                                                  AuthController().backToSignIn,
                                                  AuthController().phoneNumber,
                                                  AuthController().email,
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Submit',
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
