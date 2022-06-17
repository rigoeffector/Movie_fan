import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

class MovieWidget extends StatefulWidget {
  AsyncSnapshot<MovieModel> asyncSnapshot;
  MovieWidget(this.asyncSnapshot, {Key? key}) : super(key: key);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.asyncSnapshot.data!.results.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              print("object");
            },
            child: (Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 250,
                      height: 300,
                      child: Image.network(
                        widget.asyncSnapshot.data!.results[index].poster_path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 250,
                      height: 300,
                      color: const Color.fromARGB(69, 0, 0, 0),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 250,
                    height: 300,
                    color: const Color.fromARGB(83, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              widget.asyncSnapshot.data!.results[index].title
                                  .toString(),
                              style: const TextStyle(
                                  color: kTxtColor, fontSize: 18),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              widget.asyncSnapshot.data!.results[index]
                                  .release_date
                                  .toString(),
                              style: const TextStyle(
                                  color: kTxtColor, fontSize: 12),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              widget.asyncSnapshot.data!.results[index]
                                  .vote_average
                                  .toString(),
                              style: const TextStyle(
                                  color: kTxtColor, fontSize: 12),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
