// import 'package:amplify_flutter/amplify.dart';
// import 'package:palm_hills_club/models/User.dart';
// import 'package:palm_hills_club/models/Users.dart';
//
// class DataStoreService {
//   Future<void> saveUser(User user) async {
//     try {
//       if (await getUser(user.id) == null) {
//         await Amplify.DataStore.save(user);
//         print('Saved');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<User> getUser(String userId) async {
//     try {
//       List<User> user = await Amplify.DataStore.query(User.classType,
//           where: User.ID.eq(userId));
//       if (user.length > 0) {
//         print(user);
//         return user.first;
//       } else
//         print('null');
//       return null;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<List<User>> getUsers(String userId) async {
//     try {
//       List<User> users = await Amplify.DataStore.query(User.classType,
//           where: User.ID.eq(userId));
//       if (users.length > 0) {
//         return users;
//       } else
//         return null;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<void> removeUser(User user) async {
//     try {
//       await Amplify.DataStore.delete(user);
//     } catch (e) {
//       print('error');
//       throw e;
//     }
//   }
//
//   Future<void> setUserVerified(User user, bool newValue) async {
//     try {
//       User userData = (await Amplify.DataStore.query(User.classType,
//           where: User.ID.eq(user.id)))[0];
//       await Amplify.DataStore.save(userData.copyWith(isVerified: newValue));
//     } catch (e) {
//       throw e;
//     }
//   }
// }
