import 'dart:convert'; // Import your Country model
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:homework5/time/TimeTable.dart'; // Import the TimeTable widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fix constructor syntax

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white, // Set primary color to white
        scaffoldBackgroundColor: Colors.white, // Set scaffold background color to white
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Countries of the World'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TimeTable(), // Display the TimeTable widget here
    );
  }
}
