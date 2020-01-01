import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String name, email, phoneNumber, password1, password2;

  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
    print(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Register",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Column(children: <Widget>[
                  new Container(
                    color: Colors.white,
                    height: 230.0,
                    child: new Column(
                      children: <Widget>[
                        Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: (_image == null
                                      ? Container(
                                          width: 200,
                                          height: 200,
                                          child: ClipOval(
                                            child: new SizedBox(
                                                width: 200.0,
                                                height: 200.0,
                                                child: CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Theme.of(context)
                                                                    .platform ==
                                                                TargetPlatform.iOS
                                                            ? Colors.white
                                                            : Colors.black,
                                                    child: Image.network(
                                                        "https://png.pngitem.com/pimgs/s/214-2145309_blank-profile-picture-circle-hd-png-download.png",
                                                        filterQuality:
                                                            FilterQuality.high),
                                                  )),
                                          ),
                                        )
                                      : new Container(
                                          width: 200,
                                          height: 200,
                                          child: ClipOval(
                                              child: new SizedBox(
                                                  width: 200.0,
                                                  height: 200.0,
                                                  child: Image.file(
                                                    _image,
                                                    fit: BoxFit.fill,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  ))))))
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 160.0, right: 15.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: new IconButton(
                                      onPressed: () => getImage(),
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ]),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Theme(
                                data: ThemeData(
                                  primaryColor: Colors.black,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please enter Name';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        contentPadding: EdgeInsets.all(15),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: Colors.grey,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Name'),
                                    onSaved: (input) => name = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Theme(
                                data: ThemeData(
                                  primaryColor: Colors.black,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter an email';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        contentPadding: EdgeInsets.all(15),
                                        prefixIcon: Icon(
                                          Icons.mail_outline,
                                          color: Colors.grey,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: Colors.grey,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'E-mail'),
                                    onSaved: (input) => email = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Theme(
                                data: ThemeData(
                                  primaryColor: Colors.black,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter your phone number';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        contentPadding: EdgeInsets.all(15),
                                        prefixIcon: Icon(
                                          Icons.call,
                                          color: Colors.grey,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: Colors.grey,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Phone Number'),
                                    onSaved: (input) => phoneNumber = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Theme(
                                data: ThemeData(
                                  primaryColor: Colors.black,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    obscureText: _secureText,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter your password';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        contentPadding: EdgeInsets.all(15),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: showHide,
                                          icon: Icon(_secureText
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: Colors.grey,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Password'),
                                    onSaved: (input) => password1 = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Theme(
                                data: ThemeData(
                                  primaryColor: Colors.black,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    obscureText: _secureText,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter your password again';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        contentPadding: EdgeInsets.all(15),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: showHide,
                                          icon: Icon(_secureText
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: Colors.grey,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Password again'),
                                    onSaved: (input) => password2 = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),

                              SizedBox(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width,
                                                              child: RaisedButton(
                                elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  textColor: Colors.black,
                                  color: Colors.white,
                                  onPressed: () {
                                    check();
                                  }),
                              ),
                          
                          SizedBox(
                                height: 25,
                              ),

                              Row(
                                children: <Widget>[
                                  Text(
                                    'Already have an account ?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                            
                                  GestureDetector(
                                  onTap: (){},
                                  child: Text(
                                    ' LOG IN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                            ),
                                ],
                              ),
                            
                             SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            )
          ],
        ));
  }
}
