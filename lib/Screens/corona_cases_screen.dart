import 'package:flutter/material.dart';
import 'package:c_square2/palette.dart';
import 'package:c_square2/country.dart';
import 'package:c_square2/Widgets/case_tile.dart';
import 'package:c_square2/Widgets/line_chart_confirmed_widget.dart';
import 'package:c_square2/Widgets/line_chart_recovered_widget.dart';
import 'package:c_square2/Widgets/line_chart_deaths_widget.dart';

class CoronaCases extends StatelessWidget {
  final Datum country;
  CoronaCases({this.country});
  static String id = 'corona_cases_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkPrimaryColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kDarkPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: kTextColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    country.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCard(
                            heading: 'Active',
                            text: (country.confirmed -
                                    country.recovered -
                                    country.deaths)
                                .toString(),
                            trailing: '',
                            color: Colors.yellow[900],
                          ),
                          TextCard(
                            heading: 'Deceased',
                            text: country.deaths.toString(),
                            trailing:
                                (country.deaths - country.deathsm1).toString(),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCard(
                          heading: 'Recovered',
                          text: country.recovered.toString(),
                          trailing: (country.recovered - country.recoveredm1)
                              .toString(),
                          color: Colors.green,
                        ),
                        TextCard(
                          heading: 'Confirmed',
                          text: country.confirmed.toString(),
                          trailing: (country.confirmed - country.confirmedm1)
                              .toString(),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Confirmed',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                LineChartConfirmedWidget(
                  country: country,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recovered',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                LineChartRecoveredWidget(
                  country: country,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Deaths',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                LineChartDeathsWidget(
                  country: country,
                ),
                Divider(),
              ],
            )),
      ),
    );
  }
}
