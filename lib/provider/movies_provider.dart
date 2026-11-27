import 'dart:convert';

import 'package:app_peliculas/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = '2136248d54a84c6f12f8956d99ac2ace';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};
  
  MoviesProvider(){
    print('MoviesProvider se esta inicializando');

    getNowPlayingMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int? page = 1]) async {

    //https://api.themoviedb.org/3/movie/now_playing?api_key=2136248d54a84c6f12f8956d99ac2ace&language=ES&page=1
    var url = Uri.http(_baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page'
    });

    final response = await http.get(url);
    print(response.body);
    return response.body;
  }

  void getNowPlayingMovies() async{

    print('getNowPlayingMovies se esta ejecutando');
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    nowPlayingMovies = nowPlayingResponse.movie;
    notifyListeners();
  }

  void getPopularMovies() async{
    
    print('getPopularMovies se esta ejecutando');
    final jsonData = await _getJsonData('/3/movie/popular', 1);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = popularResponse.movie;
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async{

    if( movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;

  }

}