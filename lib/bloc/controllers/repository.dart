import 'package:film_fan/bloc/model/genres.model.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/bloc/model/rating.dart';
import 'package:film_fan/services/movie.api.provider.dart';

class Repository {
  final movieapiprovider = MovieApiProvider();
  var value;
  var movieId;
  Future<MovieModel> fetchMovies() => movieapiprovider.fetchMovieList();

  Future<MovieModel> fetchRecommendationMovies(movieId) =>
      movieapiprovider.fetchRecommendationMovieList(movieId);

  Future<Rating> addRating() => movieapiprovider.addRatingMovie(movieId, value);
}
