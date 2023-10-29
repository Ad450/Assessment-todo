import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _TaskStateInitial;
  const factory TaskState.addTasksLoading() = _TaskStateAddTasksLoading;
  const factory TaskState.addTasksError(String message) = _TaskStateAddTasksError;
  const factory TaskState.addTasksSuccess() = _TaskStateAddTasksSuccess;
  const factory TaskState.deleteTaskSuccess() = _TaskStateDeleteTaskSuccess;
  const factory TaskState.deleteTaskError(String message) = _TaskStateDeleteTaskError;
  const factory TaskState.deleteTasksLoading() = _TaskStateDeleteTaskLoading;

  const factory TaskState.updateTaskSuccess() = _TaskStateUpdateTaskSuccess;
  const factory TaskState.updateTaskError(String message) = _TaskStateUpdateTaskError;
  const factory TaskState.updateTaskLoading() = _TaskStateUpdateTaskLoading;

  const factory TaskState.fetchTasksLoading() = _TaskStateFetchTasksLoading;
  const factory TaskState.fetchTasksError({required String message}) = _TasksStateFetchTasksError;
  const factory TaskState.fetchTasksSuccess(List<dynamic> categories) = TaskStateFetchTasksSuccess;

  const factory TaskState.markAsCompleteLoading() = _TaskStateMarkAsCompleteLoading;
  const factory TaskState.markAsCompleteError({required String message}) = _TasksStateMarkAsCompleteError;
  const factory TaskState.markAsCompleteSuccess() = _TaskStateMarkAsCompleteSuccess;

  const factory TaskState.addToOldCategoryLoading() = _TaskStateAddToOldCategoryLoading;
  const factory TaskState.addToOldCategoryError({required String message}) = _TaskStateAddToOldCategoryError;
  const factory TaskState.addToOldCategorySuccess() = _TaskStateAddToOldCategorySuccess;
}
