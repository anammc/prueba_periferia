import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/get_list_movie_local.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/network_info.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/search_movie.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc{
  BehaviorSubject<Movie> movieController =
      BehaviorSubject<Movie>();
  Stream<Movie?> get movieStream => movieController.stream;
  final SearchMovieUseCase searchMovieUseCase;
  final GetListMovieLocalUseCase getListMovieLocalUseCase;
  final NetworkInfoUseCase networkInfoUseCase;

  getMovieRemote(int id) async {
    final result = await searchMovieUseCase(id);
    result.fold(
      (error) {
        if (error is ServerFailure) {
          print('Error del servidor: ${error.message}');
        } else if (error is LocalFailure) {
          print('Error local: ${error.message}');
        }
      },
      (data) {
        movieController.sink.add(data);
      },
    );
  }
  getMovieLocal(int id) async {
    final result = await getListMovieLocalUseCase();
    result.fold(
      (error) {
        if (error is ServerFailure) {
          print('Error del servidor: ${error.message}');
        } else if (error is LocalFailure) {
          print('Error local: ${error.message}');
        }
      },
      (data) {
        Movie movie = data.movies!.firstWhere((mov) => mov.id == id);
        movieController.sink.add(movie);
      },
    );
  }

  getMovie(int id) async {
    if(await networkInfoUseCase()){
      try {
        return getMovieRemote(id);
      } catch (e) {
        return getMovieLocal(id);
      }
    }else{
      return getMovieLocal(id);
    }
  }

  MovieBloc(
    {required this.searchMovieUseCase, 
    required this.getListMovieLocalUseCase, 
    required this.networkInfoUseCase} 
  );

  disponse() {
    movieController.close();
  }

}