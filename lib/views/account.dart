import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/services/auth_service.dart';
import 'package:palm_hills_club/views/pending_confirmation.dart';
import 'package:palm_hills_club/views/signin.dart';
import 'package:palm_hills_club/views/signup.dart';

import '../constance.dart';
import 'home.dart';

class accountSetup extends StatefulWidget {
  final phoneNumber;

  const accountSetup({Key key, this.phoneNumber}) : super(key: key);
  @override
  _accountSetupState createState() => _accountSetupState();
}

class _accountSetupState extends State<accountSetup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  var _checkedValue = false;

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
            padding: const EdgeInsets.only(top: 50.0),
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
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Account Setup',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ),
                  Text(
                    'Please enter account information',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text('Add Profile Picture'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: newPasswordController,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Password',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: newPasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    labelText: 'Confirm Password',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CheckboxListTile(
                              title: Text(
                                'I have read and agreed to the Terms & Conditions provided.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),
                              ),
                              value: _checkedValue,
                              onChanged: (newValue) {
                                _checkedValue = newValue;
                              },
                              activeColor: Colors.grey,
                              checkColor: Colors.black,
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                                  AuthService().updatePassword(
                                      newPasswordController.text);
                                  Get.offAll(
                                    () => pendingConfirmation(),
                                  );
                                },
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 0.0,
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      // Get.to(() => signUp());
                                    },
                                    child: Text(
                                      'Return to sign up',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
