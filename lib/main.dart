import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/theme/theme.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: TAppTheme.lightTheme.textTheme,
      ),
      darkTheme: ThemeData(),
    );
  }
}
