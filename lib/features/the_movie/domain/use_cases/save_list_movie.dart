import 'package:dartz/dartz.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';

class SaveListMovieUseCase{
  final MovieRepository repository;

  SaveListMovieUseCase({required this.repository});

  Future<Either<Failure, bool>> call(MovieList movies){
    return repository.saveListMovie(movies);
  }
}