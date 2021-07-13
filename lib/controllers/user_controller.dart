// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:get/get.dart';
// import 'package:palm_hills_club/models/User.dart';
// import 'package:palm_hills_club/models/Users.dart';
// import 'package:palm_hills_club/services/auth_service.dart';
// import 'package:palm_hills_club/services/datastore_service.dart';
//
// class UserController extends GetxController {
//   static UserController to = Get.find();
//   DataStoreService _datastoreService = DataStoreService();
//   AuthService _authService = AuthService();
//   final currentUser = Users();
//
//   Users get user => currentUser.id;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     // getCurrUser();
//     super.onReady();
//   }
//
//   // Future<void> getCurrUser() async {
//   //   AuthUser authUser = await _authService.getCurrentUser();
//   //   currentUser.value = await _datastoreService.getUser(authUser.userId);
//   //   print(currentUser.value);
//   // }
// }
