import 'package:get/get.dart';

class AuthController extends GetxController {
  String? email, password, name;

  // Rx<User> _user = Rx<User>();
  //
  // String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

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

  // void saveUser(UserCredential user) async {
  //   await FireStoreUser().addUserToFireStore(UserModel(
  //     userId: user.user.uid,
  //     email: user.user.email,
  //     name: name == null ? user.user.displayName : name,
  //     pic: '',
  //   ));
  // }
}
