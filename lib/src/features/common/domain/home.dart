import 'package:myflix/src/features/domain.dart';

class Home {
  final Movie headerMovie;
  final List<MovieListItem> movieListItems;
  Home({
    required this.headerMovie,
    required this.movieListItems,
  });
}

class MovieListItem {
  final String title;
  final List<Movie> movieItems;
  MovieListItem({
    required this.title,
    required this.movieItems,
  });
}

final dummyHome = Home(
  headerMovie: dummyMovie,
  movieListItems: [
    MovieListItem(
      title: 'Trend',
      movieItems: [
        dummyMovie.copyWith(id: 2),
        dummyMovie.copyWith(id: 3),
        dummyMovie.copyWith(id: 4),
        dummyMovie.copyWith(id: 5),
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovie.copyWith(id: 6),
        dummyMovie.copyWith(id: 7),
        dummyMovie.copyWith(id: 8),
        dummyMovie.copyWith(id: 9),
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovie.copyWith(id: 10),
        dummyMovie.copyWith(id: 11),
        dummyMovie.copyWith(id: 12),
        dummyMovie.copyWith(id: 13),
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovie.copyWith(id: 14),
        dummyMovie.copyWith(id: 15),
        dummyMovie.copyWith(id: 16),
        dummyMovie.copyWith(id: 17),
      ],
    ),
  ],
);

const dummyVideoUrl =
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4';

const dummyImageUrl =
    'https://www.mainmain.id/uploads/post/2019/03/17/Avengers-Endgame-Poster.jpg';
