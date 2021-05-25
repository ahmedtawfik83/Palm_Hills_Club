import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/screens/about_us.dart';
import 'package:palm_hills_club/screens/badge.dart';
import 'package:palm_hills_club/screens/notifications.dart';
import 'package:palm_hills_club/screens/profile.dart';
import 'package:palm_hills_club/screens/signin.dart';

import '../constance.dart';

final List<String> imgList = [
  'assets/img-01.jpg',
  'assets/img-02.jpg',
  'assets/img-03.jpg',
];

// ignore: camel_case_types, must_be_immutable
class Home extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                      image: AssetImage(
                        'assets/yassin.png',
                      ),
                      height: 80.0,
                      width: 80.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Yassen Mansour',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      Text(
                        'ID : 2233 4422 33444',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.normal,
                            fontSize: 13.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              onTap: () {
                Get.to(() => Home());
              },
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              onTap: () {
                Get.to(() => Profile());
              },
            ),
            ListTile(
              title: Text(
                'About us',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              onTap: () {
                Get.to(() => aboutUs());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image(
                image: AssetImage(
                  'assets/phc-logo.png',
                ),
                height: 150.0,
                width: 150.0,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: 80,
              color: Colors.black,
              child: Center(
                child: TextButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  ),
                  onPressed: () {
                    Get.to(() => SignIn());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppBackgroundColor,
        title: Text(
          'Palm Hills Club',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image(
                          image: AssetImage(
                            'assets/yassin.png',
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yassen Mansour',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'ID : 2233 4422 33444',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        width: 20.0,
                        thickness: 1,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Badge());
                        },
                        child: Text(
                          'View Badge',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: cardCustom,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.95,
                  // color: Colors.black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'What`s New?',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Explore >',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.4,
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                    ),
                    items: imgList
                        .map(
                          (item) => Container(
                            child: Center(
                              child: Image.asset(
                                item,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Club Working Hours',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Sun',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Mon',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Tue',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Wed',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Thu',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Fri',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Sat',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('10-9'),
                            Text('10-9'),
                            Text('10-9'),
                            Text('10-9'),
                            Text('10-9'),
                            Text('10-9'),
                            Text('10-9'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.95,
                  // color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
