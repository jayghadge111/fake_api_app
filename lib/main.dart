// main.dart

import 'package:fake_api_app/presentation/person_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fake API App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonListUIScreen(),
    );
  }
}
