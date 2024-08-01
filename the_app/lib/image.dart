import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
    return SizedBox (
      width: 400,
      height: 500,
      child: Card(
        color: Colors.blueGrey,
        child: SizedBox (
          width: 300,
          height: 450,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.label, style: const TextStyle(fontSize: 40), textAlign: TextAlign.center,),
              const SizedBox(height: 10),
              Image.network(widget.imageLink),
              const SizedBox(height: 30)
            ],
          ),
        )
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
  TextEditingController labelController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  Future<List<dynamic>> getAllImages() async {
    final db = FirebaseFirestore.instance;
    List<dynamic> cards = [];
    await db.collection("Images").get().then((event) {
      for (final doc in event.docs) {
        cards.add(doc.data());
      }
    });
    return cards;
  }

  void saveNewImage() async {
    final db = FirebaseFirestore.instance;
    final info = <String, dynamic> {
      "label" : labelController.text,
      "link" : linkController.text,
    };
    db.collection("Images").add(info).then((DocumentReference doc) {
      clearFields();
    });
  }

  void clearFields() {
    labelController.clear();
    linkController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        TextField(
          controller: labelController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Label',
          ),
        ),
        TextField(
          controller: linkController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Link',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: clearFields,
                child: const Text('Clear', style: TextStyle(fontSize: 25))),
            ElevatedButton(onPressed: saveNewImage,
                child: const Text('Save', style: TextStyle(fontSize: 25))),
          ]
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: FutureBuilder<List<dynamic>> (
            future: getAllImages(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> list) {
              if (list.hasData) {
                List<Widget> cards = [];
                for (final info in list.data!) {
                  // Make an image card
                  cards.add(ImageCard(label: info["label"], imageLink: info["link"]));
                }
                return SizedBox(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cards,
                  )
                );
              }
              return const SizedBox(height: 10);
            },
          )
        )
      ],
    );
  }
}