import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}