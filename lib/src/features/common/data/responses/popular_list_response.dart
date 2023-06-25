// To parse this JSON data, do
//
//     final popularListResponse = popularListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:myflix/src/features/data.dart';

class PopularListResponse {
    final int? page;
    final List<MovieResponse>? results;
    final int? totalPages;
    final int? totalResults;

    PopularListResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory PopularListResponse.fromRawJson(String str) => PopularListResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PopularListResponse.fromJson(Map<String, dynamic> json) => PopularListResponse(
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