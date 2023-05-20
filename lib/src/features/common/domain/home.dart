import 'package:collection/collection.dart';

class Home {
  final HeaderMovie headerMovie;
  final List<MovieListItem> movieListItems;
  Home({
    required this.headerMovie,
    required this.movieListItems,
  });
}

class HeaderMovie {
  final String imageUrl;
  final String title;
  final List<String> categories;
  final double match;
  final double minutes;

  HeaderMovie({
    required this.imageUrl,
    required this.title,
    required this.categories,
    required this.match,
    required this.minutes,
  });

  String get getStrCategories {
    String category = '';
    categories.forEachIndexed((index, element) {
      if (index == categories.length - 1) {
        category += ' $element';
      } else {
        category += ' $element,';
      }
    });
    return category;
  }
}

class MovieListItem {
  final String title;
  final List<MovieItem> movieItems;
  MovieListItem({
    required this.title,
    required this.movieItems,
  });
}

class MovieItem {
  final String image;
  MovieItem({
    required this.image,
  });
}

final dummyHome = Home(
  headerMovie: dummyHeaderMovies,
  movieListItems: [
    MovieListItem(
      title: 'Trend',
      movieItems: [
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
      ],
    ),
    MovieListItem(
      title: 'Movies',
      movieItems: [
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
        dummyMovieItem,
      ],
    ),
  ],
);

final dummyHeaderMovies = HeaderMovie(
  imageUrl: dummyImageUrl,
  title: 'Avengers: Endgame',
  categories: ['Action', 'Scifi'],
  match: 96,
  minutes: 89,
);

final dummyMovieItem = MovieItem(
  image: dummyImageUrl,
);

const dummyImageUrl =
    'https://www.mainmain.id/uploads/post/2019/03/17/Avengers-Endgame-Poster.jpg';
