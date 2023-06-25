import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/services/services.dart';

class CommonRepository {
  final DioClientTmdb _dioClientTmdb;
  CommonRepository(this._dioClientTmdb);

  Future<Result<MovieListResponse>> fetchMovies() async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.movie);

      return Result.success(MovieListResponse.fromJson(result));
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<TopRatedListResponse>> fetchTopRated() async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.topRated);

      return Result.success(TopRatedListResponse.fromJson(result));
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<MovieDetailResponse>> fetchDetail(int id) async {
    try {
      final result = await _dioClientTmdb.get('${Endpoint.movieDetail}/$id');

      return Result.success(MovieDetailResponse.fromJson(result));
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<PopularListResponse>> fetchPopular(int page) async {
    try {
      final result = await _dioClientTmdb.get(
        Endpoint.popular,
        queryParameters: {
          'page': page,
        },
      );

      return Result.success(PopularListResponse.fromJson(result));
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository(ref.read(dioClientTmdbProvider));
});
