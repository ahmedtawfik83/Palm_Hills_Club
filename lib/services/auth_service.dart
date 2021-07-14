import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/models/Users.dart';

class AuthService extends GetxController {
  // DataStoreService _dataStoreService = DataStoreService();
  final GlobalKey<FormState> SignInFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController,
      lastNameController,
      passwordController,
      membershipNumberController,
      newPasswordController;
  String phoneNumber = '';
  String phoneIsoCode = 'EG';
  bool _isSignedUp = false;
  Users currUser;
  AmplifyAuthCognito auth;
  String displayState;
  String authState = 'User not signed in';
  String lastHubEvent = '';
  AmplifyException error;
  String _signUpError = "";
  // final oldPasswordController = TextEditingController();

  onInit() {
    super.onInit();
  }

  void updatePassword(String newPassword) async {
    try {
      await Amplify.Auth.updatePassword(
          newPassword: newPassword, oldPassword: 'password');
      showResult('Password Updated');
      changeDisplay('SIGNED_IN');
    } on AmplifyException catch (e) {
      print('Error :' + e.message.toString());
      setError(e);
    }
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
    _signUpError = error.message;
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
    } on AmplifyException catch (e) {
      setError(e);
    }
  }

  // Future<void> signOut() async {
  //   try {
  //     await Amplify.Auth.signOut();
  //     await Amplify.DataStore.clear();
  //   } on AuthException catch (e) {
  //     print(e.message);
  //   }
  // }

  Future<bool> isSignedIn() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    return authSessions.isSignedIn;
  }

  void backToSignIn() async {
    changeDisplay('SHOW_SIGN_IN');
  }
  // Future<AuthUser> getCurrentUser() async {
  //   AuthUser authUser = await Amplify.Auth.getCurrentUser();
  //   return authUser;
  // }

  @override
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
      // await Amplify.Auth.signOut();
      // SignInResult res = await Amplify.Auth.signIn(
      //   username: username,
      //   password: 'password',
      // );
      // print(res.isSignedIn);
      // AuthUser authUser = await Amplify.Auth.getCurrentUser();
      // print('Auth User ID : ' + authUser.username);
      //
      // final authUserAttributes = await Amplify.Auth.fetchUserAttributes();
      // String phoneNumber;
      // String userId;
      // authUserAttributes.forEach((element) {
      //   if (element.userAttributeKey == "phoneNumber")
      //     phoneNumber = element.value;
      //   else if (element.userAttributeKey == "sub") userId = element.value;
      // });
      // print(authUserAttributes);
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
      print('Mutation result: ' + data);
    } on AmplifyException catch (e) {
      print('Mutation failed: $e');
      return false;
    }
  }

  // Future<bool> confirmRegisterWithCode(
  //     String username, String password, String code) async {
  //   try {
  //     SignUpResult res = await Amplify.Auth.confirmSignUp(
  //         username: username, confirmationCode: code);
  //
  //     if (res.isSignUpComplete) {
  //       final signInRes = await loginWithEmailPassword(username, password);
  //       await saveUser(username);
  //       return signInRes;
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
