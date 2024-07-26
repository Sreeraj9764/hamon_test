import 'package:hamon_test/features/registration/domain/entities/register.dart';

class RegistrationModel extends Registration {
  RegistrationModel({
    required super.subject,
    required super.id,
    required super.student,
  });

  RegistrationModel copyWith({
    String? subject,
    int? id,
    String? student,
  }) =>
      RegistrationModel(
        subject: subject ?? this.subject,
        id: id ?? this.id,
        student: student ?? this.student,
      );

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        subject: json["subject"],
        id: json["id"],
        student: json["student"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "id": id,
        "student": student,
      };
}
