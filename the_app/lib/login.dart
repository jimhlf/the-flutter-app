import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_app/main.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome To The App", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
            const SizedBox(height: 50),
            SizedBox(
              width: 250,
              child: TextField(
                controller: accountController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account'
                ),

              )
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextField (
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: accountController.text, password: passwordController.text
                ).then((value) {
                  // Allow login
                  print('Login successful');
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => const MainAppPage(title: 'Home Page')));
                }).catchError((error) {
                  print('Login not successful');
                  passwordController.clear();
                });
              },
              child: const Text('Login')
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: accountController.text, password: passwordController.text
                  ).then((value) {
                    print('User has been signed up');
                  }).catchError((error) {
                    print('User sign up failed.');
                    print(error.toString());
                  });
                },
                child: const Text('Sign up')
            )
          ],
        )
      )
    );
  }

}