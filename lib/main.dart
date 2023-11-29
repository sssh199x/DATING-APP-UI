import 'package:flutter/material.dart';
import 'package:uitask/ui_screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI TASK',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              
            ),
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 35),
            displaySmall:
                TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            bodySmall:
                TextStyle(fontSize: 11, color: Colors.white)),
        // colorScheme: const ColorScheme.light(
        //     inversePrimary: Color(0xfffa5480), onPrimary: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
