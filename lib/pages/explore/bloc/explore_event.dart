part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {
  const ExploreEvent();
}

final class CouchesListRequested extends ExploreEvent {
  const CouchesListRequested();
}

final class CouchesFilterChanged extends ExploreEvent {
  const CouchesFilterChanged(this.filter);

  final CouchesFilter filter;
}

final class CouchCardPressed extends ExploreEvent {
  CouchCardPressed(this.couch);

  final Couch couch;
}
