
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_application/core/services/services_locator.dart';

import 'package:movies_application/features/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_application/features/movies/presentation/component/movie_details_content.dart';


class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MovieDetailsController>()
        ..add(GetMovieDetailsEvent(id)),
      lazy: false,
      child: const Scaffold(
        body:  MovieDetailContent(),
      ),
    );
  }
}


