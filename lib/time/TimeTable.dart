import 'dart:convert';
import 'package:homework5/models/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:homework5/models/CountryDetailsScreen.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Country>? _countries;
  late List<Country> _filteredCountries;

  @override
  void initState() {
    super.initState();
    fetchData();
    _filteredCountries = [];
  }

  void fetchData() async {
    var dio = Dio(BaseOptions(responseType: ResponseType.plain));
    var response =
        await dio.get('https://api.sampleapis.com/countries/countries');
    print('Status code: ${response.statusCode}');
    response.headers.forEach((name, values) {
      print('$name: $values');
    });
    print(response.data.toString());

    setState(() {
      var list = jsonDecode(response.data.toString());

      _countries =
          List<Country>.from(list.map((item) => Country.fromJson(item)));

      // Populate filtered countries with all countries initially
      _filteredCountries = List<Country>.from(_countries!);
    });
  }

  void _filterCountries(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        // If search text is empty, show all countries
        _filteredCountries = List<Country>.from(_countries!);
      } else {
        // Filter countries based on search text
        _filteredCountries = _countries!
            .where((country) =>
                country.name!.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  void _showCountryDetails(Country country) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountryDetailsScreen(country: country),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _filterCountries,
          decoration: InputDecoration(
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: _filteredCountries.isEmpty
              ? Center(child: Text('No countries found'))
              : ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    var country = _filteredCountries[index];

                    return ListTile(
                      title: Text(country.name ?? ''),
                      subtitle: Text(country.capital ?? ''),
                      trailing: country.flag == ''
                          ? null
                          : Image.network(
                              country.flag ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, color: Colors.red);
                              },
                            ),
                      onTap: () {
                        _showCountryDetails(country);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
