import 'dart:convert';

import 'package:equatable/equatable.dart';

class Eng extends Equatable {
  final String? official;
  final String? common;

  const Eng({this.official, this.common});

  factory Eng.fromMap(Map<String, dynamic> data) => Eng(
        official: data['official'] as String?,
        common: data['common'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'official': official,
        'common': common,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Eng].
  factory Eng.fromJson(String data) {
    return Eng.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Eng] to a JSON string.
  String toJson() => json.encode(toMap());

  Eng copyWith({
    String? official,
    String? common,
  }) {
    return Eng(
      official: official ?? this.official,
      common: common ?? this.common,
    );
  }

  @override
  List<Object?> get props => [official, common];
}
