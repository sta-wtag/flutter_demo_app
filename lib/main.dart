import 'package:flutter/material.dart';
import 'package:flutter_demo_application/screens/HomeScreen.dart';
import 'package:flutter_demo_application/screens/LibraryScreen.dart';
import 'package:flutter_demo_application/screens/ProfileScreen.dart';
import 'package:flutter_demo_application/screens/SplashScreen.dart';
import 'package:flutter_demo_application/screens/SearchScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.black,
              secondary: const Color(0xFF1DB954),
              background: const Color(0xFF121212),
              brightness: Brightness.dark,
            ),
        textTheme: const TextTheme(
            displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0),
            bodyLarge: TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0),
            bodyMedium:
                TextStyle(color: Color(0xFFE0E0E0), letterSpacing: 1.0)),
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/profile': (context) => ProfileScreen(),
        '/library': (context) => LibraryScreen()
      },
      home: SplashScreen(),
    );
  }
}
