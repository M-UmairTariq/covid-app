class CovidModel {
  final num updated;
  final num cases;
  final num todayCases;
  final num deaths;
  final num todayDeaths;
  final num recovered;
  final num todayRecovered;
  final num active;
  final num critical;
  final num casesPerOneMillion;
  final num deathsPerOneMillion;
  final num tests;
  final num testsPerOneMillion;
  final num population;
  final num activePerOneMillion;
  final num recoveredPerOneMillion;
  final num criticalPerOneMillion;
  final num affectedCountries;
  CovidModel({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  factory CovidModel.fromJson(Map<String, dynamic> json) {
    return CovidModel(
      updated: json['updated'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json['deathsPerOneMillion'],
      tests: json['tests'],
      testsPerOneMillion: json['testsPerOneMillion'],
      population: json['population'],
      activePerOneMillion: json['activePerOneMillion'],
      recoveredPerOneMillion: json['recoveredPerOneMillion'],
      criticalPerOneMillion: json['criticalPerOneMillion'],
      affectedCountries: json['affectedCountries'],
    );
  }
}
