import 'package:hamon_test/features/students/domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.age,
    required super.email,
    required super.id,
    required super.name,
  });

  StudentModel copyWith({
    int? age,
    String? email,
    int? id,
    String? name,
  }) =>
      StudentModel(
        age: age ?? this.age,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
      };
}
