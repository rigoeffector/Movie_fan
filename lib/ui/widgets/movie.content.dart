import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/services/movie.api.provider.dart';
import 'package:film_fan/ui/widgets/recommended.widget.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../cubit/rating/rating_cubit.dart';

class MovieContentWidget extends StatefulWidget {
  Result data;
  String id;

  MovieContentWidget(this.data, this.id);
  @override
  State<MovieContentWidget> createState() => _MovieContentWidgetState();
}

class _MovieContentWidgetState extends State<MovieContentWidget> {
  late double rates;
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
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black.withOpacity(0.6)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
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
                borderRadius: BorderRadius.circular(0),
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
                          widget.data.vote_average.toString() + '/ 10',
                          style: const TextStyle(
                            fontSize: 15,
                            color: kTxtColor,
                          ),
                        ),
                      ),
                    ),
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
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: kPrimaryColor,
                  width: MediaQuery.of(context).size.width / 3,
                  // height: 200,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.data.genre_ids.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          child: Container(
                              child: ListTile(
                            textColor: kTxtColor,
                            title: Text("Genre"),
                            subtitle: (Text(
                              widget.data.genre_ids[index].toString() == '28'
                                  ? 'Action'
                                  : widget.data.genre_ids[index].toString() ==
                                          '12'
                                      ? 'Adventure'
                                      : widget.data.genre_ids[index]
                                                  .toString() ==
                                              '16'
                                          ? 'Animation'
                                          : widget.data.genre_ids[index]
                                                      .toString() ==
                                                  '35'
                                              ? 'Comedy'
                                              : widget.data.genre_ids[index]
                                                          .toString() ==
                                                      '80'
                                                  ? 'Crime'
                                                  : widget.data.genre_ids[index]
                                                              .toString() ==
                                                          '99'
                                                      ? 'Documentary'
                                                      : widget.data.genre_ids[index]
                                                                  .toString() ==
                                                              '18'
                                                          ? 'Drama'
                                                          : widget.data.genre_ids[index]
                                                                      .toString() ==
                                                                  '10751'
                                                              ? 'Family'
                                                              : widget.data.genre_ids[index]
                                                                          .toString() ==
                                                                      '36'
                                                                  ? 'History'
                                                                  : widget.data.genre_ids[index]
                                                                              .toString() ==
                                                                          '14'
                                                                      ? 'Fantasy'
                                                                      : widget.data.genre_ids[index].toString() == '36'
                                                                          ? 'History'
                                                                          : widget.data.genre_ids[index].toString() == '27'
                                                                              ? 'Horror'
                                                                              : widget.data.genre_ids[index].toString() == '10402'
                                                                                  ? 'Music'
                                                                                  : widget.data.genre_ids[index].toString() == '9648'
                                                                                      ? 'Mystery'
                                                                                      : widget.data.genre_ids[index].toString() == '10749'
                                                                                          ? 'Romance'
                                                                                          : widget.data.genre_ids[index].toString() == '878'
                                                                                              ? 'Science Fiction'
                                                                                              : widget.data.genre_ids[index].toString() == '10770'
                                                                                                  ? 'TV Movie'
                                                                                                  : widget.data.genre_ids[index].toString() == '53'
                                                                                                      ? 'Thriller'
                                                                                                      : widget.data.genre_ids[index].toString() == '10752'
                                                                                                          ? 'War'
                                                                                                          : widget.data.genre_ids[index].toString() == '37'
                                                                                                              ? 'Western'
                                                                                                              : '',
                              style: TextStyle(fontSize: 10),
                            )),
                          )),
                        );
                      }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Rate the movie",
                          style: TextStyle(
                              color: kTxtColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rates = rating;
                            });
                            print(rating);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<RatingCubit>(context)
                                  .addRating(widget.data.id, rates.toString());
                            },
                            child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: kTxtColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    'Rate',
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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

        // RatingStars(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Similar Movies",
                style: TextStyle(
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
