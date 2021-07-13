import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/views/confirm_account.dart';

class AuthController extends GetxController {
  String phoneNumber, phoneIsoCode, password;
  // String firstname, lastname;
  bool visible = false;
  String confirmedNumber = '';
  bool _isSignedUp = false;
  @override
  void onInit() {
    super.onInit();
  }

  onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    phoneNumber = internationalizedPhoneNumber;
    print('result phone  ' + phoneNumber.toString());
    update();
    // return phoneNumber;
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    visible = true;
    confirmedNumber = internationalizedPhoneNumber;
    update();
  }

  // Future<void> createAccountOnPressed(
  //   phone,
  //   TextEditingController firstname,
  //   TextEditingController lastname,
  // ) async {
  //   // final phoneNumber = internationalizedPhoneNumber;
  //   final name = firstname.text.trim() + lastname.text.trim();
  //   print('result phone $phoneNumber');
  //   try {
  //     Map<String, String> userAttributes = {
  //       'name': name,
  //       'phone_number': '+201225905696',
  //       'membershipNumber': '123456',
  //       // additional attributes as needed
  //     };
  //     SignUpResult res = await Amplify.Auth.signUp(
  //         username: phoneNumber.trim(),
  //         password: password,
  //         options: CognitoSignUpOptions(userAttributes: userAttributes));
  //     print(phoneNumber + name);
  //
  //     var isSignUpComplete = res.isSignUpComplete;
  //     _isSignedUp = true;
  //     Get.to(() => confirmAccount(
  //           phoneNumber: phoneNumber,
  //         ));
  //     try {
  //       var res = await Amplify.Auth.fetchUserAttributes();
  //       res.forEach((element) {
  //         print('key: ${element.userAttributeKey}; value: ${element.value}');
  //       });
  //     } on AuthException catch (e) {
  //       print(e.message);
  //     }
  //     update();
  //     print('Signup Successfully' + isSignUpComplete.toString());
  //     print(res.isSignUpComplete);
  //   } on AuthException catch (e) {
  //     print(e.message);
  //     print(e);
  //   }
  // }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
