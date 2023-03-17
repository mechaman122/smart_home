import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smart_home/homePage.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/reponsive/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const MyLogin();
    } else {
      return const MyHomePage();
    }
  }
}
