part of 'articals_cubit.dart';

@immutable
class ArticalsState {}

class ArticalsInitial extends ArticalsState {}

class ArticalsLoading extends ArticalsState {}

class ArticalsLoaded extends ArticalsState {
  final List<Articles> articals;

  ArticalsLoaded({required this.articals});
}

class ArticalsError extends ArticalsState {
  final String message;

  ArticalsError({required this.message});
}
