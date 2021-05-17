import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/screens/SplashScreen.dart';

import 'bindings/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palm Hills Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialBinding: Binding(),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
