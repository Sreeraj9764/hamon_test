import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/data/datasources/student_remote_data_source.dart';
import 'package:hamon_test/features/students/data/repositories/student_repository_impl.dart';
import 'package:hamon_test/features/students/domain/repositories/student_repository.dart';
import 'package:hamon_test/features/students/domain/usecases/fetch_student.dart';
import 'package:hamon_test/features/students/domain/usecases/get_students.dart';
import 'package:hamon_test/features/students/presentation/blocs/students_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'di_container_init.dart';
