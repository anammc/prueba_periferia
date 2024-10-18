import 'package:dartz/dartz.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';

abstract class MovieRepository{
  Future<Either<Failure, Movie>> getMovie(int id);
  Future<Either<Failure, MovieList>> getListMovie();
  Future<Either<Failure, MovieList>> getMoviesList();
  Future<Either<Failure, bool>> saveListMovie(MovieList movies);
  Future<bool> isConnected();
}