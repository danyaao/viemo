import 'package:flutter/material.dart';
import 'package:viemo/domain_models/domain_models.dart';

class MovieListViewCard extends StatelessWidget {
  const MovieListViewCard({
    required this.movie,
    this.onTap,
    super.key,
  });

  final Movie movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 150,
              child: Image.network(movie.poster.url),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title),
                  Row(
                    children: [
                      Text(movie.alternativeName),
                      const SizedBox(width: 10),
                      Text(movie.year.toString()),
                    ],
                  ),
                  Text(movie.genres.join(', ')),
                  Row(
                    children: [
                      Text(movie.rating.kpRating.toStringAsFixed(1)),

                      Text(movie.countries.join(', ')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
