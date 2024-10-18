import 'dart:async';

import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quouch_app/di/injector.dart';

import 'app.dart';

late CloudinaryObject cloudinary;

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initCloudinary();
  setup();
  runApp(const App());
}

Future<void> initCloudinary() async {
  await dotenv.load(fileName: '.env');
  CloudinaryContext.cloudinary =
      Cloudinary.fromStringUrl(dotenv.env['CLOUDINARY_URL']!);
}
