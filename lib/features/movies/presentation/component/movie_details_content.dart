import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/app_string.dart';
import 'package:movies_application/core/utils/enum.dart';
import 'package:movies_application/features/movies/domain/entities/genres.dart';
import 'package:movies_application/core/network/api_constance.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_application/features/movies/presentation/controller/movie_details/movie_details_bloc.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsController, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  stretch: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    /// ANIMATE DO
                    background: FadeInDown(
                      duration: const Duration(milliseconds: 900),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 2.0, 2.0],
                          ).createShader(
                            Rect.fromLTWH(1.0, 1.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstance.imageUrl(
                              state.movieDetails!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  /// ANIMATE DO
                  child: FadeInUp(
                    from: 10,
                    duration: const Duration(milliseconds: 900),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetails!.title,
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          const SizedBox(height: 8.0),

                          /// The Row that contain data , rating , Time of the movie
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.movieDetails!.releaseDate.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.movieDetails!.voteAverage)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                showDuration(state.movieDetails!.runtime),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),

                          /// The overview and the genres
                          Text(
                            state.movieDetails!.overview,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${AppString.genres}: ${showGenres(state.movieDetails!.genres)}',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return Text(state.movieDetailsMessage);
        }
      },
    );
  }

  String showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String showDuration(int runtime) {
    int hours = runtime ~/ 60;
    int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
