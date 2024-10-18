import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/get_list_movie.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/get_list_movie_local.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/network_info.dart';
import 'package:prueba_peliculas/features/the_movie/domain/use_cases/save_list_movie.dart';
import 'package:rxdart/rxdart.dart';

class ListMovieBloc {
  BehaviorSubject<MovieList> listMovieController =
      BehaviorSubject<MovieList>();
  Stream<MovieList?> get listMovieStream => listMovieController.stream;
  final GetListMovieUseCase getListMovieUseCase;
  final GetListMovieLocalUseCase getListMovieLocalUseCase;
  final NetworkInfoUseCase networkInfoUseCase;
  final SaveListMovieUseCase saveListMovieUseCase;

  getInitListMovie() async {
    final result = await getListMovieUseCase();
    result.fold(
      (error) {
        if (error is ServerFailure) {
          print('Error del servidor: ${error.message}');
        } else if (error is LocalFailure) {
          print('Error local: ${error.message}');
        }
      },
      (data) {
        listMovieController.sink.add(data);
        saveListMovieUseCase(data);
      },
    );
    
  }

  getInitListMovieLocal() async {
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
        listMovieController.sink.add(data);
      },
    );
    
  }

  validateConnection() async {
    if(await networkInfoUseCase()){
      try {
        return getInitListMovie();
      } catch (e) {
        return getInitListMovieLocal();
      }
    }else{
      return getInitListMovieLocal();
    }
  }

  ListMovieBloc (
    {required this.getListMovieUseCase,
    required this.getListMovieLocalUseCase,
    required this.networkInfoUseCase,
    required this.saveListMovieUseCase
    }
    ) {
    validateConnection();
  }

  disponse() {
    listMovieController.close();
  }
}