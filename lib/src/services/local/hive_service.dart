import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/remote/remote.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class HiveService {
  /// [TODO]
  /// all business logic in hive
  final userBox = Hive.box<String>(HiveKey.userBox);
  final favoriteMoviesBox = Hive.box<String>(HiveKey.favoriteMoviesBox);

  User? getUser() {
    try {
      final hiveJson = userBox.get(HiveKey.user);
      if (hiveJson.isNullOrEmpty()) return null;

      final userJson = jsonDecode(hiveJson!);
      return User.fromJson(userJson);
    } catch (error, st) {
      log(error.toString(), error: error, stackTrace: st);
      return null;
    }
  }

  void saveUser(User user) {
    final userJson = user.toJson();
    final hiveJson = jsonEncode(userJson);
    userBox.put(HiveKey.user, hiveJson);
  }

  void logout() {
    userBox.delete(HiveKey.user);
  }

  Future<void> saveFavoriteMovie(Movie movie) async {
    debugPrint(movie.id.toString());
    final movieJson = movie.toJson();
    return await favoriteMoviesBox.put(movie.id, movieJson);
  }

  Future deleteFavoriteMovie(int movieId) async {
    debugPrint(movieId.toString());
    await favoriteMoviesBox.delete(movieId);
  }

  bool isMovieFavorite(int movieId) {
    debugPrint(movieId.toString());
    return favoriteMoviesBox.containsKey(movieId);
  }

  Result<List<Movie>> getAllFavoriteMovies() {
    try {
      return Result.success(
        (favoriteMoviesBox.values).map<Movie>((item) {
          return Movie.fromJson(item);
        }).toList(),
      );
    } catch (e, st) {
      debugPrint(e.toString());
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
