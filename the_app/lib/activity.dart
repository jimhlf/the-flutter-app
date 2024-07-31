import 'package:flutter/material.dart';
import 'package:the_app/main.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard ({super.key, required this.label, required this.description});

  final String label;
  final String description;

  @override
  State<StatefulWidget> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  late String label;
  late String description;
  late bool isDone;

  @override
  void initState() {
    super.initState();
    label = widget.label;
    description = widget.description;
    isDone = false;
  }

  void checkActivity() {
    setState(() {
      isDone = !isDone;
    });
  }

  Icon getStatus() {
    if (isDone) {
      return const Icon(Icons.check_box_outlined);
    }
    return const Icon(Icons.check_box_outline_blank);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column (
        children: [
          Text(label, style: const TextStyle(fontSize: 50)),
          SizedBox(height: 10),
          Text(description, style: const TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Complete: ', style: TextStyle(fontSize: 25)),
              ElevatedButton(onPressed: checkActivity, child: getStatus())
            ],
          )
        ],
      )
    );
  }
}

class ActivityPage extends StatefulWidget {
  const ActivityPage ({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ActivityCard(label: 'Activity 1', description: 'This is an activity'),
          ActivityCard(label: 'Complete The App', description: 'Remember to submit the project'),
        ],
      )
    );
  }

}