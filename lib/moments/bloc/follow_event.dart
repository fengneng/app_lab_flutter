part of 'follow_bloc.dart';

@immutable
abstract class FollowEvent {}

class ResetFollowUsers extends FollowEvent {
  final List<int> ids;
  ResetFollowUsers(this.ids);
}

class FollowUser extends FollowEvent {
  final int id;

  FollowUser(this.id);
}

class UnFollowUser extends FollowEvent {
  final int id;

  UnFollowUser(this.id);
}
