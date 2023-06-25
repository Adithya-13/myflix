import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/application.dart';
import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

final dummyDetailMovie = [
  dummyMovie.copyWith(id: 1),
  dummyMovie.copyWith(id: 2),
  dummyMovie.copyWith(id: 3),
  dummyMovie.copyWith(id: 4),
  dummyMovie.copyWith(id: 5),
  dummyMovie.copyWith(id: 6),
  dummyMovie.copyWith(id: 7),
  dummyMovie.copyWith(id: 8),
  dummyMovie.copyWith(id: 9),
  dummyMovie.copyWith(id: 10),
  dummyMovie.copyWith(id: 11),
  dummyMovie.copyWith(id: 12),
  dummyMovie.copyWith(id: 13),
  dummyMovie.copyWith(id: 14),
  dummyMovie.copyWith(id: 15),
  dummyMovie.copyWith(id: 16),
  dummyMovie.copyWith(id: 17),
];

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(this._commonRepository);

  Future<Result<Home>> fetchHome() async {
    final resultMovies = await _commonRepository.fetchMovies();
    final resultTopRated = await _commonRepository.fetchTopRated();
    return CommonMapper.mapToHome(resultMovies, resultTopRated);
  }

  Future<Result<Movie>> getMovieById(int id) async {
    final result = await _commonRepository.fetchDetail(id);
    return CommonMapper.mapToMovieDetail(result);
  }

  Future<Result<List<Movie>>> getMovieList() async {
    final result = await _commonRepository.fetchMovies();
    return CommonMapper.mapToMovieList(result);
  }

  Future<Result<Popular>> getPopular(int page) async {
    final result = await _commonRepository.fetchPopular(page);
    return CommonMapper.mapToPopular(result);
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  return CommonService(commonRepository);
});
