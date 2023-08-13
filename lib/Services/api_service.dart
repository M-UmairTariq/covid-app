import 'dart:convert';
import 'package:covid_app/Model/CovidModel.dart';
import 'package:http/http.dart' as http;

class AppApi {
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';
  static const String worldStatsUrl = 'https://disease.sh/v3/covid-19/all';
  static const String countriesStatsUrl =
      'https://disease.sh/v3/covid-19/countries';

  Future<CovidModel> getAllData() async {
    try {
      final response = await http.get(Uri.parse(worldStatsUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CovidModel.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('An error occurred');
    }
  }

  Future<List<dynamic>> getCountriesData() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    try {
      final response = await http.get(Uri.parse(countriesStatsUrl));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('An error occurred');
    }
  }
}
