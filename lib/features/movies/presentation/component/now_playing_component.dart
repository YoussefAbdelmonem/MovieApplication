import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/network/api_constance.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_cubit.dart';
import 'package:movies_application/features/movies/presentation/controller/movies_state.dart';
import 'package:movies_application/features/movies/presentation/screens/movie_detail_screen.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesController, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlyingState != current.nowPlyingState,
      builder: (context, state) {
        print(state);
        switch (state.nowPlyingState) {
          case RequestState.loading:
            return  Container(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(

                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  height: 500.0,
                  viewportFraction: 1.0,
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    /// replacement of INKWELL
                    return GestureDetector(

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MovieDetailScreen(
                            id: item.id,
                          );
                        }));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 500.0,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'Now Playing'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
