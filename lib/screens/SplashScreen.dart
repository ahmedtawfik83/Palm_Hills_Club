// import 'package:flutter/material.dart';
//
// import '../constance.dart';
//
// class Intro extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget signIn = Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       // color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.3,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.2,
//             width: MediaQuery.of(context).size.width * 0.4,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               image: DecorationImage(
//                 image: AssetImage(
//                   'assets/phc_black.png',
//                 ),
//                 fit: BoxFit.fill,
//                 scale: 1,
//                 alignment: Alignment.center,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.3,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Image.asset(
//               'assets/lyve.png',
//               scale: 3,
//             ),
//           ),
//         ],
//       ),
//     );
//     return Scaffold(
//       // resizeToAvoidBottomInset: true,
//       backgroundColor: AppBackgroundColor,
//       // body: SplashScreen(
//       //   seconds: 6,
//       //   navigateAfterSeconds: signIn,
//       //   //images/splash-pro.png
//       //   image: Image.asset(
//       //     'images/Splashcreen.jpg',
//       //     fit: BoxFit.fill,
//       //   ),
//       //   backgroundColor: Colors.transparent,
//       //   styleTextUnderTheLoader: TextStyle(),
//       //   // photoSize: ,
//       //   // loaderColor: Colors.red
//       // ),
//     );
//   }
// }
