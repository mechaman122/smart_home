// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, duplicate_ignore, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:smart_home/public/login.dart';
import 'package:smart_home/reponsive/wrapper.dart';
import 'package:smart_home/services/auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final auth = AuthService();
  final keyForm = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
                image: AssetImage('images/register.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.width * 0.4, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      reusableTextField("Enter Email", Icons.person_outline,
                          false, _emailController),
                      const SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Enter Password", Icons.person_outline,
                          true, _passwordController),
                      signInSignUpButton(context, false, () async {
                        if (keyForm.currentState?.validate() ?? false) {
                          dynamic result = await auth.registerWithEmailAndPass(
                              _emailController.text, _passwordController.text);
                          if (result == null) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Can't register!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          } else {
                            await auth.registerWithEmailAndPass(
                                _emailController.text,
                                _passwordController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Wrapper()));
                          }
                        }
                      })
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
