import 'package:bihongobuy/pages/home.dart';
import 'package:bihongobuy/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BihongoBuy',
      theme: ThemeData(
        primaryColor: Colors.red.shade900,
      ),
      home: Login(),
    );
  }
}
