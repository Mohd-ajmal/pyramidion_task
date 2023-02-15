import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:flutter_application_1/screens/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyramidion task',
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      
      home: ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider(),
      child: const BottomNavigationScreen())
    );
  }
}


