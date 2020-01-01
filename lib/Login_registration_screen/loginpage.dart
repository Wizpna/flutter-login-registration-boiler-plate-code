import 'package:flutter/material.dart';
import 'package:raffle/Login_registration_screen/registrationpage.dart';
import 'package:raffle/logged_in_page/logged_in_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
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
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => LoggedInPage()));
    }
  }
  String _email, _passwaord;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Image.network(
                        "https://getsharex.com/img/ShareX_Logo_1024.png",
                        height: 150,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30)),
                                contentPadding: EdgeInsets.all(15),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.grey,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30)),
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: 'E-mail'),
                            onSaved: (input) => _email = input,
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
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Enter your password';
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30)),
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
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30)),
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: 'Password'),
                            onSaved: (input) => _email = input,
                          ),
                        ),
                      ),
                      SizedBox(
                            height: 12,
                          ),

                          FlatButton(
                            onPressed: (){},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                      
                      SizedBox(
                            height: 12,
                          ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 45.0,
                            child: RaisedButton(
                              elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Text(
                                  "LogIn",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                textColor: Colors.black,
                                color: Colors.white,
                                onPressed: () {
                                  check();
                                }),
                          ),
                          SizedBox(
                            height: 45.0,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegistrationPage()),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
