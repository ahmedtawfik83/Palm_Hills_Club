import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> SignInFormKey = GlobalKey<FormState>();

  String phoneNumber = '';
  String email = '';
  String phoneIsoCode = 'EG';
  String displayState;
  String authState = 'User not signed in';
  AmplifyException error;

  onInit() {
    super.onInit();
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void showCreateUser() async {
    changeDisplay('SHOW_SIGN_UP');
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut();
      showResult('Signed Out');
      changeDisplay('SHOW_SIGN_IN');
    } on AmplifyException catch (e) {
      error = e;
      print(e);
    }
  }

  void fetchSession() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      showResult('Session Sign In Status = ' + res.isSignedIn.toString());
    } on AmplifyException catch (e) {
      setError(e);
      print(e);
    }
  }

  void setError(AuthException error) {
    var _signUpError = error.message;
    update();
  }

  void showResult(_authState) async {
    error = null;
    authState = _authState;
    update();
    print(authState);
  }

  void changeDisplay(_displayState) async {
    error = null;
    displayState = _displayState;
    update();
    print(displayState);
  }

  void getCurrentUser() async {
    try {
      var res = await Amplify.Auth.getCurrentUser();
      showResult('Current User Name = ' + res.username);
      update();
    } on AmplifyException catch (e) {
      setError(e);
    }
  }

  Future<bool> isSignedIn() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    update();
    return authSessions.isSignedIn;
  }

  void backToSignIn() async {
    changeDisplay('SHOW_SIGN_IN');
  }

  Future<bool> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      print(res.isSignedIn);
      return res.isSignedIn;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future saveUser(String username, String membershipNum) async {
    try {
      print(username);
      String graphQLDocument =
          '''mutation CreateUser(\$club_id: Int!, \$username: AWSPhone!, \$membershipNumber: String,\$phoneNumber: AWSPhone, \$isVerified : Boolean, \$userType: Int!,) {
                createUser(input: {club_id: \$club_id,username: \$username,
                membershipNumber: \$membershipNumber,  phoneNumber: \$phoneNumber,isVerified: \$isVerified, userType: \$userType,}) {
                  id
                  club_id
                  username
                  userType
                  membershipNumber
                  phoneNumber
                  isVerified
                }
          }''';

      var operation = Amplify.API.mutate(
          request:
              GraphQLRequest<String>(document: graphQLDocument, variables: {
        'club_id': 2,
        'username': username,
        'userType': 10,
        'membershipNumber': membershipNum,
        'phoneNumber': username,
        'isVerified': true,
      }));

      var response = await operation.response;
      var data = response.data;
      update();
      print('Mutation result : ' + data);
    } on AmplifyException catch (e) {
      print('Mutation failed : $e');
      return false;
    }
  }
}
