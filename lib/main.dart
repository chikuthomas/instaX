import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_view.dart';

void main() async {
  //initializing firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //firebase//
  runApp(const MyApp());
}
