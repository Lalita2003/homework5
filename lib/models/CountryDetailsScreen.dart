import 'package:flutter/material.dart';
import 'package:homework5/models/country.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  const CountryDetailsScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent gray color
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Dialog(
              child: SingleChildScrollView( // Wrap the Container with SingleChildScrollView
                child: Padding(
                  padding: EdgeInsets.only(left: 42.0), // 1 inch spacing from the left
                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerLeft, // Align content to the left
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                      children: [
                        AppBar(
                          title: Text(country.name ?? ''),
                          backgroundColor: Colors.transparent,
                          elevation: 0, // No shadow
                          automaticallyImplyLeading: false, // No back button
                          centerTitle: true,
                        ),
                        SizedBox(height: 8),
                        Text('Capital: ${country.capital ?? ''}'),
                        SizedBox(height: 8),
                        Text('Population: ${country.population ?? ''}'),
                        SizedBox(height: 8),
                        Text('Currency: ${country.Currency ?? ''}'),
                        SizedBox(height: 8),
                        Text('Country code: ${country.CountryCode ?? ''}'),
                        SizedBox(height: 8),
                        if (country.flag != null && country.flag!.isNotEmpty)
                          Image.network(
                            country.flag!,
                            width: 80,
                            height: 100,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, color: Colors.red);
                            },
                          ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0, bottom: 16.0), // 1 inch spacing from the right and 1cm from the bottom
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
