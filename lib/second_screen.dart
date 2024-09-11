import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('segunda tela'),
      ),
      body: Center(
        child: Image.asset('assets/img.jpg')
      ),
    );
  }

}