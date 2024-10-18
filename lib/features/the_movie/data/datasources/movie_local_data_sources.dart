import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_peliculas/core/error/features.dart';
import 'package:prueba_peliculas/features/the_movie/data/models/movie_list_model.dart';
import 'package:prueba_peliculas/features/the_movie/domain/entities/movie_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSources{
  Future<bool> saveMovies(MovieList movies);
  Future<MovieList> getMoviesList();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSources{
  
  final String movieListKey = 'movieList';

  @override
  Future<bool> saveMovies(MovieList movies) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      final movieListModel = MovieListModel.fromEntity(movies);
      final movieJson = json.encode(movieListModel.toJson());
      await prefs.setString(movieListKey, movieJson);
      return true;
    }catch(error){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }
  
  @override
  Future<MovieList> getMoviesList() async {
     try{
      final prefs = await SharedPreferences.getInstance();
      final movieJson  = prefs.getString(movieListKey);
      if (movieJson != null) {
        final List<dynamic> jsonList = json.decode(movieJson)['movies'];
        final movieListModel = MovieListModel.fromJson(jsonList);
        return MovieList(movies: movieListModel.movies);
      } else {
        return MovieList(movies: []);
      }
    }catch(error){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }  
}