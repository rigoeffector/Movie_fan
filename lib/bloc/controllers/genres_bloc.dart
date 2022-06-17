import 'package:film_fan/bloc/controllers/repository.dart';
import 'package:film_fan/bloc/model/genres.model.dart';
import 'package:rxdart/rxdart.dart';

class GenreBloc {
  final respository = Repository();
  final movieGenreFetcher = PublishSubject<GenreModel>();
  Stream<GenreModel> get allGenresMovie => movieGenreFetcher.stream;

  fetchAllGenreMovies() async {
    GenreModel movieGenreModel = await respository.fetchGenreMovies();
    movieGenreFetcher.sink.add(movieGenreModel);
  }

  dispose() {
    movieGenreFetcher.close();
  }
}

final bloc_genres = GenreBloc();
