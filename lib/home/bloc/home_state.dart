part of 'home_bloc.dart';

enum ApiStatus { pure, loading, succeed, failed }

@JsonSerializable()
class HomeState extends Equatable {
  const HomeState({
    this.apiStatus = ApiStatus.pure,
    this.countries = const [],
  });

  final ApiStatus apiStatus;
  final List<Country> countries;

  @override
  List<Object> get props => [apiStatus, countries];


  factory HomeState.fromJson(Map<String,dynamic> json) => _$HomeStateFromJson(json);
  Map<String,dynamic> toJson () => _$HomeStateToJson(this);
 
  HomeState copyWith({
    ApiStatus? apiStatus,
    List<Country>? countries,
  }) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      countries: countries ?? this.countries,
    );
  }
}
