import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/screens/signin.dart';
import 'package:palm_hills_club/screens/signup.dart';

import '../constance.dart';

class ContactUs extends StatelessWidget {
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
                SizedBox(
                  height: 80.0,
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
                                  Get.to(() => signIn());
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
                          height: 120.0,
                        ),
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
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0),
                                  ),
                                ),
                                labelText: 'Phone Number',
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
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.width * 0.3,
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
                              Get.defaultDialog(
                                backgroundColor: AppBackgroundColor,
                                // actions: [okButton],
                                title: '',
                                content: Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Thank you for contacting us.',
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
                                      // margin: EdgeInsets.zero,
                                      width: double.infinity,
                                      height: 80,
                                      color: cardCustom,
                                      child: TextButton(
                                        style: ButtonStyle(),
                                        child: Text(
                                          "Okay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gotham',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 26.0),
                                        ),
                                        onPressed: () {
                                          Get.to(() => signUp());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 25.0),
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
