import 'package:film_fan/bloc/controllers/genres_bloc.dart';
import 'package:film_fan/bloc/controllers/movies.similar.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/ui/widgets/movie.content.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  Result data;
  MovieDetailScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    bloc_similar.fetchAllRecommendationMovies(widget.data.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: SingleChildScrollView(
          child: MovieContentWidget(widget.data, widget.data.id)),
    );
  }
}
