import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todo/core/models/task_model.dart';
part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends Equatable {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<TaskModel> tasks;

  @override
  List<Object> get props => [uid, title, tasks];

  CategoryModel({
    required this.uid,
    required this.title,
    required this.tasks,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        uid: json["uid"],
        title: json["title"],
        tasks: List.from(
          (json["tasks"] as List).map((e) => TaskModel.fromJson(e)),
        ),
      );
}
