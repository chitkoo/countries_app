import 'package:country_app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.g.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        super(const HomeState()) {
    on<GetCountries>(_onGetCountries);
  }

  final AppRepository _appRepository;

  Future<void> _onGetCountries(
    GetCountries event,
    Emitter<HomeState> emit,
  ) async {
    if (state.apiStatus == ApiStatus.succeed && state.countries.isNotEmpty) {
      return;
    }

    emit(state.copyWith(apiStatus: ApiStatus.loading));
    try {
      List<Country> response = await _appRepository.getCountries();
      if (response.isNotEmpty) {
        emit(state.copyWith(
          apiStatus: ApiStatus.succeed,
          countries: response,
        ));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.failed));
      }

      debugPrint('BLOC : $response');
    } catch (e) {
      emit(state.copyWith(apiStatus: ApiStatus.failed));
    }
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) => HomeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(HomeState state) => state.toJson();
}
