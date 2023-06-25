import 'package:myflix/src/features/domain.dart';

class Popular {
  final int totalPages;
  final List<Movie> popularList;

  Popular(this.totalPages, this.popularList);
}
