import 'package:covid_app/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'country_details.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  TextEditingController searchController = TextEditingController();
  AppApi countriesData = AppApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search Countries Wise',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)))),
          ),
          Expanded(
            child: FutureBuilder(
                future: countriesData.getCountriesData(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.002,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]));
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailScreen(
                                              countryName: snapshot.data![index]
                                                  ['country'],
                                              flag: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              continent: snapshot.data![index]
                                                  ['continent'],
                                              cases: snapshot.data![index]
                                                  ['cases'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              tests: snapshot.data![index]
                                                  ['tests'],
                                              population: snapshot.data![index]
                                                  ['population'],
                                            )));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: Image(
                                        width: 50,
                                        height: 35,
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  )
                                ],
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailScreen(
                                              countryName: snapshot.data![index]
                                                  ['country'],
                                              flag: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              continent: snapshot.data![index]
                                                  ['continent'],
                                              cases: snapshot.data![index]
                                                  ['cases'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              tests: snapshot.data![index]
                                                  ['tests'],
                                              population: snapshot.data![index]
                                                  ['population'],
                                            )));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: Image(
                                        width: 50,
                                        height: 35,
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          )
        ],
      )),
    );
  }
}
