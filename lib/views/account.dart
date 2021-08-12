import 'dart:ui';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/helpers/loadingOverlay.dart';
import 'package:palm_hills_club/views/pendingConfirmation.dart';

import '../constance.dart';

class accountSetup extends StatefulWidget {
  final phoneNumber;

  const accountSetup({Key key, this.phoneNumber}) : super(key: key);
  @override
  _accountSetupState createState() => _accountSetupState();
}

class _accountSetupState extends State<accountSetup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool _checkedValue = false;
  bool _isObscure = true;
  bool _confirmIsObscure = true;

  Future<void> updatePassword(String newPassword) async {
    if (newPasswordController.text.trim().length > 7 &&
        newPasswordController.text.trim() ==
            confirmNewPasswordController.text.trim() &&
        _checkedValue == true) {
      try {
        var res = await Amplify.Auth.updatePassword(
                newPassword: newPassword, oldPassword: 'password')
            .then((value) => Get.offAll(
                  () => pendingConfirmation(),
                ));
        print('Result :' + res.toString());
        AuthController().showResult('Password Updated');
        AuthController().changeDisplay('SIGNED_IN');
      } on AmplifyException catch (e) {
        print('Error :' + e.message.toString());
        AuthController().setError(e);
      }
      // Get.bottomSheet(
      //   Container(
      //     height: 100,
      //     color: AppBackgroundColor,
      //     child: Center(
      //       child: Text(
      //         "Right Password",
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ),
      // ).then((value) => Get.offAll(
      //       () => pendingConfirmation(),
      //     ));
    } else if (newPasswordController.text.trim().isEmpty ||
        confirmNewPasswordController.text.trim().isEmpty) {
      Get.bottomSheet(
        Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              "Please Enter Your Password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } else if (newPasswordController.text.trim().length < 8 ||
        confirmNewPasswordController.text.trim().length < 8) {
      Get.bottomSheet(
        Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              "Password minimum length is 8",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } else if (newPasswordController.text.trim() !=
        confirmNewPasswordController.text.trim()) {
      Get.bottomSheet(
        Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              "Password must be same as above",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } else if (_checkedValue == false) {
      Get.bottomSheet(
        Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              "Please agree on Terms & conditions",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  // @override
  // void dispose() {
  //   newPasswordController.dispose();
  //   confirmNewPasswordController.dispose();
  //   super.dispose();
  // }

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
                                obscureText: _isObscure,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Password',
                                    alignLabelWithHint: true),
                                validator: (value) => value.isEmpty
                                    ? "Password is invalid"
                                    : value.length < 8
                                        ? Get.defaultDialog(
                                            backgroundColor: Colors.transparent,
                                            title: '',
                                            content: Column(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          const Radius.circular(
                                                              30.0),
                                                      topRight:
                                                          const Radius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                  width: double.infinity,
                                                  height: 200,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Failed',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Gotham',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 25.0),
                                                          ),
                                                          SizedBox(
                                                              height: 10.0),
                                                          RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  'Password must be atleast 8 characters long',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      18.0),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          const Radius.circular(
                                                              30.0),
                                                      bottomRight:
                                                          const Radius.circular(
                                                              30.0),
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 26.0),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).then((value) =>
                                            LoadingOverlay.of(context).hide())
                                        : null,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: confirmNewPasswordController,
                                obscureText: _confirmIsObscure,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    suffixIcon: IconButton(
                                      icon: Icon(_confirmIsObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _confirmIsObscure =
                                              !_confirmIsObscure;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    labelText: 'Confirm Password',
                                    alignLabelWithHint: true),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Re-Enter New Password";
                                  } else if (value.length < 9) {
                                    return "Password must be atleast 8 characters long";
                                  } else if (value !=
                                      newPasswordController.text.trim()) {
                                    return "Password must be same as above";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CheckboxListTile(
                              dense: true,
                              title: Text(
                                'I have read and agreed to the Terms & Conditions provided.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),
                              ),
                              value: _checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _checkedValue = newValue;
                                });
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
                                  updatePassword(newPasswordController.text);
                                  // Get.offAll(
                                  //   () => pendingConfirmation(),
                                  // );
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
