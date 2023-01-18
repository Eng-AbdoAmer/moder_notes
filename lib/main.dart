import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/add/add_note.dart';
import 'package:modern_notes/edit/edit_notes.dart';
import 'package:modern_notes/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth_screen.dart';

late SharedPreferences sPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sPref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: sPref.getString("id") == null ? "/auth" : "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/editNote": (context) => const EditNote(),
        "/addNote": (context) => AddNote(),
        "/auth": (context) => const AuthScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
