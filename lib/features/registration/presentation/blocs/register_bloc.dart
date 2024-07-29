import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/domain/entities/register.dart';
import 'package:hamon_test/features/registration/domain/usecases/fetch_registration.dart';
import 'package:hamon_test/features/registration/domain/usecases/get_restration.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final GetRegistration _getRegistration;
  RegistrationBloc(
      {required FetchRegistration fetchRegistration,
      required GetRegistration getRegistration})
      : _getRegistration = getRegistration,
        super(RegistrationBlocInitial()) {
    on<RegistrationEvent>((event, emit) => emit(RegistrationBlocLoading()));
    on<GetRegistrationEvent>(_onGetAllRegistration);
  }
  void _onGetAllRegistration(
    GetRegistrationEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    final res = await _getRegistration(NoParams());

    res.fold(
      (l) => emit(RegistrationBlocError(error: l.message)),
      (r) => emit(GetRegistrationBlocSuccess(registrations: r)),
    );
  }
}
