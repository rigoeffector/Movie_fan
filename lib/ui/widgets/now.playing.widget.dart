import 'package:film_fan/bloc/controllers/movies_bloc.dart';
import 'package:film_fan/services/movie.api.provider.dart';
import 'package:film_fan/ui/widgets/movie.dart';
import 'package:flutter/material.dart';

import '../../bloc/model/movies.model.dart';

class NowPlayingWidget extends StatefulWidget {
  MovieApiProvider movieApiProvider;
  NowPlayingWidget(this.movieApiProvider, {Key? key}) : super(key: key);

  @override
  State<NowPlayingWidget> createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<MovieModel> snapshot) => snapshot.hasData
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: MovieWidget(snapshot, widget.movieApiProvider),
            )
          : snapshot.hasError
              ? Center(
                  child: Text(snapshot.error.toString()),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
