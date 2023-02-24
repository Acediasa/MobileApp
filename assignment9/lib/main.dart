import 'package:assignment9/video.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(
    home: Scaffold(
      body: MyApp(),
      // body: VideoPlayerScreen(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Player")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              VideoWidget(name: "bird"),
              VideoWidget(name: "cat"),
              VideoWidget(name: "dog"),
              VideoWidget(name: "frog"),
              VideoWidget(name: "squirrel"),
            ],
          ),
        )
      )
    );
  }
}