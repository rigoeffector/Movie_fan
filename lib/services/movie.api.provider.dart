import 'dart:convert';
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
    final response = await client.get(Uri.parse(
        '$baseUrl/$movieId/recommendations?api_key=$apiKey&language=en-US&page=1'));
    if (response.statusCode == 200) {
      print('Movies' + response.body);
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load recommendation movies list');
    }
  }
}
