import 'package:flutter/material.dart';
import 'package:flutter_application_15/screen/home.dart';
import 'package:flutter_application_15/screen/login.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      title: 'User CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const login(),
      },
    );
  }
}
