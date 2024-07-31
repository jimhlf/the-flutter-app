import 'package:flutter/material.dart';
import 'package:the_app/activity.dart';
import 'package:the_app/home.dart';
import 'package:the_app/login.dart';
import 'package:the_app/rate.dart';
import 'package:the_app/image.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Login Page'),
    );
  }
}

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key, required this.title});

  final String title;

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _selectedIndex = 0;
  final List<String> pageTitles = ['Home Page', 'Activity Page', 'Record Page', 'Rate Page'];

  // Use this to swap screen while holding title and nav design
  Widget getPage() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage(title: 'Home Page');
      case 1:
        return const ActivityPage(title: 'Activity Page');
      case 2:
        return const ImagePage(title: 'Record Page');
      case 3:
        return const RatePage(title: 'Rate Page');
      default:
        return const HomePage(title: 'Home Page');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(pageTitles[_selectedIndex]),
      ),
      body: getPage(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.message_outlined),
            label: 'Activity',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.record_voice_over),
            icon: Icon(Icons.record_voice_over_outlined),
            label: 'Record',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_outlined),
            label: 'Rate',
          ),
        ],
      ),
    );
  }
}
