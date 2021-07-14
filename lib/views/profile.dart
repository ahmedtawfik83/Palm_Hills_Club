import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills_club/views/home.dart';

import '../constance.dart';

class Profile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
          'profile',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.normal,
              fontSize: 20.0),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0),
            ),
            onPressed: () {
              Get.to(() => Home());
              Get.snackbar(
                'User Yssen Mansoor',
                'Successfully created',
              );
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage(
                    'assets/yassin.png',
                  ),
                  height: 100.0,
                  width: 100.0,
                ),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: TextFormField(
                                initialValue: 'Yaseen',
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                // keyboardType: inputType,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    // labelText: 'Yaseen',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: TextFormField(
                                initialValue: 'Mansoor',
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                // keyboardType: inputType,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    // labelText: 'Mansoor',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 50.0,
                              //   width: 180.0,
                              // ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: TextFormField(
                                  initialValue: 'Phone Number',
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                  // keyboardType: inputType,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            40.0,
                                          ),
                                        ),
                                      ),
                                      labelText: '',
                                      alignLabelWithHint: true),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: TextFormField(
                            initialValue: 'abcdaaaaa',
                            // obscuringCharacter: '',
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your ID number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
