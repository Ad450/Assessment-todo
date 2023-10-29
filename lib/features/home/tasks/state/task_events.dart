abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final bool hasCategory;
  AddTaskEvent(this.hasCategory);
}

class DeleteTaskEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {
  final String oldTitle;
  UpdateTaskEvent(this.oldTitle);
}

class MarkTaskAsCompleteEvent extends TaskEvent {
  final String categoryTitle;
  final String taskTitle;

  MarkTaskAsCompleteEvent({required this.categoryTitle, required this.taskTitle});
}

class FetchTaskEvent extends TaskEvent {}

class AddToOldCategoryEvent extends TaskEvent {
  final String categoryTitle;
  AddToOldCategoryEvent(this.categoryTitle);
}
