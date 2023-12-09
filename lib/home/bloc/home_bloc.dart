import 'package:bloc/bloc.dart';
import 'package:country_app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
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
}
