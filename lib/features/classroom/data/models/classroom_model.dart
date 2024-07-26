import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';

class ClassRoomModel extends ClassRoom {
  ClassRoomModel({
    required super.size,
    required super.layout,
    required super.id,
    required super.name,
  });

  ClassRoomModel copyWith({
    int? size,
    String? layout,
    int? id,
    String? name,
  }) =>
      ClassRoomModel(
        size: size ?? this.size,
        layout: layout ?? this.layout,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) => ClassRoomModel(
        size: json["size"],
        layout: json["layout"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "layout": layout,
        "id": id,
        "name": name,
      };
}
