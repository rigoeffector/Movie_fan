import 'package:film_fan/bloc/controllers/movies_bloc.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/ui/widgets/now.playing.widget.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          NowPlayingWidget()
        ],
      ),
    );
  }
}
