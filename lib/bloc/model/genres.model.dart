import 'package:flutter/material.dart';

class Genres {
  final String id;
  final String name;
  final String image;
  final Color color;
  Genres({
    required this.color,
    required this.image,
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(json) {
    return Genres(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'].toString(),
      color: json['color'],
    );
  }
}

class GenresList {
  final List<Genres> list;
  GenresList({
    required this.list,
  });
  factory GenresList.fromJson(json) {
    return GenresList(
        list: (json as List).map((genre) => Genres.fromJson(genre)).toList());
  }
}

final genreslist = [
  {
    "id": 28,
    "name": "Action",
  },
  {
    "id": 12,
    "name": "Adventure",
  },
  {
    "id": 16,
    "name": "Animation",
  },
  {
    "id": 35,
    "name": "Comedy",
  },
  {
    "id": 80,
    "name": "Crime",
  },
  {
    "id": 99,
    "name": "Documentary",
  },
  {
    "id": 18,
    "name": "Drama",
  },
  {
    "id": 10751,
    "name": "Family",
  },
  {
    "id": 14,
    "name": "Fantasy",
  },
  {
    "id": 36,
    "name": "History",
  },
  {
    "id": 27,
    "name": "Horror",
  },
  {
    "id": 10402,
    "name": "Music",
  },
  {
    "id": 9648,
    "name": "Mystery",
  },
  {
    "id": 10749,
    "name": "Romance",
  },
  {
    "id": 878,
    "name": "Science Fiction",
  },
  {
    "id": 10770,
    "name": "TV Movie",
  },
  {
    "id": 53,
    "name": "Thriller",
  },
  {
    "id": 10752,
    "name": "War",
  },
  {
    "id": 37,
    "name": "Western",
  },
];
