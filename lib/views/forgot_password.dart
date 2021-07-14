import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/services/auth_service.dart';
import 'package:palm_hills_club/views/signin.dart';
import 'package:palm_hills_club/views/signup.dart';

import '../constance.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                                          AuthService().showResult,
                                          AuthService().changeDisplay,
                                          AuthService().showCreateUser,
                                          AuthService().signOut,
                                          AuthService().fetchSession,
                                          AuthService().getCurrentUser,
                                          AuthService().setError,
                                          AuthService().phoneNumber),
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
                                    labelText: 'Phone Number',
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
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
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
                                  backgroundColor: AppBackgroundColor,
                                  // actions: [okButton],
                                  title: '',
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'A message has been sent to your email to change your password',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gotham',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18.0),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        width: double.infinity,
                                        height: 80,
                                        color: cardCustom,
                                        child: TextButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          30.0),
                                                  bottomRight:
                                                      const Radius.circular(
                                                          30.0),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Okay",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 26.0),
                                          ),
                                          onPressed: () {
                                            Get.offAll(
                                              () => SignIn(
                                                  AuthService().showResult,
                                                  AuthService().changeDisplay,
                                                  AuthService().showCreateUser,
                                                  AuthService().signOut,
                                                  AuthService().fetchSession,
                                                  AuthService().getCurrentUser,
                                                  AuthService().setError,
                                                  AuthService().phoneNumber),
                                            );
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
