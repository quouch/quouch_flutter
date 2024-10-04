part of 'home_cubit.dart';

enum HomeTab { explore, saved, trips, inbox, profile, }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.explore,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
