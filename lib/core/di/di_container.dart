import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/data/datasources/classroom_remote_data_source.dart';
import 'package:hamon_test/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:hamon_test/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:hamon_test/features/classroom/domain/usecases/fetch_classroom.dart';
import 'package:hamon_test/features/classroom/domain/usecases/get_classroom.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_list/classroom_bloc.dart';
import 'package:hamon_test/features/registration/data/datasources/register_remote_data_source.dart';
import 'package:hamon_test/features/registration/data/repositories/register_repository_impl.dart';
import 'package:hamon_test/features/registration/domain/repositories/register_repository.dart';
import 'package:hamon_test/features/registration/domain/usecases/fetch_registration.dart';
import 'package:hamon_test/features/registration/domain/usecases/get_restration.dart';
import 'package:hamon_test/features/registration/presentation/blocs/register_bloc.dart';
import 'package:hamon_test/features/students/data/datasources/student_remote_data_source.dart';
import 'package:hamon_test/features/students/data/repositories/student_repository_impl.dart';
import 'package:hamon_test/features/students/domain/repositories/student_repository.dart';
import 'package:hamon_test/features/students/domain/usecases/fetch_student.dart';
import 'package:hamon_test/features/students/domain/usecases/get_students.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_details/student_details_bloc.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_list/student_list_bloc.dart';
import 'package:hamon_test/features/subjects/data/datasources/subject_remote_data_source.dart';
import 'package:hamon_test/features/subjects/data/repositories/subject_repository_impl.dart';
import 'package:hamon_test/features/subjects/domain/repositories/subject_repository.dart';
import 'package:hamon_test/features/subjects/domain/usecases/fetch_subject.dart';
import 'package:hamon_test/features/subjects/domain/usecases/get_subject.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_fetch_bloc/fetch_subject_bloc.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_list_bloc/subject_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'di_container_init.dart';
