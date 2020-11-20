part of 'follow_bloc.dart';

@immutable
abstract class FollowState {}

class FollowInitial extends FollowState {}

class FollowLoaded extends FollowState {}

class FollowChanged extends FollowState {
  final int id;
  final bool followed;

  FollowChanged(
    this.id, {
    @required this.followed,
  });
}
