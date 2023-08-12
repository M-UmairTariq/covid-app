import 'dart:convert';
import 'package:covid_app/Model/CovidModel.dart';
import 'package:http/http.dart' as http;

class AppApi {
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';
  static const String worldStatsUrl = baseUrl + 'all';
  static const String countriesStatsUrl = baseUrl + 'countries';

  Future<CovidModel> getData() async {
    try {
      final response = await http.get(Uri.parse(worldStatsUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CovidModel.fromJson(data);
      } else {
        print('Failed To Load Data');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error : $error');
      throw Exception('An error occurred');
    }
  }
}
