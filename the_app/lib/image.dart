import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key, required this.label, required this.imageLink});

  final String label;
  final String imageLink;

  @override
  State<StatefulWidget> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        color: Colors.blueGrey,
        child: Column (
          children: [
            Text(widget.label, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 10),
            Image.network(widget.imageLink),
            const SizedBox(height: 30)
          ],
        ),
      )
    );
  }

}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView (
        children: [
          ImageCard(label: 'Beautiful Owl', imageLink: 'https://github.com/jimhlf/the-flutter-app/blob/main/images/owl1.jpg?raw=true'),
          ImageCard(label: 'Beautiful Owl', imageLink: 'https://github.com/jimhlf/the-flutter-app/blob/main/images/owl2.jpg?raw=true'),
          ImageCard(label: 'Beautiful Owl', imageLink: 'https://github.com/jimhlf/the-flutter-app/blob/main/images/owl3.jpg?raw=true'),
        ],
      )
    );
  }
}