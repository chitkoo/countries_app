import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'native_name.dart';

class Country extends Equatable {
  final String? common;
  final String? official;
  final NativeName? nativeName;

  const Country({this.common, this.official, this.nativeName});

  factory Country.fromMap(Map<String, dynamic> data) => Country(
        common: data['common'] as String?,
        official: data['official'] as String?,
        nativeName: data['nativeName'] == null
            ? null
            : NativeName.fromMap(data['nativeName'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'common': common,
        'official': official,
        'nativeName': nativeName?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  String toJson() => json.encode(toMap());

  Country copyWith({
    String? common,
    String? official,
    NativeName? nativeName,
  }) {
    return Country(
      common: common ?? this.common,
      official: official ?? this.official,
      nativeName: nativeName ?? this.nativeName,
    );
  }

  @override
  List<Object?> get props => [common, official, nativeName];

  static List<Country> parseCountries(String responseBody) {
    final List<dynamic> parsed = json.decode(responseBody);
    return parsed.map<Country>((data) => Country.fromMap(data['name'])).toList();
  }
}
