import 'dart:convert';

import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiFilmes 
{
  static const _urlTrending = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _urlTopRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _urlUpcoming = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _urlSearch = 'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}';

  Future<List<Films>> getTrendingFilmes() async 
  {
    final response = await http.get(Uri.parse(_urlTrending));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((filme) => Films.fromJson(filme)).toList();
    }
    else
    {
      throw Exception('Ocorreu um erro com a API');
    }
  }

  Future<List<Films>> getTopRatedFilmes() async 
  {
    final response = await http.get(Uri.parse(_urlTopRated));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((filme) => Films.fromJson(filme)).toList();
    }
    else
    {
      throw Exception('Ocorreu um erro com a API');
    }
  }

  Future<List<Films>> getUpcomingFilmes() async 
  {
    final response = await http.get(Uri.parse(_urlUpcoming));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((filme) => Films.fromJson(filme)).toList();
    }
    else
    {
      throw Exception('Ocorreu um erro com a API');
    }
  }

  static Future<List<Films>> searchFilme(String query) async 
  {
    final response = await http.get(Uri.parse("$_urlSearch&query='${Uri.encodeComponent(query)}'"));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      List<Films> filmes = decodedData.map((filme) => Films.fromJson(filme)).toList();

      filmes.sort(
        (a,b){
          int anoComparacao = b.dataLancamento.compareTo(a.dataLancamento);
          if (anoComparacao != 0) return anoComparacao;
          return a.titulo.compareTo(b.titulo);
        }
      );

      return filmes;
    }
    else
    {
      throw Exception('Ocorreu um erro com a API');
    }
  }
}
