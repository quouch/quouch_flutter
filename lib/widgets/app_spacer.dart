import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quouch_app/theme/app_theme.dart';

class AppSpacer extends StatelessWidget {
  final SizeKey size;

  const AppSpacer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = AppSpacing().get(size);
    return Padding(
      padding: EdgeInsets.all(height),
    );
  }
}
