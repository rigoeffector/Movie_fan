import 'dart:developer';

import 'package:film_fan/services/movie.api.provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:film_fan/cubit/rating/rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final MovieApiProvider movieApiProvider;
  RatingCubit(this.movieApiProvider) : super(RatingState());

  void addRating(String movieId, String value) {
    if (movieId.isEmpty || value.isEmpty) {
      emit(RatingError('Invali rating value'));
      return;
    } else {
      movieApiProvider
          .addRatingMovie(movieId, value)
          .then((value) => emit(RatingSucces('Successfully added')))
          .catchError((e) => RatingError('Something went wrong'));
    }
  }
}
