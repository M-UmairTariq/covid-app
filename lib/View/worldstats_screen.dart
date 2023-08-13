import 'package:covid_app/Services/api_service.dart';
import 'package:covid_app/View/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Constants/constants.dart';
import '../Model/CovidModel.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    AppApi statsData = AppApi();
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      FutureBuilder(
          future: statsData.getAllData(),
          builder: (context, AsyncSnapshot<CovidModel> snapshot) {
            if (!snapshot.hasData) {
              return Expanded(
                flex: 1,
                child: SpinKitCircle(
                  color: Colors.white,
                  size: 40,
                  controller: _controller,
                ),
              );
            } else {
              return Column(
                children: [
                  Column(
                    children: [
                      PieChart(
                        colorList: colorList,
                        chartType: ChartType.ring,
                        chartRadius: MediaQuery.of(context).size.height * 0.2,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        dataMap: {
                          'Total':
                              double.parse(snapshot.data!.cases.toString()),
                          'Recovered':
                              double.parse(snapshot.data!.recovered.toString()),
                          'Deaths':
                              double.parse(snapshot.data!.deaths.toString()),
                        },
                        animationDuration: (const Duration(milliseconds: 1200)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomRow(
                        title: 'Total Cases',
                        value: snapshot.data!.cases.toString(),
                      ),
                      CustomRow(
                        title: 'Deaths',
                        value: snapshot.data!.deaths.toString(),
                      ),
                      CustomRow(
                        title: 'Recovered',
                        value: snapshot.data!.recovered.toString(),
                      ),
                      CustomRow(
                        title: 'Active Cases',
                        value: snapshot.data!.active.toString(),
                      ),
                      CustomRow(
                        title: 'Tests',
                        value: snapshot.data!.tests.toString(),
                      ),
                      CustomRow(
                        title: 'Affected Countries',
                        value: snapshot.data!.affectedCountries.toString(),
                      ),
                    ],
                  ),
                  CustomButton(
                    title: 'Track Countries',
                    callFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CountriesScreen()));
                    },
                  )
                ],
              );
            }
          }),
    ])));
  }
}
