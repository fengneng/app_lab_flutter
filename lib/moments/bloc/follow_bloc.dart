import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  var followIds = <int>{};

  FollowBloc() : super(FollowInitial());

  @override
  Stream<FollowState> mapEventToState(
    FollowEvent event,
  ) async* {
    if (event is ResetFollowUsers) {
      followIds.addAll(event.ids);
      for (var item in event.ids) {
        yield FollowChanged(item, true);
      }
    } else if (event is FollowUser) {
      followIds.add(event.id);
      yield FollowChanged(event.id, true);
    } else if (event is UnFollowUser) {
      followIds.remove(event.id);
      yield FollowChanged(event.id, false);
    }
  }
}
