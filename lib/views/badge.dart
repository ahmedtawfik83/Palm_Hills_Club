import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import 'home.dart';
import 'notifications.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Identity Badge',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.normal,
              fontSize: 20.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => Notifications());
            },
          ),
        ],
      ),
      backgroundColor: AppBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  'assets/yassin.png',
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Text(
                'Yassen Mansour',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              Text(
                'ID : 2233 4422 33444',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Membership type',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                '45',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/qr_code.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Scan at club Entrance',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
