part of 'register_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationBlocInitial extends RegistrationState {}

final class RegistrationBlocLoading extends RegistrationState {}

final class RegistrationBlocError extends RegistrationState {
  final String error;

  RegistrationBlocError({required this.error});
}

final class GetRegistrationBlocSuccess extends RegistrationState {
  final List<Registration> registrations;

  GetRegistrationBlocSuccess({required this.registrations});
}

final class FetchRegistrationBlocSuccess extends RegistrationState {
  final Registration registration;

  FetchRegistrationBlocSuccess({required this.registration});
}
