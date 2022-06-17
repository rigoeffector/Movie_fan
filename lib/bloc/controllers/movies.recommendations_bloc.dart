import 'package:film_fan/bloc/controllers/repository.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:rxdart/rxdart.dart';

class MoviesRecommendationBloc {
  late final String movieId;
  final respository = Repository();
  final movieRecommendationFetcher = PublishSubject<MovieModel>();
  Stream<MovieModel> get allRecommendationMovies =>
      movieRecommendationFetcher.stream;

  fetchAllRecommendationMovies(movieId) async {
    MovieModel movieRecModel =
        await respository.fetchRecommendationMovies(movieId);
    movieRecommendationFetcher.sink.add(movieRecModel);
  }

  dispose() {
    movieRecommendationFetcher.close();
  }
}

final blocRecommendation = MoviesRecommendationBloc();
