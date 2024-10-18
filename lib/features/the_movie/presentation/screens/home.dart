import 'package:flutter/material.dart';
import 'package:prueba_peliculas/di.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/blocs/list_movie_bloc.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/widgets/card_movie.dart';
import 'package:prueba_peliculas/styles/styles/custom_theme.dart';
import 'package:prueba_peliculas/styles/styles/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme().colors.darkPurple,
        title: Text(
          'Peliculas populares',
          style: FontStyles.title(colorText: CustomTheme().colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: StreamBuilder<MovieList?>(
            stream: sl.get<ListMovieBloc>().listMovieController,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                itemCount: snapshot.data!.movies!.length,
                itemBuilder: (context, index) {
                  return CardMovie(movie: snapshot.data!.movies![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8.0,
                  );
                },
              );
            }),
      ),
    );
  }
}
