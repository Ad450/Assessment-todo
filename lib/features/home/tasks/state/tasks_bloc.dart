import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/tasks/data/usecases/mark_task_as_complete.dart';
import 'package:todo/features/home/tasks/state/task_events.dart';
import 'package:todo/features/home/tasks/state/tasks_state.dart';

import '../../../../core/app/app_usecase.dart';
import '../data/usecases/add_task.dart';
import '../data/usecases/delete_tasks.dart';
import '../data/usecases/fetch_tasks.dart';
import '../data/usecases/update_task.dart';

class TasksBloc extends Bloc<TaskEvent, TaskState> {
  final AddTasks addTask;
  final DeleteTask deleteTask;
  final FetchAllTasks fetchAllTasks;
  final UpdateTask updateTask;
  final MarkTaskAsComplete markTaskAsComplete;
  final categoryController = TextEditingController();
  final taskTitleController = TextEditingController();
  final updatedTitleController = TextEditingController();

  TasksBloc({
    required this.addTask,
    required this.deleteTask,
    required this.fetchAllTasks,
    required this.updateTask,
    required this.markTaskAsComplete,
  }) : super(const TaskState.initial()) {
    on<FetchTaskEvent>(_fetchAllTask);
    on<UpdateTaskEvent>(_updateTask);
    on<AddTaskEvent>(_addTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<MarkTaskAsCompleteEvent>(_markAsComplete);
    on<AddToOldCategoryEvent>(_addTaskToOldCategory);
  }

  Future<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.addTasksLoading());
    final result = await addTask(AddTaskParam(
      categoryTitle: categoryController.text,
      taskTitle: taskTitleController.text,
      description: "",
    ));
    result.fold(
      (l) => emit(TaskState.addTasksError(l.message)),
      (r) {
        if (!event.hasCategory) {
          emit(const TaskState.addTasksSuccess());
        }
      },
    );
    categoryController.clear();
    taskTitleController.clear();
  }

  Future<void> _addTaskToOldCategory(AddToOldCategoryEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.addToOldCategoryLoading());
    final result = await addTask(AddTaskParam(
      categoryTitle: event.categoryTitle,
      taskTitle: taskTitleController.text,
      description: "",
    ));
    result.fold(
      (l) => emit(TaskState.addToOldCategoryError(message: l.message)),
      (r) => emit(const TaskState.addToOldCategorySuccess()),
    );
    taskTitleController.clear();
  }

  Future<void> _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.deleteTasksLoading());
    final result = await deleteTask(DeleteTaskParam(
      categoryTitle: event.categoryTitle,
      taskTitle: event.taskTitle,
    ));
    result.fold(
      (l) => emit(TaskState.deleteTaskError(l.message)),
      (r) => emit(const TaskState.deleteTaskSuccess()),
    );
  }

  Future<void> _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.updateTaskLoading());
    final result = await updateTask(UpdateTaskParam(
      categoryTitle: event.categoryTitle,
      oldTitle: event.oldTitle,
      update: updatedTitleController.text,
    ));
    result.fold(
      (l) => emit(TaskState.updateTaskError(l.message)),
      (r) => emit(const TaskState.updateTaskSuccess()),
    );
    updatedTitleController.clear();
  }

  Future<void> _fetchAllTask(FetchTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.deleteTasksLoading());
    final result = await fetchAllTasks(const NoParam());
    result.fold(
      (l) => emit(TaskState.fetchTasksError(message: l.message)),
      (r) => emit(TaskState.fetchTasksSuccess(r)),
    );
  }

  Future<void> _markAsComplete(MarkTaskAsCompleteEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.markAsCompleteLoading());
    final result = await markTaskAsComplete(
      MarkTaskAsCompleteParam(
        categoryTitle: event.categoryTitle,
        taskTitle: event.taskTitle,
      ),
    );
    result.fold(
      (l) => emit(TaskState.markAsCompleteError(message: l.message)),
      (r) => emit(const TaskState.markAsCompleteSuccess()),
    );
  }
}
