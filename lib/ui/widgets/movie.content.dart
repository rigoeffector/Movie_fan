import 'package:film_fan/bloc/controllers/movies.recommendations_bloc.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/services/movie.api.provider.dart';
import 'package:film_fan/ui/widgets/genre.widget.dart';
import 'package:film_fan/ui/widgets/recommended.widget.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

class MovieContentWidget extends StatefulWidget {
  Result data;
  String id;
  MovieContentWidget(this.data, this.id);
  @override
  State<MovieContentWidget> createState() => _MovieContentWidgetState();
}

class _MovieContentWidgetState extends State<MovieContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (Stack(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: new NetworkImage(widget.data.poster_path))),
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              left: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: const Color.fromARGB(69, 0, 0, 0),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: const Color.fromARGB(83, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.data.title,
                          style: const TextStyle(
                            fontSize: 30,
                            color: kTxtColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.data.release_date,
                          style: const TextStyle(
                            fontSize: 18,
                            color: kTxtColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.data.vote_average.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: kTxtColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            // GenreWidget(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.data.overview.toString(),
            style: const TextStyle(
              color: kSTxtColor,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Recommended Movies",
                style: const TextStyle(
                    color: kTxtColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RecommendedWidget(widget.id)
      ],
    );
  }
}
