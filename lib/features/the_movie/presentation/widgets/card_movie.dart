import 'package:flutter/material.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/screens/detail_movie.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/widgets/image_movie.dart';
import 'package:prueba_peliculas/services/redirect_service.dart';
import 'package:prueba_peliculas/styles/styles/custom_theme.dart';
import 'package:prueba_peliculas/styles/styles/font_styles.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;
  const CardMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RedirectService.goTo(context, DetailMovieScreen(movieId: movie.id!,));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0,color: CustomTheme().colors.lightPurple),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: movie.backdropPath != null && movie.backdropPath!.isNotEmpty
              ? ImageMovie(imageUrl: movie.posterPath!)
              : Image.asset('assets/images/no_image.jpg'),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Text(
                    '${movie.title}',
                    textAlign: TextAlign.center,
                    style: FontStyles.subTitle(),
                  ),
                  const SizedBox(height: 4.0,),
                  Text(
                    '${movie.overview}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: FontStyles.texto(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}