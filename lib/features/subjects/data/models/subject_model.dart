import 'package:hamon_test/features/subjects/domain/entities/subject.dart';

class SubjectModel extends Subject {
  SubjectModel({
    required super.credits,
    required super.teacher,
    required super.id,
    required super.name,
  });

  SubjectModel copyWith({
    int? credits,
    String? teacher,
    int? id,
    String? name,
  }) =>
      SubjectModel(
        credits: credits ?? this.credits,
        teacher: teacher ?? this.teacher,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        credits: json["credits"],
        teacher: json["teacher"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits,
        "teacher": teacher,
        "id": id,
        "name": name,
      };
}
