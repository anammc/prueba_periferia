import 'package:flutter/material.dart';
import 'package:prueba_peliculas/di.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/blocs/movie_bloc.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/widgets/card_info.dart';
import 'package:prueba_peliculas/services/redirect_service.dart';
import 'package:prueba_peliculas/styles/styles/custom_theme.dart';

class DetailMovieScreen extends StatelessWidget {
  final int movieId;
  DetailMovieScreen({super.key, required this.movieId}){
    bloc.getMovie(movieId);
  }

  final bloc = sl.get<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme().colors.darkPurple, 
        leading: InkWell(
          onTap: (){
            RedirectService.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 25.0,color: CustomTheme().colors.white,),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: StreamBuilder<Movie?>(
          stream: bloc.movieController,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return  const Center(child: CircularProgressIndicator());
            }
            return CardInfo(
              cardTitle: snapshot.data!.title!,
              cardDate: snapshot.data!.releaseDate!,
              cardDescripcion: snapshot.data!.overview!,
              cardImage: snapshot.data!.posterPath!,
              cardPopularity:  snapshot.data!.popularity!.toString(),
              cardVoting: snapshot.data!.voteCount!.toString(),
              );
          }
        ),
      ),
    );
  }
}