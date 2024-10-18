import 'package:dio/dio.dart';
import 'package:prueba_peliculas/features/the_movie/data/models/movie_list_model.dart';
import 'package:prueba_peliculas/features/the_movie/data/models/movie_model.dart';

abstract class MovieRemoteDataSources{
  Future<MovieModel> getMovie(int id);
  Future<MovieListModel> getMovieList();
}

class MovieRemoteDataSourcesImp implements MovieRemoteDataSources {

  final Dio dio = Dio();
  @override
  Future<MovieListModel> getMovieList() async {
    dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZmM5ZTUwZGI0NmE0OTZjODU1MThlYWNmZDEzMTk0ZSIsIm5iZiI6MTcyODgzNDM5OS44NTI5OTMsInN1YiI6IjYxMjFiZDhlZDRiOWQ5MDA3YzUyMGJkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qC-UWtYN-USeK45ympVJjI-f9jdPfw8ObOB5DTQs8ag';
    final resp = await dio.get('https://api.themoviedb.org/3/movie/popular');
    return MovieListModel.fromJson(resp.data['results']);
  }

  @override
  Future<MovieModel> getMovie(int id) async {
     dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZmM5ZTUwZGI0NmE0OTZjODU1MThlYWNmZDEzMTk0ZSIsIm5iZiI6MTcyODgzNDM5OS44NTI5OTMsInN1YiI6IjYxMjFiZDhlZDRiOWQ5MDA3YzUyMGJkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qC-UWtYN-USeK45ympVJjI-f9jdPfw8ObOB5DTQs8ag';
    final resp = await dio.get('https://api.themoviedb.org/3/movie/$id');
    return MovieModel.fromJson(resp.data);
  }
}