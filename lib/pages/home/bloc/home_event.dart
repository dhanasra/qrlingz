part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetHistory extends HomeEvent {}

class UpdateHistory extends HomeEvent {}

class RemoveHistory extends HomeEvent {
  final String id;
  RemoveHistory({required this.id});
}