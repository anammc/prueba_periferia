import 'package:flutter/material.dart';
import 'package:prueba_peliculas/features/the_movie/presentation/widgets/image_movie.dart';
import 'package:prueba_peliculas/styles/styles/custom_theme.dart';
import 'package:prueba_peliculas/styles/styles/font_styles.dart';

class CardInfo extends StatelessWidget {
  final String cardTitle;
  final String cardVoting;
  final String cardDescripcion;
  final String cardImage;
  final String cardDate;
  final String cardPopularity;

  const CardInfo({super.key, required this.cardTitle, required this.cardDescripcion, required this.cardImage, required this.cardVoting, required this.cardDate, required this.cardPopularity});

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            ImageMovie(imageUrl: cardImage),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              cardTitle,
              style: FontStyles.title(colorText: CustomTheme().colors.darkPurple),
            ),
             const SizedBox(
              height: 8.0,
            ),
            Text(
              cardDate,
              style: FontStyles.subTitle(colorText: CustomTheme().colors.lightPurple),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              cardDescripcion,
              style: FontStyles.texto(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Popularidad: $cardPopularity',
              style: FontStyles.texto(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
             'Votación: $cardVoting',
              style: FontStyles.texto(),
            ),
          ],
        );
  }
}