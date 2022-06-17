import 'dart:developer';

import 'package:flutter/cupertino.dart';

class MovieModel {
  late int id;
  late int page;
  late int total_page;
  late int total_results;
  List<Result> results = [];
  MovieModel.fromJson(Map<String, dynamic> parseJson) {
    page = parseJson['page'];
    total_page = parseJson['total_pages'];
    total_results = parseJson['total_results'];

    List<Result> temp = [];
    for (var i = 0; i < parseJson['results'].length; i++) {
      Result result = Result(parseJson['results'][i]);

      temp.add(result);
    }
    debugger();
    temp.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    results = temp;
  }
}

class Result {
  dynamic id;
  dynamic title;
  dynamic release_date;
  dynamic vote_average;
  dynamic poster_path;

  Result(result) {
    id = result['id'].toString();
    title = result['title'].toString();
    vote_average = result['vote_average'];
    poster_path = 'http://image.tmdb.org/t/p/w185/' + result['poster_path'];
    release_date = result['release_date'].toString();
  }
  String get _releaseDate => release_date;
  String get _posterPath => poster_path;
  String get _voteAverage => vote_average;
  String get _title => title;
  int get _id => id;
}
