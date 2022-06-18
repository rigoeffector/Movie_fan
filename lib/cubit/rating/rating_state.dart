import 'package:flutter/cupertino.dart';

class RatingState {}

class RatingInital extends RatingState {}

class RatingLoading extends RatingState {}

class RatingSucces extends RatingState {
  final String message;

  RatingSucces(this.message);
}

class RatingError extends RatingState {
  final String error;

  RatingError(this.error);
}
