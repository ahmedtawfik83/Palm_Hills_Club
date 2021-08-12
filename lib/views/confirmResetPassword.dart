import 'dart:ui';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/controllers/authController.dart';
import 'package:palm_hills_club/helpers/loadingOverlay.dart';
import 'package:palm_hills_club/views/signin.dart';

import '../constance.dart';
import 'forgotPassword.dart';

class confirmResetPassword extends StatefulWidget {
  final Function showResult;
  final Function changeDisplay;
  final Function setError;
  final Function backToSignIn;
  String phoneNumber;

  confirmResetPassword(
      {Key key,
      this.showResult,
      this.changeDisplay,
      this.setError,
      this.backToSignIn,
      this.phoneNumber})
      : super(key: key);
  @override
  _confirmResetPasswordState createState() => _confirmResetPasswordState();
}

class _confirmResetPasswordState extends State<confirmResetPassword> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    print('Passed Number : ' + widget.phoneNumber.toString());
  }

  final newPasswordController = TextEditingController();
  final confirmationCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmationCodeController.dispose();
    super.dispose();
  }

  void _confirmReset(String phone, String newPass, String code) async {
    if (newPass.isNull || code.isNull) {
      Get.bottomSheet(
        Container(
          height: 100,
          color: AppBackgroundColor,
          child: Center(
            child: Text(
              'All fields are required',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    } else {
      try {
        await LoadingOverlay.of(context).during(Amplify.Auth.confirmPassword(
            username: phone, newPassword: newPass, confirmationCode: code));
        Get.to(
          () => SignIn(
              AuthController().showResult,
              AuthController().changeDisplay,
              AuthController().showCreateUser,
              AuthController().signOut,
              AuthController().fetchSession,
              AuthController().getCurrentUser,
              AuthController().setError,
              phoneNumber),
        ).then((value) => Get.snackbar(
              'Password changed successfully.',
              'Please Sign in',
            ));
      } on AmplifyException catch (e) {
        print(e);
        widget.setError(e);
        return Get.bottomSheet(
          Container(
            padding: EdgeInsets.all(5.0),
            height: 100,
            color: AppBackgroundColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${e.message}',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
                                      () => ForgotPassword(),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(right: 85.0),
                                child: Text(
                                  'Confirm Reset Password',
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Please enter confirmation information',
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
                                controller: newPasswordController,
                                obscureText: _isObscure,
                                autofocus: false,
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
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'New Password',
                                    alignLabelWithHint: true),
                                validator: (value) => value.isEmpty
                                    ? "Password is invalid"
                                    : value.length < 9
                                        ? "Password must contain at least 8 characters"
                                        : null,
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
                              controller: confirmationCodeController,
                              decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                  labelText: 'Confirmation Code ',
                                  alignLabelWithHint: true),
                              // The validator receives the text that the user has entered.
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter your password';
                              //   }
                              //   return null;
                              // },
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
                                _confirmReset(
                                    widget.phoneNumber,
                                    newPasswordController.text.trim(),
                                    confirmationCodeController.text.trim());
                                // Get.offAll(
                                //   () => SignIn(
                                //       AuthService().showResult,
                                //       AuthService().changeDisplay,
                                //       AuthService().showCreateUser,
                                //       AuthService().signOut,
                                //       AuthService().fetchSession,
                                //       AuthService().getCurrentUser,
                                //       AuthService().setError,
                                //       AuthService().phoneNumber),
                                // );
                                // Get.defaultDialog(
                                //   backgroundColor: AppBackgroundColor,
                                //   // actions: [okButton],
                                //   title: '',
                                //   content: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     children: [
                                //       RichText(
                                //         text: TextSpan(
                                //           text:
                                //               'A message has been sent to your Phone number to change your password',
                                //           style: TextStyle(
                                //               color: Colors.black,
                                //               fontFamily: 'Gotham',
                                //               fontWeight: FontWeight.normal,
                                //               fontSize: 18.0),
                                //         ),
                                //         textAlign: TextAlign.center,
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.zero,
                                //         margin: EdgeInsets.zero,
                                //         width: double.infinity,
                                //         height: 80,
                                //         color: cardCustom,
                                //         child: TextButton(
                                //           style: ButtonStyle(
                                //             shape: MaterialStateProperty.all<
                                //                 RoundedRectangleBorder>(
                                //               RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.only(
                                //                   bottomLeft:
                                //                       const Radius.circular(
                                //                           30.0),
                                //                   bottomRight:
                                //                       const Radius.circular(
                                //                           30.0),
                                //                 ),
                                //                 side: BorderSide(
                                //                     color: Colors.black),
                                //               ),
                                //             ),
                                //           ),
                                //           child: Text(
                                //             "Okay",
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontFamily: 'Gotham',
                                //                 fontWeight: FontWeight.normal,
                                //                 fontSize: 26.0),
                                //           ),
                                //           onPressed: () {
                                //             Get.offAll(
                                //               () => SignIn(
                                //                   AuthService().showResult,
                                //                   AuthService().changeDisplay,
                                //                   AuthService().showCreateUser,
                                //                   AuthService().signOut,
                                //                   AuthService().fetchSession,
                                //                   AuthService().getCurrentUser,
                                //                   AuthService().setError,
                                //                   AuthService().phoneNumber),
                                //             );
                                //           },
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // );
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
