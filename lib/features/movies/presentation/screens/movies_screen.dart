import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/services/services_locator.dart';
import 'package:movies_application/features/movies/presentation/component/now_playing_component.dart';

import 'package:movies_application/features/movies/presentation/controller/moives_event.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_cubit.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocator<MoviesController>()
        ..add(GetNowPlayingMoviesEvent()),

      child: Scaffold(

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              NowPlayingComponent(),

            ],
          ),

      ),
    );
  }
}
