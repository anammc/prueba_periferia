
import 'package:prueba_peliculas/features/the_movie/data/models/movie_model.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';

class MovieListModel  extends MovieList{
  MovieListModel({required super.movies});

  factory MovieListModel.fromJson(List<dynamic> json){
    
    return MovieListModel(
      movies: json.isEmpty ? [] : List.from((json).map((movie) => MovieModel.fromJson(movie)))
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'movies':movies
    };
  }

  factory MovieListModel.fromEntity(MovieList list){
    return MovieListModel(movies: list.movies);
  }
} 