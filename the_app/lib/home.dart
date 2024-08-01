import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get user id or "not signed in" if unavailable
  Text getUserID() {
    String str = "Not signed in"; // Fallback in case of no user
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      str = currentUser.uid;
    }
    return Text(str, style: const TextStyle(fontSize: 25), textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: getUserID()),
          const Expanded(child: Text('Welcome To The App',
              style: TextStyle(fontSize: 60),
              textAlign: TextAlign.center,)),
          const Expanded(child: Text('Navigate around the app with the navigation bar below.',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center)),
        ],
      )
    );
  }

}