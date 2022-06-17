import 'package:film_fan/bloc/controllers/genres_bloc.dart';
import 'package:film_fan/bloc/controllers/movies_bloc.dart';
import 'package:film_fan/ui/widgets/movie.dart';
import 'package:flutter/material.dart';

import '../../bloc/model/movies.model.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  State<NowPlayingWidget> createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    bloc_genres.fetchAllGenreMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<MovieModel> snapshot) => snapshot.hasData
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: MovieWidget(snapshot),
            )
          : snapshot.hasError
              ? Center(
                  child: Text(snapshot.error.toString()),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
