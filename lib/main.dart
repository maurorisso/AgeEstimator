import 'package:age_estimator/theme.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: appTheme,
    home: const Home(),
  ));
}
