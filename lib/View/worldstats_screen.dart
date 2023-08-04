import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const WorldStatsScreen())));
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Column(
              children: [
                PieChart(
                  colorList: colorList,
                  chartType: ChartType.ring,
                  chartRadius: MediaQuery.of(context).size.height * 0.2,
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.left),
                  dataMap: const {'Total': 23, 'Recovered': 22, 'Deaths': 1},
                  animationDuration: (const Duration(milliseconds: 1200)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomRow(
                  title: 'Total',
                  value: '1234',
                ),
                CustomRow(
                  title: 'Total',
                  value: '1234',
                ),
              ],
            ),
            CustomButton(
              title: 'Track Countries',
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  String title, value;
  CustomRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Divider(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(16)),
        height: 60,
        width: 200,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ));
  }
}
