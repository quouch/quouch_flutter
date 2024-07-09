import 'package:flutter/material.dart';

Route createRoute(Widget screen, BuildContext prevContext) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        Theme(data: Theme.of(prevContext), child: screen),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.ease;

      var tween = Tween(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: animation, curve: curve));

      return ScaleTransition(
        scale: tween,
        child: child,
      );
    },
  );
}
