import 'package:dio_lesson/sasads.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SendingPage(),));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio"),
      ),
    );
  }
}

