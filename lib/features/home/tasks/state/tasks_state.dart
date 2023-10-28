import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/category_model.dart';

part 'tasks_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _TaskStateInitial;
  const factory TaskState.fetchTasksLoading() = _TaskStateFetchTasksLoading;
  const factory TaskState.fetchTasksError({required String message}) = _TasksStateFetchTasksError;
  const factory TaskState.fetchTasksSuccess(List<CategoryModel> categories) = TaskStateFetchTasksSuccess;
}
