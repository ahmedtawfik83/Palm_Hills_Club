import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:palm_hills_club/screens/signup.dart';

import 'account.dart';

// ignore: camel_case_types
class confirmAccount extends StatefulWidget {
  confirmAccount({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _confirmAccountState createState() => _confirmAccountState();
}

// ignore: camel_case_types
class _confirmAccountState extends State<confirmAccount> {
  final _formKey = GlobalKey<FormState>();

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
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Welcome To',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      ),
                    ),
                    Text(
                      'The Club',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 35.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signUp(),
                                ),
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Text(
                            'Confirm account ',
                            style: GoogleFonts.getFont(
                              'Lato',
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Please enter confirmation code sent to your number',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          '_ _ _  _ _ _',
                          style: TextStyle(fontSize: 40.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Dint`t receive code ?',
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),

                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   child: TextFormField(
                        //     obscureText: true,
                        //     decoration: InputDecoration(
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(40.0),
                        //           ),
                        //         ),
                        //         labelText: 'National ID Number',
                        //         alignLabelWithHint: true),
                        //     // The validator receives the text that the user has entered.
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Please enter your ID number';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 60.0,
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
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => accountSetup(),
                                  ),
                                );
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
                                'Next',
                                style: TextStyle(fontSize: 25.0),
                              )),
                        ),
                        SizedBox(
                          height: 180.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60.0,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  'Having a trouble?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Contact Us',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
