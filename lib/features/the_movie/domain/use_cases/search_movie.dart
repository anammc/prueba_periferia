import 'package:dartz/dartz.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';

class SearchMovieUseCase{
  final MovieRepository repository;

  SearchMovieUseCase({required this.repository});

  Future<Either<Failure, Movie>> call(int id){
    return repository.getMovie(id);
  }
}