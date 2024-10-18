import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
      required super.adult,
      required super.backdropPath,
      required super.id,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.voteCount
      });

  factory MovieModel.fromJson(json){
    return MovieModel(
      adult: json['adult'], 
      backdropPath: json['backdrop_path'], 
      id: json['id'],
      originalTitle: json['original_title'], 
      overview: json['overview'], 
      popularity: json['popularity'], 
      posterPath: json['poster_path'], 
      releaseDate: json['release_date'], 
      title: json['title'], 
      voteAverage: json['vote_average'], 
      voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'id': id,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'vote_average': voteAverage,
    'vote_count': voteCount
  };

  factory MovieModel.fromEntity(Movie movie){
    return MovieModel(
      adult: movie.adult, 
      backdropPath: movie.backdropPath,  
      id: movie.id,
      originalTitle: movie.originalTitle, 
      overview: movie.overview, 
      popularity: movie.popularity, 
      posterPath: movie.posterPath, 
      releaseDate: movie.releaseDate, 
      title: movie.title,
      voteAverage: movie.voteAverage, 
      voteCount: movie.voteCount
      );
  }
}
