import 'package:user_repository/user_repository.dart';

enum CouchesFilter { all, activeOnly }

extension CouchesFilterX on CouchesFilter {
  bool apply(Couch couch) {
    switch (this) {
      case CouchesFilter.all:
        return true;
      case CouchesFilter.activeOnly:
        return couch.active ?? false;
    }
  }

  Iterable<Couch> applyAll(Iterable<Couch> couches) {
    return couches.where(apply);
  }
}
