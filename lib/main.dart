// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/public/home_page.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/public/login.dart';
import 'package:smart_home/public/register.dart';
import 'package:smart_home/reponsive/wrapper.dart';
import 'package:smart_home/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          'register': (context) => MyRegister(),
          'login': (context) => MyLogin(),
          'homePage': (context) => MyHomePage()
        },
      ),
    );
  }
}
