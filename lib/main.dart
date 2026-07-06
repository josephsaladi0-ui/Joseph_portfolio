import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: JPF());
  }
}

class JPF extends StatefulWidget {
  const JPF({super.key});

  @override
  State<JPF> createState() => _JPFState();
}

class _JPFState extends State<JPF> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Joseph portfolio creation')),
    );
  }
}
