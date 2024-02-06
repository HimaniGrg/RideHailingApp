import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Hailing App',
      debugShowCheckedModeBanner: false,
      home: const StartingPageScreen(),
      routes: AppRoutes.routes,
    );
  }
}
