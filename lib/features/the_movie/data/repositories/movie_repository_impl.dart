import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/data/datasources/movie_local_data_sources.dart';
import 'package:prueba_peliculas/features/the_movie/data/datasources/movie_remote_data_sources.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSources movieRemoteDataSources;
  final MovieLocalDataSources movieLocalDataSources;
  final Connectivity connectivity;

  MovieRepositoryImpl({
    required this.movieRemoteDataSources,
    required this.movieLocalDataSources,
    required this.connectivity,
    });

  @override
  Future<Either<Failure, MovieList>> getListMovie() async {
    try{
      final MovieList resp = await movieRemoteDataSources.getMovieList();
      return Right(resp);
    }on DioException catch (error){
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            return Left(ServerFailure(message: 'Solicitud incorrecta (400).'));
          case 401:
            return Left(ServerFailure(message: 'No autorizado (401). Por favor, inicia sesión.'));
          case 500:
            return Left(ServerFailure(message: 'Error en el servidor (500). Intente más tarde.'));
          default:
            return Left(ServerFailure(message: 'Error del servidor: ${error.response!.statusCode}'));
        }
      } else {
        return Left(ServerFailure(message: 'Error de conexión: ${error.message}'));
      }
    } 
  }

  @override
  Future<Either<Failure, Movie>> getMovie(int id) async {
    try{
      final Movie resp = await movieRemoteDataSources.getMovie(id);
      return Right(resp);
    }on DioException catch (error){
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            return Left(ServerFailure(message: 'Solicitud incorrecta (400).'));
          case 401:
            return Left(ServerFailure(message: 'No autorizado (401). Por favor, verifica credenciales.'));
          case 500:
            return Left(ServerFailure(message: 'Error en el servidor (500). Intente más tarde.'));
          default:
            return Left(ServerFailure(message: 'Error del servidor: ${error.response!.statusCode}'));
        }
      } else {
        return Left(ServerFailure(message: 'Error de conexión: ${error.message}'));
      }
    }
  }
  
  @override
  Future<Either<Failure, MovieList>> getMoviesList() async {
    try{
      final MovieList resp = await movieLocalDataSources.getMoviesList();
      return Right(resp);
    }on LocalFailure{
      return Left(LocalFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> saveListMovie(MovieList movies) async {
    try{
      final bool resp = await movieLocalDataSources.saveMovies(movies);
      return Right(resp);
    }on LocalFailure{
      return Left(LocalFailure());
    }
  }
  
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  } 

  
}