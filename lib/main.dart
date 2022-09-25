import 'package:flutter/material.dart';
import 'package:movies_application/core/services/services_locator.dart';
import 'package:movies_application/core/utils/app_string.dart';
import 'package:movies_application/features/movies/presentation/screens/movies_screen.dart';

void main() {


  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark(

      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade700,
      ),
      home: const MainMoviesScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}

