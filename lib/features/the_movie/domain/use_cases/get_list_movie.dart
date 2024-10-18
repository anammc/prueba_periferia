import 'package:dartz/dartz.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';

class GetListMovieUseCase{
  final MovieRepository repository;

  GetListMovieUseCase({required this.repository});

  Future<Either<Failure, MovieList>> call(){
    return repository.getListMovie();
  }
}