import 'package:film_fan/bloc/controllers/repository.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final respository = Repository();
  final movieFetcher = PublishSubject<MovieModel>();
  Stream<MovieModel> get allMovies => movieFetcher.stream;

  fetchAllMovies() async {
    MovieModel movieModel = await respository.fetchMovies();
    movieFetcher.sink.add(movieModel);
  }

  dispose() {
    movieFetcher.close();
  }
}

final bloc = MoviesBloc();
