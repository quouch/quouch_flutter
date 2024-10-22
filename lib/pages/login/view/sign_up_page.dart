import 'package:flutter/material.dart';

class SignUpPage {
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: const Center(child: Text('Sign Up')),
      ),
    );
  }
}
