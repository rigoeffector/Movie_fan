import 'package:film_fan/bloc/controllers/movies.similar.dart';
import 'package:film_fan/bloc/model/movies.model.dart';
import 'package:film_fan/cubit/rating/rating_cubit.dart';
import 'package:film_fan/ui/widgets/movie.content.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  Result data;
  MovieDetailScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    bloc_similar.fetchAllRecommendationMovies(widget.data.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text('Movie Detail'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Adding to favorite",
            iconColor: kPrimaryColor,
            bubbleColor: kTxtColor,
            icon: Icons.favorite,
            titleStyle: TextStyle(fontSize: 16, color: kPrimaryColor),
            onPress: () {
              _animationController.reverse();
            },
          ),
        ],

        animation: _animation,
        onPress: () => {
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
        },
        iconColor: kPrimaryColor,
        iconData: Icons.add,
        backGroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
          child: MovieContentWidget(widget.data, widget.data.id)),
    );
  }
}
