import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:c_square2/map.dart';
import 'package:c_square2/Services_map.dart';
import 'package:c_square2/Services_country.dart';
import 'package:c_square2/country.dart';
import 'package:c_square2/palette.dart';
import 'package:c_square2/Widgets/case_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapViewScreen extends StatefulWidget {
  static String id = 'Map_View_Screen';
  @override
  _MapViewScreenState createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  List<MapDatum> _map = List<MapDatum>();
  List<Datum> _country = List<Datum>();
  bool _loading;
  @override
  void initState() {
    super.initState();
    Services3.getMap().then((value) {
      setState(() {
        _map = value;
      });
    });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkPrimaryColor,
        child: Icon(FontAwesomeIcons.info),
        onPressed: () {
          _showMyDialog();
        },
      ),
      body: _loading
          ? SpinKitDoubleBounce(
              color: kExtraDarkPrimaryColor,
              size: 50,
            )
          : new FlutterMap(
              options: new MapOptions(
                center: new LatLng(20.5937, 78.9629),
                zoom: 5,
                minZoom: 3,
                maxZoom: 6,
                interactiveFlags:
                    InteractiveFlag.pinchZoom | InteractiveFlag.drag,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/dashy1205/cklbwbetj136b17qltz7culfw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFzaHkxMjA1IiwiYSI6ImNrbGJhNjRyZDFocWEyd25wcGI2czNzNjgifQ.B7GBoXQHpxc6ztpkPYu6EA",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoiZGFzaHkxMjA1IiwiYSI6ImNrbGJhYzIxdzA1MXgyd21qYjFhMGxlaXAifQ.W6TmFzG0Oc8cCSebTqmb-A',
                      'id': 'mapbox.mapbox-terrain-dem-v1'
                    }),
                new MarkerLayerOptions(
                  markers: getMapData(),
                ),
              ],
            ),
    );
  }

  List<Marker> getMapData() {
    List<Marker> map = List<Marker>();
    for (var location in _map) {
      Marker _mark;
      _mark = Marker(
          width: 30.0,
          height: 30.0,
          point: new LatLng(location.latitude, location.longitude),
          builder: (context) {
            return new Center(
              child: IconButton(
                icon: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 30,
                  ),
                ),
                color: getColour(location.name),
                iconSize: 45.0,
                onPressed: () {
                  print(location.name);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => showBottomSheet(location.name),
                  );
                },
              ),
            );
          });
      map.add(_mark);
    }
    if (map == null) {
      return List<Marker>();
    } else {
      return map;
    }
  }

  Color getColour(String _countryName) {
    Color markerColour;
    for (var country in _country) {
      if (_countryName == country.name) {
        if (country.confirmed >= 5000000) {
          markerColour = Colors.black;
        } else if (country.confirmed >= 1000000 &&
            country.confirmed < 5000000) {
          markerColour = Colors.red;
        } else if (country.confirmed >= 300000 && country.confirmed < 1000000) {
          markerColour = Colors.orange;
        } else if (country.confirmed >= 50000 && country.confirmed < 300000) {
          markerColour = Colors.yellow;
        } else if (country.confirmed >= 10000 && country.confirmed < 50000) {
          markerColour = Colors.green;
        } else {
          markerColour = Colors.blueGrey;
        }
      }
    }
    return markerColour;
  }

  Widget showBottomSheet(String _countryName) {
    Widget box;
    for (var country in _country) {
      if (_countryName == country.name) {
        box = Container(
          height: 270,
          color: Colors.grey[700],
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                              trailing: (country.deaths - country.deathsm1)
                                  .toString(),
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
                ],
              )),
        );
      }
    }
    return box;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Map Legends'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset('images/legend.png'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: kExtraDarkPrimaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
