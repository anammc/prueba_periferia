import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_peliculas/features/the_movie/data/datasources/movie_local_data_sources.dart';
import 'package:prueba_peliculas/features/the_movie/data/datasources/movie_remote_data_sources.dart';
import 'package:prueba_peliculas/features/the_movie/data/repositories/movie_repository_impl.dart';
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/get_list_movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/get_list_movie_local.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/network_info.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/save_list_movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/search_movie.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/blocs/list_movie_bloc.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/blocs/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ListMovieBloc(
    getListMovieUseCase: sl(), 
    getListMovieLocalUseCase: sl(), 
    networkInfoUseCase: sl(),
    saveListMovieUseCase: sl(),
    ));
  sl.registerFactory(() => MovieBloc(
    searchMovieUseCase: sl(),
    getListMovieLocalUseCase: sl(),
    networkInfoUseCase: sl(),
    ));

  // Use cases
  sl.registerLazySingleton(() => GetListMovieUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchMovieUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetListMovieLocalUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveListMovieUseCase(repository: sl()));
  sl.registerLazySingleton(() => NetworkInfoUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      movieRemoteDataSources: sl(),
      movieLocalDataSources: sl(),
      connectivity: sl(),
    ),
  );

  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSources>(
    () => MovieRemoteDataSourcesImp(),
  );

  sl.registerLazySingleton<MovieLocalDataSources>(
    () => MovieLocalDataSourceImpl(),
  );
}