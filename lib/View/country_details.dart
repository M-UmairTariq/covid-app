import 'package:covid_app/Constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryDetailScreen extends StatefulWidget {
  String countryName, flag, continent;
  num cases, deaths, recovered, active, tests, population;

  CountryDetailScreen({
    super.key,
    required this.countryName,
    required this.flag,
    required this.continent,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.tests,
    required this.population,
  });

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(widget.flag),
              width: 140,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              widget.countryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomRow(title: 'Continent', value: widget.continent),
            CustomRow(title: 'Population', value: widget.population.toString()),
            CustomRow(title: 'Cases', value: widget.cases.toString()),
            CustomRow(title: 'Deaths', value: widget.deaths.toString()),
            CustomRow(title: 'Recovered', value: widget.recovered.toString()),
            CustomRow(title: 'Active', value: widget.active.toString()),
            CustomRow(title: 'Tests Done', value: widget.tests.toString())
          ]),
    );
  }
}
