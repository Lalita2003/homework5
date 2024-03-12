// POJO (Plain Old Java Object)
class Country {
  final String? name;
  final String? capital;
  final int? population;
  final String? Currency;
  final String? CountryCode;
  final String? flag;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.Currency,
    required this.CountryCode,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      capital: json['capital'],
      population: json['population'],
      Currency: json['currency'],
      CountryCode: json['countryCode'],
      flag: json['media']['flag'],
    );
  }
}
