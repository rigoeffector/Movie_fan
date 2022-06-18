import 'dart:convert';
import 'dart:developer';
import 'package:film_fan/bloc/model/genres.model.dart';
import 'package:film_fan/bloc/model/rating.dart';
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

  Future<Rating> addRatingMovie(movieId, value) async {
    debugger();
    final response = await client.post(
        Uri.parse(
            '$baseUrl/$movieId/rating?api_key=$apiKey&language=en-US&guest_session_id=$session'),
        headers: {"Content-type": "application/json;charset=utf-8"},
        body: json.encode({"value": double.parse(value)}));
    print('Movies rating' + response.body);

    if (response.statusCode == 200) {
      return Rating.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to rate this movie ');
    }
  }

  Future<MovieModel> getGenreMovieList(int genreId) async {
    try {
      final response = await client.get(Uri.parse('$gnrUrl/?api_key=$apiKey'));
      if (response.statusCode == 200) {
        return MovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load genre movies list');
      }
    } catch (e) {
      throw e;
    }
  }
}
