import 'package:film_fan/bloc/controllers/repository.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:rxdart/rxdart.dart';

class MoviesRecommendationBloc {
  late final String movieId;
  final respository = Repository();
  final movieSimilarFetcher = PublishSubject<MovieModel>();
  Stream<MovieModel> get allRecommendationMovies => movieSimilarFetcher.stream;

  fetchAllRecommendationMovies(movieId) async {
    MovieModel movieRecModel =
        await respository.fetchRecommendationMovies(movieId);
    movieSimilarFetcher.sink.add(movieRecModel);
  }

  dispose() {
    movieSimilarFetcher.close();
  }
}

final bloc_similar = MoviesRecommendationBloc();
