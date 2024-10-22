part of 'explore_bloc.dart';

enum ExploreStatus { initial, loading, success, failure }

final class ExploreState {
  const ExploreState(
      {this.filter = CouchesFilter.all,
      this.selectedCouch,
      this.couches = const [],
      this.status = ExploreStatus.initial});

  final ExploreStatus status;
  final List<Couch> couches;
  final CouchesFilter filter;
  final Couch? selectedCouch;

  Iterable<Couch> get filteredCouches => filter.applyAll(couches);

  ExploreState copyWith({
    CouchesFilter Function()? filter,
    Couch Function()? selectedCouch,
    List<Couch> Function()? couches,
    ExploreStatus Function()? status,
  }) {
    return ExploreState(
      filter: filter != null ? filter() : this.filter,
      selectedCouch:
          selectedCouch != null ? selectedCouch() : this.selectedCouch,
      couches: couches != null ? couches() : this.couches,
      status: status != null ? status() : this.status,
    );
  }
}
