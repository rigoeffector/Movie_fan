import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/services/movie.api.provider.dart';

class Repository {
  final movieapiprovider = MovieApiProvider();
  Future<MovieModel> fetchMovies() => movieapiprovider.fetchMovieList();

  Future<MovieModel> fetchRecommendationMovies(movieId) =>
      movieapiprovider.fetchRecommendationMovieList(movieId);
}
