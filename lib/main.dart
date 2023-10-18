import 'package:flutter/material.dart';
import 'package:flutter_builtin_explicit_animations/align_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/decorated_box_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/default_text_style_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/fade_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/positioned_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/relative_positioned_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/rotation_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/scale_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/size_transition_design.dart';
import 'package:flutter_builtin_explicit_animations/slide_transition_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransitionDesign();
  }
}
