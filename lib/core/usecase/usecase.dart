import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/resources/either.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call({required P params});
}
