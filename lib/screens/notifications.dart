import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import 'home.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => Home());
          },
        ),
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppBackgroundColor,
        title: Text(
          'Notifications',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/phc-logo.png',
                        fit: BoxFit.fill,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('managment'),
                        Text('Lorem ipsum dolor, nibh euismod tincid'),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/phc-logo.png',
                        fit: BoxFit.fill,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('managment'),
                        Text('Lorem ipsum dolor, nibh euismod tincid'),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/phc-logo.png',
                        fit: BoxFit.fill,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('managment'),
                        Text('Lorem ipsum dolor, nibh euismod tincid'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
