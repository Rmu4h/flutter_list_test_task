import 'package:flutter/material.dart';
import 'package:flutter_list_test_task/fruits/view/fruits_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FruitsList(),
    );
  }
}