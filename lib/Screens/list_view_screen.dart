import 'package:flutter/material.dart';
import 'package:c_square2/Services_country.dart';
import 'package:c_square2/country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:c_square2/Screens/corona_cases_screen.dart';
import 'package:c_square2/palette.dart';

class ListViewScreen extends StatefulWidget {
  static String id = 'list_view_screen';
  ListViewScreen() : super();

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  List<Datum> _country;
  bool _loading;
  var _countryForDisplay = List<Datum>();

  @override
  void initState() {
    // items.addAll(_country);
    getCurrentUser();
    super.initState();
    _loading = true;
    Services.getCountry().then((value) {
      setState(() {
        _country = value;
        // _countryForDisplay = _country;
        _loading = false;
      });
    });
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    } catch (e) {
      print(e);
    }
  }

  // void filterSearchResults(String query) {
  //   List<Datum> dummySearchList = List<Datum>();
  //   dummySearchList.addAll(_country);
  //   if (query.isNotEmpty) {
  //     List<Datum> dummyListData = List<Datum>();
  //     dummySearchList.forEach((item) {
  //       if (item.name.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     });
  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(_country);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: _loading
            ? SpinKitDoubleBounce(
                color: kExtraDarkPrimaryColor,
                size: 50,
              )
            : ListView.builder(
                itemCount: null == _country ? 0 : _country.length,
                itemBuilder: (context, index) {
                  return _listItem(index);
                },
              ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _countryForDisplay = _country.where((element) {
              var countryName = element.name.toLowerCase();
              return countryName.contains(text);
            }).toList();
          });
        },
        decoration: InputDecoration(
            focusColor: kPrimaryColor,
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }

  _listItem(index) {
    Datum country = _country[index];
    return Column(
      children: [
        FlatButton(
          child: ListTile(
            title: Text(country.name),
            // subtitle: Text(country.confirmed.toString()),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CoronaCases(
                    country: country,
                  );
                },
              ),
            );
          },
        ),
        Divider(),
      ],
    );
  }
}
