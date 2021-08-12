import 'dart:async';

import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/views/signin.dart';

import 'amplifyconfiguration.dart';
import 'bindings/controllersBinding.dart';
import 'controllers/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(MyApp());
}

Future<void> _configureAmplify() async {
  AmplifyAnalyticsPinpoint _analyticsPlugin = AmplifyAnalyticsPinpoint();
  AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  AmplifyAPI _apiPlugin = AmplifyAPI();
  await Amplify.addPlugins([_authPlugin, _apiPlugin, _analyticsPlugin]);

  try {
    await Amplify.configure(amplifyconfig);
    print("Amplify Done");
  } catch (e) {
    print(e);
    print("Tried to reconfigure Amplify");
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palm Hills Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialBinding: ControllersBindings(),
      home: Scaffold(
        body: SignIn(
            AuthController().showResult,
            AuthController().changeDisplay,
            AuthController().showCreateUser,
            AuthController().signOut,
            AuthController().fetchSession,
            AuthController().getCurrentUser,
            AuthController().setError,
            AuthController().phoneNumber),
      ),
    );
  }
}
