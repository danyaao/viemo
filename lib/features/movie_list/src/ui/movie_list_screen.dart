import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:viemo/component_library/component_library.dart';
import 'package:viemo/domain_models/domain_models.dart';
import 'package:viemo/features/movie_list/src/bloc/movie_list_bloc.dart';
import 'package:viemo/features/movie_list/src/ui/movie_paged_list_view.dart';
import 'package:viemo/movie_repository/movie_repository.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({
    required this.movieRepository,
    super.key,
  });

  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieListBloc>(
      create: (_) => MovieListBloc(
        movieRepository: movieRepository,
      ),
      child: const MovieListWidget(),
    );
  }
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final TextEditingController _searchBarController = TextEditingController();

  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  MovieListBloc get _bloc => context.read<MovieListBloc>();

  @override
  void initState() {
    super.initState();
    _searchBarController.addListener(
      () {
        _bloc.add(
          MovieListSearchTermChanged(
            _searchBarController.text,
          ),
        );
      },
    );

    _pagingController.addPageRequestListener(
      (pageKey) {
        final isSubsequentPage = pageKey > 1;
        if (isSubsequentPage) {
          _bloc.add(
            MovieListNextPageRequested(
              pageKey: pageKey,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return BlocListener<MovieListBloc, MovieListState>(
      listener: (context, state) {
        final searchBarText = _searchBarController.text;
        final isSearching =
            state.filter != null && state.filter is MovieListFilterBySearchTerm;
        if (searchBarText.isNotEmpty && !isSearching) {
          _searchBarController.text = '';
        }
        _pagingController.value = state.toPagingState();
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SearchBar(
                  controller: _searchBarController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      _bloc.add(
                        const MovieListRefreshed(),
                      );

                      final stateChangeFuture = _bloc.stream.first;
                      return stateChangeFuture;
                    },
                    child: MoviePagedListView(
                      pagingController: _pagingController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on MovieListState {
  PagingState<int, Movie> toPagingState() {
    return PagingState(
      itemList: itemList,
      nextPageKey: nextPage,
      error: error,
    );
  }
}
