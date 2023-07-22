import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:viemo/domain_models/domain_models.dart';

import '../../../../component_library/component_library.dart';

class MoviePagedListView extends StatelessWidget {
  const MoviePagedListView({
    required this.pagingController,
    super.key,
  });

  final PagingController<int, Movie> pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, movie, index) {
        return MovieListViewCard(
          movie: movie,
        );
      }),
    );
  }
}
