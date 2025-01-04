part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
    {
      @Default(Status.Loading) Status status,
      List<NewsEntity>? news,
      String? message,
    }
  ) = _HomeState;
}
