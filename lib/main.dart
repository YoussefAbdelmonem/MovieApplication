import 'package:flutter/material.dart';
import 'package:movies_application/core/services/services_locator.dart';
import 'package:movies_application/core/utils/app_string.dart';
import 'package:movies_application/features/movies/presentation/screens/movies_screen.dart';

void main() {
  // Movies movies =const Movies(
  //     id: 1,
  //     backdropPath: 'backdropPath',
  //     title: "title",
  //     overview: "overview",
  //     voteAverage: '1.5',
  //     releaseDate: '1.2',
  //     genreIds: [0]);
  // Movies movies1 =const Movies(
  //     id: 1,
  //     backdropPath: 'backdropPath',
  //     title: "title",
  //     overview: "overview",
  //     releaseDate: '12',
  //     voteAverage: '1.5',
  //     genreIds: [0]);
  //
  // print(movies==movies1);
  // print(movies.hashCode);
  // print(movies1.hashCode);

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

