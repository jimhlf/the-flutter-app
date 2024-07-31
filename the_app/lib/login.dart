import 'package:flutter/material.dart';
import 'package:the_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPage();

}

class ObscuredField extends StatelessWidget {
  const ObscuredField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 250,
        child: TextField (
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            ),
          ),
    );
  }

}

class _LoginPage extends State<LoginPage> {
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
            const Text("Welcome To The App"),
            const SizedBox(
              width: 250,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account'
                ),

              )
            ),
            const ObscuredField(),
            ElevatedButton(
              onPressed: () {
                Navigator
                    .push(
                    context, MaterialPageRoute(
                    builder: (context) => const MainAppPage(title: 'Home Page')));
                },
              child: const Text('Login')
            )
          ],
        )
      )
    );
  }

}