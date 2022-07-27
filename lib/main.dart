import 'package:flutter/material.dart';
import './App/Views/homepage.dart';

void main() => runApp(Home());


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
    );
  }
}

