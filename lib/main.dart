import 'package:flutter/material.dart';

import 'features/employees/presentation/pages/employees.dart';

void main() {
  // Bloc observer = const SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocalAgent Employee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Employees(),
    );
  }
}
