import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  int _rating = 0;

  void rateApp(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  Icon getRating(int pos) {
    if (_rating > pos) {
      return const Icon(Icons.star, color: Colors.amber);
    } else {
      return const Icon(Icons.star_outline, color: Colors.amberAccent,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      width: 500,
      height: 300,
      child: Card (
        color: Colors.blueGrey,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Please Rate this App:', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 10),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    rateApp(1);
                  }, child: getRating(0)),
                  ElevatedButton(onPressed: () {
                    rateApp(2);
                  }, child: getRating(1)),
                  ElevatedButton(onPressed: () {
                    rateApp(3);
                  }, child: getRating(2)),
                  ElevatedButton(onPressed: () {
                    rateApp(4);
                  }, child: getRating(3)),
                  ElevatedButton(onPressed: () {
                    rateApp(5);
                  }, child: getRating(4)),
                ],
              )
            ]
          )
        )
    );
  }

}