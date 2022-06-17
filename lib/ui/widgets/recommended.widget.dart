import 'dart:ui';

import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/ui/widgets/recommend.card.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../bloc/controllers/movies.similar.dart';

class RecommendedWidget extends StatefulWidget {
  String movieId;
  RecommendedWidget(this.movieId, {Key? key}) : super(key: key);

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    bloc_similar.fetchAllRecommendationMovies(widget.movieId);
    return StreamBuilder(
      stream: bloc_similar.allRecommendationMovies,
      builder: (context, snapshot) => snapshot.hasData
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: RecommendCard(snapshot),
            )
          : snapshot.hasError
              ? Center(
                  child: Text(snapshot.error.toString()),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
