// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeState _$HomeStateFromJson(Map<String, dynamic> json) => HomeState(
      apiStatus: $enumDecodeNullable(_$ApiStatusEnumMap, json['apiStatus']) ??
          ApiStatus.pure,
      countries: (json['countries'] as List<dynamic>?)
              ?.map((e) => Country.fromJson(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeStateToJson(HomeState instance) => <String, dynamic>{
      'apiStatus': _$ApiStatusEnumMap[instance.apiStatus]!,
      'countries': instance.countries,
    };

const _$ApiStatusEnumMap = {
  ApiStatus.pure: 'pure',
  ApiStatus.loading: 'loading',
  ApiStatus.succeed: 'succeed',
  ApiStatus.failed: 'failed',
};
