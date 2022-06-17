import 'dart:convert';
import 'package:film_fan/bloc/model/genres.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;

import '../bloc/model/movies.model.dart';
import '../utils/constants.dart';

class MovieApiProvider {
  Client client = Client();
  late String movieId;

  Future<MovieModel> fetchMovieList() async {
    final response = await client.get(Uri.parse(
        '$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies list');
    }
  }

  Future<MovieModel> fetchRecommendationMovieList(movieId) async {
    final response = await client
        .get(Uri.parse('$baseUrl/$movieId/similar?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load similar movies list');
    }
  }

  Future<GenreModel> fetchMovieGenreList() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US'));
    print('Movies Genres' + response.body);
    if (response.statusCode == 200) {
      return GenreModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie genre list');
    }
  }
}
