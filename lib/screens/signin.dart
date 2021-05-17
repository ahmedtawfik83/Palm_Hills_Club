import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import 'forgot_password.dart';
import 'signup.dart';

class signIn extends StatelessWidget {
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
      body: Container(
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
                  // height: 365,
                  // width: 364,
                  // color: Colors.white,
                  // child: Image.asset(
                  //   'assets/phc-logo.png',
                  //   fit: BoxFit.contain,
                  //   height: 250,
                  //   width: 250,
                  //   // scale: 1.5,
                  // ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'SIGN IN ',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
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
                                  labelText: 'Email Address',
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
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0),
                                  ),
                                ),
                                labelText: 'Password',
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
                          height: 40.0,
                        ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 25.0),
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
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120.0,
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
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => signUp());
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
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
    );
  }
}
