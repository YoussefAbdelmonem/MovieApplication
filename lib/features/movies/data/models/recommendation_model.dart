import 'package:movies_application/features/movies/domain/entities/movie_recommendations.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath: json["backdrop_path"] ?? "/2RSirqZG949GuRwN38MYCIGG4Od.jpg", id: json["id"]);
}
