import 'package:flutter/cupertino.dart';

class MoviesRecommedationModel {
  late int id;
  late int page;

  late int total_page;
  late int total_results;

  List<Result> results = [];
  MoviesRecommedationModel.fromJson(Map<String, dynamic> parseJson) {
    page = parseJson['page'];

    total_page = parseJson['total_pages'];
    total_results = parseJson['total_results'];

    List<Result> temp = [];
    for (var i = 0; i < parseJson['results'].length; i++) {
      Result result = Result(parseJson['results'][i]);

      temp.add(result);
    }
    temp.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    results = temp;
  }
}

class Result {
  late dynamic id;
  late dynamic title;
  late dynamic release_date;
  late dynamic vote_average;
  late dynamic poster_path;
  late dynamic backdrop_path;
  late dynamic vote_count;
  late String overview;
  late double popularity;
  late bool adult;
  List<int> genre_ids = [];
  late bool video;
  Result(result) {
    vote_count = result['vote_count'];
    id = result['id'].toString();
    video = result['video'];
    video = result['video'];
    popularity = result['popularity'];
    backdrop_path = result['backdrop_path'];
    video = result['video'];
    title = result['title'].toString();
    vote_average = result['vote_average'];
    overview = result['overview'];
    poster_path = 'http://image.tmdb.org/t/p/w185/' + result['poster_path'];
    release_date = result['release_date'].toString();

    for (var i = 0; i < result['genre_ids'].length; i++) {
      genre_ids.add(result['genre_ids'][i]);
    }
  }
  String get _releaseDate => release_date;
  String get _posterPath => poster_path;
  String get _voteAverage => vote_average;
  String get _title => title;
  int get _id => id;
  String get _backdrop_path => backdrop_path;
  double get _popularity => popularity;
  List<int> get _genre_ids => genre_ids;
  String get _overview => overview;
  bool get _is_video => video;
}
