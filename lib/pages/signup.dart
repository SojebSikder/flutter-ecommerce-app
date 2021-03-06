import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bihongobuy/db/users.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Initialize variable
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool loading = false;

  // Methods
  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  /// Method for Signup with firebase (email and password)
  Future validateForm() async {
    FormState formState = _formKey.currentState;
    Map value;

    if (formState.validate()) {
      formState.reset();
      User user = firebaseAuth.currentUser;
      if (user == null) {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text);

        user = userCredential.user;
        if (user != null) {
          if (user.getIdToken() != null) {
            value = {
              "username": _nameTextController.text, //user.displayName
              "email": user.email,
              "userId": user.uid,
              "gender": gender,
            };
            _userServices.createUser(value);

            // Move to HomePage by replacing current page
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /*  Image.asset(
              "images/logo.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ), */
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "images/logo.png",
                width: 150.0,
                height: 150.0,
              ),
            ),
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                labelText: "User name *",
                                hintText: "User name",
                                icon: Icon(Icons.person),
                                border: InputBorder.none,
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The user name field cannot be empty";
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                labelText: "Email *",
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regEx = new RegExp(pattern);
                                  if (!regEx.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //color: Colors.white.withOpacity(0.4),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "male",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    value: "male",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "female",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    value: "female",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _passwordTextController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  labelText: "Password *",
                                  hintText: "Password",
                                  icon: Icon(Icons.lock),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password faild cannot be empty";
                                  } else if (value.length < 8) {
                                    return "Password has to be at least 6 characters long";
                                  }
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    if (hidePass == true) {
                                      hidePass = false;
                                    } else if (hidePass == false) {
                                      hidePass = true;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      //   child: Material(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //     color: Colors.white.withOpacity(0.8),
                      //     elevation: 0.0,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 12.0),
                      //       child: ListTile(
                      //         title: TextFormField(
                      //           controller: _confirmPasswordTextController,
                      //           obscureText: hidePass,
                      //           decoration: InputDecoration(
                      //             labelText: "Confirm password *",
                      //             hintText: "Confirm password",
                      //             icon: Icon(Icons.lock),
                      //             border: InputBorder.none,
                      //           ),
                      //           // ignore: missing_return
                      //           validator: (value) {
                      //             if (value.isEmpty) {
                      //               return "The password faild cannot be empty";
                      //             } else if (value.length < 8) {
                      //               return "Password has to be at least 6 characters long";
                      //             } else if (_passwordTextController.text !=
                      //                 value) {
                      //               return "Password not match";
                      //             }
                      //             return null;
                      //           },
                      //         ),
                      //         trailing: IconButton(
                      //           icon: Icon(Icons.remove_red_eye),
                      //           onPressed: () {
                      //             setState(() {
                      //               if (hidePass == true) {
                      //                 hidePass = false;
                      //               } else if (hidePass == false) {
                      //                 hidePass = true;
                      //               }
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red.shade700,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () async {
                              validateForm();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Sign up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
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
