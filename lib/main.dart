import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/dependency/get_it.dart';
import 'package:tiktok_flutter/firebase_options.dart';
import 'package:tiktok_flutter/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Index(),
  ));
}
