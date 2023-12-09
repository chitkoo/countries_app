import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'eng.dart';

class NativeName extends Equatable {
  final Eng? eng;

  const NativeName({this.eng});

  factory NativeName.fromMap(Map<String, dynamic> data) => NativeName(
        eng: data['eng'] == null
            ? null
            : Eng.fromMap(data['eng'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'eng': eng?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NativeName].
  factory NativeName.fromJson(String data) {
    return NativeName.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NativeName] to a JSON string.
  String toJson() => json.encode(toMap());

  NativeName copyWith({
    Eng? eng,
  }) {
    return NativeName(
      eng: eng ?? this.eng,
    );
  }

  @override
  List<Object?> get props => [eng];
}
