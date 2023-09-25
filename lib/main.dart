import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_5/Constants/Variables/Const.dart';
import 'Screens/Authentication/Signup.dart';
import 'Screens/MyappScreens/Cover.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {

    Widget start() {
      if (FirebaseAuth.instance.currentUser != null) {
        return Cover_page();
      } else {
        return signup();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: start(),
    );
  }
}
