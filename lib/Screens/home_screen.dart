import 'package:c_square2/Screens/about_us_screen.dart';
import 'package:c_square2/palette.dart';
import 'package:flutter/material.dart';
import 'package:c_square2/Services_country.dart';
import 'package:c_square2/country.dart';
import 'package:c_square2/Widgets/case_tile.dart';
import 'package:c_square2/Screens/list_view_screen.dart';
import 'package:c_square2/Screens/map_view_screen.dart';
import 'package:c_square2/Widgets/line_chart_confirmed_widget.dart';
import 'package:c_square2/Widgets/line_chart_recovered_widget.dart';
import 'package:c_square2/Widgets/line_chart_deaths_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'Home_Screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Datum> _country = List<Datum>();
  Datum sum;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getCountry().then((value) {
      setState(() {
        _country = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kDarkPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.userFriends),
                onPressed: () {
                  Navigator.pushNamed(context, AboutUsScreen.id);
                }),
          ],
          backgroundColor: kExtraDarkPrimaryColor,
          title: Center(
            child: Text(
              _loading ? 'Loading ' : '     C - S Q U A R E ',
              style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: kTextColor,
                  fontFamily: 'Even_Stevens'),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.viruses)),
              Tab(icon: Icon(FontAwesomeIcons.listOl)),
              Tab(icon: Icon(FontAwesomeIcons.globeAsia)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _loading
                ? SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50,
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                                  'Global',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextCard(
                                          heading: 'Active',
                                          text: (getTotal().confirmed -
                                                  getTotal().recovered -
                                                  getTotal().deaths)
                                              .toString(),
                                          trailing: '',
                                          color: Colors.yellow[900],
                                        ),
                                        TextCard(
                                          heading: 'Deceased',
                                          text: getTotal().deaths.toString(),
                                          trailing: (getTotal().deaths -
                                                  getTotal().deathsm1)
                                              .toString(),
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextCard(
                                        heading: 'Recovered',
                                        text: getTotal().recovered.toString(),
                                        trailing: (getTotal().recovered -
                                                getTotal().recoveredm1)
                                            .toString(),
                                        color: Colors.green,
                                      ),
                                      TextCard(
                                        heading: 'Confirmed',
                                        text: getTotal().confirmed.toString(),
                                        trailing: (getTotal().confirmed -
                                                getTotal().confirmedm1)
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
                                  'India',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextCard(
                                          heading: 'Active',
                                          text: (getIndia().confirmed -
                                                  getIndia().recovered -
                                                  getIndia().deaths)
                                              .toString(),
                                          trailing: '',
                                          color: Colors.yellow[900],
                                        ),
                                        TextCard(
                                          heading: 'Deceased',
                                          text: getIndia().deaths.toString(),
                                          trailing: (getIndia().deaths -
                                                  getIndia().deathsm1)
                                              .toString(),
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextCard(
                                        heading: 'Recovered',
                                        text: getIndia().recovered.toString(),
                                        trailing: (getIndia().recovered -
                                                getIndia().recoveredm1)
                                            .toString(),
                                        color: Colors.green,
                                      ),
                                      TextCard(
                                        heading: 'Confirmed',
                                        text: getIndia().confirmed.toString(),
                                        trailing: (getIndia().confirmed -
                                                getIndia().confirmedm1)
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
                                  'Global Confirmed',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.red),
                                ),
                              ),
                              LineChartConfirmedWidget(
                                country: getTotal(),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Global Recovered',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.green),
                                ),
                              ),
                              LineChartRecoveredWidget(
                                country: getTotal(),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Global Deaths',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              LineChartDeathsWidget(
                                country: getTotal(),
                              ),
                              Divider(),
                            ],
                          )),
                    ),
                  ),
            ListViewScreen(),
            MapViewScreen(),
          ],
        ),
      ),
    );
  }

  Datum getTotal() {
    var confirmedSum = 0;
    var recoveredSum = 0;
    var deathsSum = 0;
    var confirmedSumm1 = 0;
    var recoveredSumm1 = 0;
    var deathsSumm1 = 0;
    var confirmedSumm2 = 0;
    var recoveredSumm2 = 0;
    var deathsSumm2 = 0;
    var confirmedSumm3 = 0;
    var recoveredSumm3 = 0;
    var deathsSumm3 = 0;
    var confirmedSumm4 = 0;
    var recoveredSumm4 = 0;
    var deathsSumm4 = 0;
    var confirmedSumm5 = 0;
    var recoveredSumm5 = 0;
    var deathsSumm5 = 0;
    var confirmedSumm6 = 0;
    var recoveredSumm6 = 0;
    var deathsSumm6 = 0;
    var confirmedSumm7 = 0;
    var recoveredSumm7 = 0;
    var deathsSumm7 = 0;

    if (_country.length != null) {
      for (var i = 0; i < _country.length - 1; i++) {
        confirmedSum += _country[i].confirmed;
        recoveredSum += _country[i].recovered;
        deathsSum += _country[i].deaths;
        confirmedSumm1 += _country[i].confirmedm1;
        recoveredSumm1 += _country[i].recoveredm1;
        deathsSumm1 += _country[i].deathsm1;
        confirmedSumm2 += _country[i].confirmedm2;
        recoveredSumm2 += _country[i].recoveredm2;
        deathsSumm2 += _country[i].deathsm2;
        confirmedSumm3 += _country[i].confirmedm3;
        recoveredSumm3 += _country[i].recoveredm3;
        deathsSumm3 += _country[i].deathsm3;
        confirmedSumm4 += _country[i].confirmedm4;
        recoveredSumm4 += _country[i].recoveredm4;
        deathsSumm4 += _country[i].deathsm4;
        confirmedSumm5 += _country[i].confirmedm5;
        recoveredSumm5 += _country[i].recoveredm5;
        deathsSumm5 += _country[i].deathsm5;
        confirmedSumm6 += _country[i].confirmedm6;
        recoveredSumm6 += _country[i].recoveredm6;
        deathsSumm6 += _country[i].deathsm6;
        confirmedSumm7 += _country[i].confirmedm7;
        recoveredSumm7 += _country[i].recoveredm7;
        deathsSumm7 += _country[i].deathsm7;
      }
    }
    return Datum(
      name: 'Total',
      confirmed: confirmedSum,
      recovered: recoveredSum,
      deaths: deathsSum,
      confirmedm1: confirmedSumm1,
      recoveredm1: recoveredSumm1,
      deathsm1: deathsSumm1,
      confirmedm2: confirmedSumm2,
      recoveredm2: recoveredSumm2,
      deathsm2: deathsSumm2,
      confirmedm3: confirmedSumm3,
      recoveredm3: recoveredSumm3,
      deathsm3: deathsSumm3,
      confirmedm4: confirmedSumm4,
      recoveredm4: recoveredSumm4,
      deathsm4: deathsSumm4,
      confirmedm5: confirmedSumm5,
      recoveredm5: recoveredSumm5,
      deathsm5: deathsSumm5,
      confirmedm6: confirmedSumm6,
      recoveredm6: recoveredSumm6,
      deathsm6: deathsSumm6,
      confirmedm7: confirmedSumm7,
      recoveredm7: recoveredSumm7,
      deathsm7: deathsSumm7,
    );
  }

  Datum getIndia() {
    var confirmed = 0;
    var recovered = 0;
    var deaths = 0;
    var confirmedm1 = 0;
    var recoveredm1 = 0;
    var deathsm1 = 0;
    for (var i = 0; i < _country.length - 50; i++) {
      if (_country[i].name == 'India') {
        confirmed += _country[i].confirmed;
        recovered += _country[i].recovered;
        deaths += _country[i].deaths;
        confirmedm1 += _country[i].confirmedm1;
        recoveredm1 += _country[i].recoveredm1;
        deathsm1 += _country[i].deathsm1;
      }
    }

    return Datum(
      confirmed: confirmed,
      confirmedm1: confirmedm1,
      recovered: recovered,
      recoveredm1: recoveredm1,
      deaths: deaths,
      deathsm1: deathsm1,
    );
  }

  int getActiveChanges() {
    return (getTotal().confirmed -
        getTotal().confirmedm1 -
        getTotal().recovered +
        getTotal().recoveredm1);
  }
}
