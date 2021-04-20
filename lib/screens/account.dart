import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:palm_hills_club/screens/signup.dart';

class accountSetup extends StatefulWidget {
  accountSetup({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _accountSetupState createState() => _accountSetupState();
}

class _accountSetupState extends State<accountSetup> {
  final _formKey = GlobalKey<FormState>();
  var _checkedValue = false;
  // Country _selectedDialogCountry =
  //     CountryPickerUtils.getCountryByPhoneCode('20');

  MaterialColor colorCustom = MaterialColor(0xF121212, {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Account Setup',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      ),
                    ),
                    Text(
                      'Please enter account information',
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 123.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Add Profile Picture'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                // keyboardType: inputType,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Password',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    labelText: 'Confirm Password',
                                    alignLabelWithHint: true),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CheckboxListTile(
                              title: Text(
                                'I have read and agreed to the Terms & Condtions provided.',
                                style: TextStyle(color: Colors.grey),
                              ),
                              value: _checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _checkedValue = newValue;
                                });
                              },
                              activeColor: Colors.grey,
                              checkColor: Colors.black,
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => confirmAccount(),
                                    //   ),
                                    // );
                                    // if (_formKey.currentState.validate()) {
                                    //   // If the form is valid, display a snackbar. In the real world,
                                    //   // you'd often call a server or save the information in a database.
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(SnackBar(
                                    //           content:
                                    //               Text('Processing Data')));
                                    // }
                                  },
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(fontSize: 25.0),
                                  )),
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => signUp(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Return to sign up',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),

                                // Container(
                                //   width: MediaQuery.of(context).size.width *
                                //       0.9,
                                //   height: 40.0,
                                //   child: Row(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       CheckboxListTile(
                                //         title: Text("title text"),
                                //         value: checkedValue,
                                //         onChanged: (newValue) {
                                //           setState(() {
                                //             checkedValue = newValue;
                                //           });
                                //         },
                                //         controlAffinity: ListTileControlAffinity
                                //             .leading, //  <-- leading Checkbox
                                //       ),
                                //       Text('data'),
                                //     ],
                                //   ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
