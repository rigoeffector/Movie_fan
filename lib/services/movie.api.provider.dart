import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../bloc/model/movies.model.dart';
import '../utils/constants.dart';

class MovieApiProvider {
  Client client = Client();

  Future<MovieModel> fetchMovieList() async {
    final response = await client.get(Uri.parse(
        '$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to laod movies list');
    }
  }
}
