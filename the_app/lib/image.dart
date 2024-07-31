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
    return Card(
      color: Colors.blueGrey,
      child: Column (

      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

        ],

      )
    );
  }
}