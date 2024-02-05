import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingappcoding/database/habit_database.dart';
import 'package:testingappcoding/theme/dark_mode.dart';
import 'package:testingappcoding/theme/light_mode.dart';
import 'package:testingappcoding/theme/theme_provider.dart';
import 'pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initialize database
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}
