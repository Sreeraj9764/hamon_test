part of 'register_bloc.dart';

@immutable
sealed class RegistrationEvent {}

final class GetRegistrationEvent extends RegistrationEvent {}

final class FetchRegistrationEvent extends RegistrationEvent {
  final int id;

  FetchRegistrationEvent({required this.id});
}
