// To parse this JSON data, do
//
//     final movieListResponse = movieListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:myflix/src/features/data.dart';

class MovieListResponse {
    final int? page;
    final List<MovieResponse>? results;
    final int? totalPages;
    final int? totalResults;

    MovieListResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory MovieListResponse.fromRawJson(String str) => MovieListResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieListResponse.fromJson(Map<String, dynamic> json) => MovieListResponse(
        page: json["page"],
        results: json["results"] == null ? [] : List<MovieResponse>.from(json["results"]!.map((x) => MovieResponse.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}