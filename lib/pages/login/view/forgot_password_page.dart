import 'package:flutter/material.dart';

class ForgotPasswordPage {
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Forgot Password')),
        body: const Center(child: Text('Forgot Password')),
      ),
    );
  }
}
