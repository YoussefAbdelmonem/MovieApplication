import 'package:movies_application/features/movies/domain/entities/genres.dart';

class MovieGenresModel extends Genres
{
  const MovieGenresModel({required super.name, required super.id,});
  factory MovieGenresModel.fromJson(Map<String ,dynamic>json)=>
MovieGenresModel(name: json["name"], id: json["id"]);
}