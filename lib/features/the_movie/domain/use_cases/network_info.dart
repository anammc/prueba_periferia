
import 'package:prueba_peliculas/features/the_movie/domain/repositories/movie_repository.dart';

class NetworkInfoUseCase{
  final MovieRepository repository;

  NetworkInfoUseCase({required this.repository});

  Future<bool> call(){
    return repository.isConnected();
  }
}