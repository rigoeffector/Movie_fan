import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';

class GenreWidget extends StatefulWidget {
  String genres;
  GenreWidget(this.genres, {Key? key}) : super(key: key);

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 4,
      spacing: 4,
      children: [RowItems(), RowItems(), RowItems()],
    );
  }

  Widget RowItems() {
    return (Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              'SSSSSSS',
              style: TextStyle(color: kTxtColor),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        )
      ],
    ));
  }
}
