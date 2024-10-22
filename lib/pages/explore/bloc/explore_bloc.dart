import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quouch_app/pages/explore/explore.dart';
import 'package:user_repository/user_repository.dart';

part 'explore_event.dart';

part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({
    required CouchRepository couchRepository,
  })  : _couchRepository = couchRepository,
        super(const ExploreState()) {
    on<CouchesListRequested>(_onCouchesListRequested);
    on<CouchCardPressed>(_onCouchesListRequested);
    on<CouchesFilterChanged>(_onCouchesListRequested);
  }

  final CouchRepository _couchRepository;

  Future<void> _onCouchesListRequested(event, emit) async {
    emit(state.copyWith(status: () => ExploreStatus.loading));

    await emit.forEach<List<Couch>>(
      _couchRepository.getAvailableCouches(),
      onData: (todos) => state.copyWith(
        status: () => ExploreStatus.success,
        couches: () => todos,
      ),
      onError: (_, __) => state.copyWith(
        status: () => ExploreStatus.failure,
      ),
    );
  }

  Future<void> _onCouchCardPressed(event, emit) async {
    await emit.forEach<void>(
      _couchRepository.getCouchById(event.couchId),
      onData: (couch) => state.copyWith(
        status: () => ExploreStatus.success,
        selectedCouch: () => couch,
      ),
      onError: (_, __) => state.copyWith(
        status: () => ExploreStatus.failure,
      ),
    );
  }

  FutureOr<void> _onCouchesFilterChanged(event, emit) {
    emit(state.copyWith(
      filter: () => event.filter,
    ));

    emit(_onCouchesListRequested(event, emit));
  }
}
