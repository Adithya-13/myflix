// To parse this JSON data, do
//
//     final topRatedListResponse = topRatedListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:myflix/src/features/data.dart';

class TopRatedListResponse {
  final int? page;
  final List<MovieResponse>? results;
  final int? totalPages;
  final int? totalResults;

  TopRatedListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TopRatedListResponse.fromRawJson(String str) =>
      TopRatedListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopRatedListResponse.fromJson(Map<String, dynamic> json) =>
      TopRatedListResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieResponse>.from(
                json["results"]!.map((x) => MovieResponse.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
