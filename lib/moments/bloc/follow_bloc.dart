import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  Set<int> followIds = <int>{};

  FollowBloc() : super(FollowInitial());

  @override
  Stream<FollowState> mapEventToState(
    FollowEvent event,
  ) async* {
    if (event is ResetFollowUsers) {
      followIds.addAll(event.ids);
      for (final item in event.ids) {
        yield FollowChanged(item, followed: true);
      }
    } else if (event is FollowUser) {
      followIds.add(event.id);
      yield FollowChanged(event.id, followed: true);
    } else if (event is UnFollowUser) {
      followIds.remove(event.id);
      yield FollowChanged(event.id, followed: false);
    }
  }
}
