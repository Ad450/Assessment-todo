import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel extends Equatable {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool completed;

  @override
  List<Object> get props => [uid, description ?? "", completed];

  TaskModel({
    required this.uid,
    required this.title,
    required this.completed,
    this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(uid: json["uid"], title: json["title"], completed: json["completed"]);
}
